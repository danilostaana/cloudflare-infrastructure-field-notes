# 09 — Client Onboarding

## Before access

Confirm:

- legal/business name;
- authorized client contact;
- domains in scope;
- expected tasks;
- billing responsibility;
- who should approve sensitive changes.

## Access flow

1. Client signs into its own Cloudflare account.
2. Client invites your work email.
3. Client assigns the required role/scope.
4. You accept using your own Cloudflare user profile.
5. You confirm the correct account before making changes.
6. You document what access was granted.
7. You avoid collecting the client's password.

## Initial inventory

Record privately:

```text
Client:
Cloudflare account:
Domains in scope:
Access granted:
Primary client owner:
Your role:
Start date:
Project:
Offboarding owner:
```

## Before changing DNS

Confirm:

- current DNS records;
- mail-related records;
- verification records;
- production dependencies;
- rollback path.

A DNS change can affect websites, email, APIs, verification, and third-party integrations.
