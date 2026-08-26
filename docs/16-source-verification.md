# 16 — Source Verification

Last reviewed: **2026-08-26**

I do not want this repository to rely on a generated explanation that merely sounds correct. Before publishing this revision, I checked the Cloudflare- and GitHub-specific claims against current official documentation.

## Verified Cloudflare points

### Accounts, users, and zones

Confirmed:

- Cloudflare distinguishes user profiles, accounts, and zones.
- An account can contain multiple users and zones.
- A user can belong to multiple accounts.
- Accounts maintain their own settings, members, billing profiles, and account-level configurations.

Source:  
https://developers.cloudflare.com/fundamentals/concepts/accounts-and-zones/

### Member permissions

Confirmed:

- member access is policy-based;
- a policy contains an actor, role, and scope;
- Cloudflare recommends minimum required access;
- scopes can include account, domain, domain-group, and supported resource-specific scopes;
- multiple policies and User Group permissions are additive;
- managing account members requires Super Administrator permission and a verified email address.

Sources:

- https://developers.cloudflare.com/fundamentals/manage-members/
- https://developers.cloudflare.com/fundamentals/manage-members/manage/
- https://developers.cloudflare.com/fundamentals/manage-members/policies/
- https://developers.cloudflare.com/fundamentals/manage-members/roles/
- https://developers.cloudflare.com/fundamentals/manage-members/scope/
- https://developers.cloudflare.com/fundamentals/manage-members/user-groups/

### Two-factor authentication

Confirmed:

- Cloudflare recommends enabling 2FA;
- Cloudflare recommends multiple 2FA factors and securely storing backup codes;
- security-key authentication can use WebAuthn-compatible built-in or hardware authenticators.

Source:  
https://developers.cloudflare.com/fundamentals/user-profiles/2fa/

### API authentication

Confirmed:

- Cloudflare recommends API tokens instead of the legacy Global API Key whenever possible;
- user API tokens act on behalf of a user;
- Account API tokens are account-owned service principals intended for durable integrations such as CI/CD;
- Account API token support depends on the API endpoint;
- creating Account API tokens requires Super Administrator permission;
- API-token secrets are shown only once;
- API tokens can be restricted by permissions/resources and, where appropriate, IP/TTL restrictions.

Sources:

- https://developers.cloudflare.com/fundamentals/api/get-started/
- https://developers.cloudflare.com/fundamentals/api/get-started/create-token/
- https://developers.cloudflare.com/fundamentals/api/get-started/account-owned-tokens/
- https://developers.cloudflare.com/fundamentals/api/get-started/keys/
- https://developers.cloudflare.com/fundamentals/api/reference/permissions/

## Verified GitHub points

Confirmed:

- a public repository can be viewed and forked through GitHub's functionality;
- GitHub states that no additional license is required merely to make a repository public; without an added license, default copyright rules apply while GitHub's Terms still allow platform users to view and fork public repositories;
- GitHub provides secret-scanning capabilities for public repositories;
- push protection can block supported secrets before they are introduced;
- these controls do not replace manual review or credential rotation after a leak.

Sources:

- https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository
- https://docs.github.com/en/site-policy/github-terms/github-terms-of-service
- https://docs.github.com/en/code-security/concepts/secret-security/about-alerts
- https://docs.github.com/en/code-security/how-tos/secure-your-secrets/prevent-future-leaks/enable-push-protection

## Design choices that are mine, not Cloudflare requirements

The following are my organizational choices:

- naming accounts `Personal Infrastructure` and `Business Infrastructure`;
- separating personal and business infrastructure by ownership;
- preferring client-owned Cloudflare accounts for client-owned assets;
- using a quarterly access-review cadence;
- keeping a public sanitized knowledge repository separate from private operational records;
- using the problem/solution and decision-log templates in this repository.

These are documented operating practices, not claims that Cloudflare requires this exact structure.

## Re-check policy

I re-check official documentation when:

- a dashboard workflow changes;
- a Cloudflare role or scope behaves differently;
- an API authentication method changes;
- GitHub changes repository-security features;
- a procedure will be used for a production change;
- a contributor reports that a documented step is outdated.
