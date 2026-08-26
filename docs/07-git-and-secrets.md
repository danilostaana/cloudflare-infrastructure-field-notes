# 07 — Git and Secrets

Git should document how infrastructure is built and operated.

Git should not become a secret vault.

## Commit

Good candidates:

- Markdown documentation;
- sanitized diagrams;
- scripts;
- templates;
- Terraform configuration without state/secrets;
- `.env.example`;
- generic CI configuration.

## Do not commit

```text
.env
*.pem
*.key
*.p12
*.pfx
terraform.tfstate
terraform.tfstate.*
database dumps
backup archives
real credentials
private SSH material
```

## Important

Deleting a secret from the latest version of a file does not necessarily remove it from Git history.

If a real credential is committed:

1. assume it is compromised;
2. revoke or rotate it immediately;
3. then clean the repository/history as needed;
4. inspect logs and usage;
5. document the incident privately.

Credential rotation comes before cosmetic cleanup.

## Public/private repository model

```text
PRIVATE REPOSITORY
├── operational configuration
├── internal documentation
└── references to real infrastructure
        │
        └── sanitize intentionally
                ↓
PUBLIC REPOSITORY
├── generic documentation
├── reusable examples
└── safe templates
```

Do not automatically mirror the private repository into the public repository.
