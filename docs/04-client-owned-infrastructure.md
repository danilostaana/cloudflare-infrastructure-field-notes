# 04 — Client-Owned Infrastructure

## Principle

The client should own infrastructure that belongs to the client.

Your role is administrator, developer, consultant, or operator — not permanent owner by default.

## Preferred workflow

```text
Client creates/controls Cloudflare account
                │
                ├── Client owner/admin
                │
                └── Invited work email
                     └── scoped permissions
```

## Why this matters

If the relationship ends:

- the client keeps its account;
- the client keeps billing;
- the client keeps control of its Cloudflare account, zones, and settings;
- your access can be revoked cleanly;
- no account migration is required solely because you leave.

## Do not

- ask for the client's Cloudflare password;
- create every client under your personal account;
- register client assets under your identity without a documented reason;
- make yourself the only recovery path;
- retain access after the engagement ends.

Cloudflare account ownership and domain registration are related operationally but are not the same thing. The domain's registrant and registrar account should also be controlled by the rightful owner. If Cloudflare Registrar is used, verify the registrar-specific ownership and transfer requirements separately.

## Exception handling

Sometimes a freelancer or agency temporarily creates infrastructure during onboarding.

If that happens, document:

- who ultimately owns it;
- when it will be transferred;
- who pays;
- who has admin access;
- the transfer/offboarding procedure.

Temporary ownership should not silently become permanent ownership.


## Source notes

- Cloudflare accounts, zones, and profiles: https://developers.cloudflare.com/fundamentals/concepts/accounts-and-zones/
- Manage account members: https://developers.cloudflare.com/fundamentals/manage-members/manage/
