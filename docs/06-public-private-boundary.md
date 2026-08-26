# 06 — Public vs Private Boundary

Public documentation is useful. Public operational secrets are not.

## Safe public information

Usually suitable for public examples:

- high-level architecture;
- generic account structure;
- example domains;
- reserved documentation IP addresses;
- `.env.example`;
- redacted screenshots;
- reusable scripts without secrets;
- generic permission examples;
- security checklists.

## Keep private

Do not publish:

- API token secrets;
- Global API Key;
- SSH private keys;
- recovery codes;
- passwords;
- database credentials;
- customer personal information;
- private certificates;
- Terraform state;
- backup archives;
- sensitive logs;
- authentication cookies;
- session tokens;
- internal incident details that expose exploitable weaknesses.

## Context matters

A hostname or IP address is not automatically a secret.

However, publishing enough individually harmless details can reveal a complete operational map.

Think about **aggregation risk**.

Example:

```text
Public post 1: server hostname
Public post 2: admin path
Public post 3: origin IP
Public post 4: software version
Public post 5: screenshot with account ID
```

Each item may look harmless alone. Together they may become useful reconnaissance.

## Screenshot rule

Before publishing a screenshot, inspect:

- browser address bar;
- account IDs;
- zone IDs;
- email addresses;
- customer names;
- token names;
- internal hostnames;
- IP addresses;
- billing details;
- notification banners;
- QR codes;
- API responses;
- command-line history.

Crop or redact before publishing.
