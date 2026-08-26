# 08 — API Token Hygiene

Cloudflare recommends API tokens instead of the legacy Global API Key whenever possible.

The Global API Key is broad: it inherits the user's access to Cloudflare resources and cannot be narrowed the way an API token can. I do not use it for new automation unless a specific integration leaves no supported alternative.

## User token vs Account API token

Cloudflare currently has two API-token ownership models relevant here:

### User API token

A user token acts on behalf of a particular user and is limited by the permissions available to that user.

I use this model for user-bound or ad hoc scripting where that relationship is appropriate.

### Account API token

An Account API token is owned by the Cloudflare account rather than an individual user. Cloudflare describes these as service principals for durable integrations such as CI/CD.

This is useful when an automation should continue even if the person who originally created the integration later leaves the account.

Important limitations:

- the target API endpoint must support Account API tokens;
- creating an Account API token requires Super Administrator permission;
- the token must still be restricted to the minimum permissions and resources required.

## One token, one purpose

Bad:

```text
one-powerful-token
└── DNS + CI + scripts + deployment + testing
```

Better:

```text
dns-automation
deployment-production
inventory-readonly
ci-worker-deploy
```

The exact separation depends on the application, but each token should have a clear purpose, owner, and lifecycle.

## Token record

I keep a private inventory:

```text
Token name:
Token type: user / account
Purpose:
Owner:
Permissions:
Resource scope:
Used by:
Created:
Expires:
Last reviewed:
Rotation notes:
```

I never record the secret itself in public documentation.

## Lifecycle

1. Create a token only when required.
2. Choose user-owned or account-owned deliberately.
3. Grant only the required permission groups.
4. Restrict resource scope when the API supports it.
5. Consider IP restrictions or an expiration/TTL where suitable.
6. Store the secret in a proper secret store or protected runtime secret.
7. Do not print it in logs.
8. Never commit it to Git.
9. Rotate or revoke it immediately if exposed.
10. Revoke it when the integration is retired.

Cloudflare only displays a newly created token secret once. If I lose it, I create/roll a replacement rather than trying to recover the original secret.

## Source notes

- API authentication: https://developers.cloudflare.com/fundamentals/api/get-started/
- Create API token: https://developers.cloudflare.com/fundamentals/api/get-started/create-token/
- Account API tokens: https://developers.cloudflare.com/fundamentals/api/get-started/account-owned-tokens/
- Global API Key (legacy): https://developers.cloudflare.com/fundamentals/api/get-started/keys/
- API token permissions: https://developers.cloudflare.com/fundamentals/api/reference/permissions/
- Token formats: https://developers.cloudflare.com/fundamentals/api/get-started/token-formats/
