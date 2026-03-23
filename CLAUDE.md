# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

GCP seed infrastructure repository that establishes foundational GCP resources (projects, service accounts, Terraform state buckets) required before other infrastructure can be deployed. Expects GCP projects to be pre-created with a Root/Admin service account available.

## Common Commands

### Local Development

```bash
# Initialize Terraform locally (validates/creates state bucket if needed)
./scripts/tf-local-init.sh

# Run full local QA checks (format, validate, lint, security, compliance, shellcheck)
./scripts/check.sh
```

### Terraform Operations

```bash
# Format check
terraform fmt -check -recursive

# Validate
terraform validate

# Plan (requires initialized backend)
terraform plan -no-color -out=plan.out

# Apply
terraform apply -auto-approve
```

### Individual QA Tools

```bash
# TFLint
tflint --minimum-failure-severity=error

# Trivy (config scan)
trivy config . --ignorefile .trivyignore

# Checkov
checkov --directory . --skip-check CKV_AWS_20,CKV_GCP_62

# ShellCheck
shellcheck -S info scripts/*.sh
```

## Architecture

### Module Structure

The root module instantiates two child modules:

- **`platform/`** — Platform project infrastructure: admin SA with Artifact Registry admin + Logging writer roles, Terraform state bucket
- **`go-playground/`** — Go language project infrastructure: admin SA with Logging writer role only, Terraform state bucket

Each module follows the same pattern:
1. Creates a GCS state bucket (`{project_name}-terraform-state`) in `europe-west3`
2. Creates an admin service account (`{project_name}-admin-sa`)
3. Assigns IAM roles

### Naming Convention

Resources are named using `{project_name}-{resource_postfix}` where `resource_postfix` is provided as a variable (e.g., `GCP_RESOURCE_POSTFIX` secret in CI).

### State Backend

Remote state in GCS. Backend bucket is passed via `-backend-config` (not hardcoded). The `scripts/tf-local-init.sh` handles local initialization with bucket validation.

### GCS Bucket Standards

All state buckets enforce: versioning enabled, soft-delete 7 days, public access prevention, uniform bucket-level access, STANDARD storage class, `force_destroy = false`.

## CI/CD

Three GitHub Actions workflows:

- **`plan.yml`**: Triggers on push to `main` — runs security/compliance/lint/QA checks then `terraform plan`
- **`apply.yml`**: Manual dispatch only — runs security/compliance checks then `terraform apply`
- **`script-qa.yml`**: Triggers on changes to `scripts/` — runs ShellCheck

All workflows use OIDC for GCP authentication (no long-lived credentials).

## Known Accepted Exceptions

These suppressions are intentional and documented inline:

| Tool | Suppressed | Reason |
|------|-----------|--------|
| Trivy | AVD-GCP-0066 | Accepted risk |
| Trivy/Checkov | CKV_GCP_62 | Accepted risk |
| TFLint | `terraform_module_pinned_source` | Intentional flexibility |

## Key Variables

- `region`: Default `europe-west3`
- `gcp_resource_postfix`: Suffix appended to all resource names — set via `defaults.auto.tfvars` locally or CI secret

## Secrets Required (CI)

`GCP_RESOURCE_POSTFIX`, `SEED_SA_EMAIL_ADDRESS`, `WORKLOAD_IDENTITY_PROVIDER_NAME`, `TERRAFORM_STATE_BUCKET`, `TF_LOG`
