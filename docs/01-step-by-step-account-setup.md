# 01 — Step-by-Step Account Setup

This is the practical setup sequence.

## Phase 1 — Secure your user profile

Before organizing accounts:

1. Verify the email address associated with the Cloudflare user profile.
2. Use a unique password and store it in a password manager.
3. Enable Cloudflare two-factor authentication (2FA). Prefer a phishing-resistant security key or built-in WebAuthn authenticator when practical.
4. Configure more than one 2FA factor and store Cloudflare backup codes securely so one lost device does not become a lockout.
5. Secure the email account tied to the Cloudflare login with MFA as well.
6. Do not share your personal Cloudflare login with another person.

Your login is an identity. Access for other people should be granted through membership and permissions instead of password sharing.

## Phase 2 — Create the Personal Infrastructure account

Create an account named something clear, for example:

```text
Personal Infrastructure
```

Use it for resources you personally own:

- personal domains;
- homelab services;
- experiments;
- personal development projects;
- personally owned servers.

Do not put client-owned resources here.

## Phase 3 — Create the Business Infrastructure account

When you have business-owned resources, create:

```text
Business Infrastructure
```

Use it for:

- business domains;
- company websites;
- production applications;
- commercial services;
- infrastructure paid for and owned by the business.

If you do not yet have real business-owned infrastructure, you do not need to create this account immediately.

## Phase 4 — Handle clients differently

For a client:

1. Ask the client to create or use its own Cloudflare account.
2. Confirm that the client's authorized owner controls the account.
3. Ask a client Super Administrator with a verified email address to invite your work email and assign the required policies.
4. Request only the access you need.
5. Avoid Super Administrator unless your responsibilities genuinely require it.
6. Record the ownership and access arrangement in the client documentation.
7. Never ask the client to give you their password.

The preferred ownership model is:

```text
CLIENT
owns account
   │
   ├── client administrator
   └── your work email
       receives delegated access
```

not:

```text
YOU
own account
   │
   └── client depends on you
       to reach its own infrastructure
```

## Phase 5 — Add domains to the correct account

Before adding a domain:

1. Identify the owner.
2. Identify who pays for the domain and Cloudflare services.
3. Identify who should control DNS.
4. Choose the corresponding Cloudflare account.
5. Add the zone there.
6. Confirm nameserver/DNS onboarding according to Cloudflare's current documentation.
7. Record the date and owner in private operational documentation.

## Phase 6 — Review members

For each account:

1. Open the member/access management area.
2. List every member.
3. Remove unknown or obsolete users.
4. Check each member's role.
5. Check the scope of each role.
6. Give the minimum necessary access.
7. Avoid broad account-wide access when a narrower domain/resource scope works.
8. Review again after major project changes.

## Phase 7 — Create API tokens only when needed

Do not create API tokens "just in case."

Choose the token type deliberately. A user API token acts on behalf of a user and is suitable for user-bound or ad hoc automation. An Account API token is owned by the Cloudflare account and is better suited to durable integrations such as CI/CD when the required API endpoints support account tokens. Creating an Account API token requires Super Administrator permission.

For each token:

1. Define the exact task.
2. Determine the minimum required permissions.
3. Restrict the resource scope where possible.
4. Give it a descriptive name.
5. Store the secret in an appropriate secret store.
6. Never commit the token to Git.
7. Record who/what uses it.
8. Revoke it when the automation is retired.

## Phase 8 — Document ownership

Keep a private inventory such as:

```text
Resource:
Owner:
Cloudflare Account:
Zone:
Purpose:
Primary Administrator:
Secondary Administrator:
Billing Owner:
Created:
Last Reviewed:
Notes:
```

Do not put sensitive values in a public repository.

## Phase 9 — Test offboarding before you need it

For business and client environments, ask:

> If I lose access today, can the rightful owner continue operating the service?

If the answer is no, fix the ownership model before the environment becomes more important.

## Phase 10 — Review quarterly or after major changes

Review:

- members;
- API tokens;
- unused domains;
- ownership;
- billing contacts;
- recovery access;
- automation credentials;
- old contractors;
- abandoned test resources.

Security deteriorates when temporary access becomes permanent.


## Source notes

- Cloudflare account model: https://developers.cloudflare.com/fundamentals/concepts/accounts-and-zones/
- Cloudflare 2FA: https://developers.cloudflare.com/fundamentals/user-profiles/2fa/
- Manage account members: https://developers.cloudflare.com/fundamentals/manage-members/manage/
- API token creation: https://developers.cloudflare.com/fundamentals/api/get-started/create-token/
- Account API tokens: https://developers.cloudflare.com/fundamentals/api/get-started/account-owned-tokens/
