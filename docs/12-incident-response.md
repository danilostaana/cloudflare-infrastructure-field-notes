# 12 — Incident Response

The response depends on what was exposed. The priority is to remove attacker access, rotate affected credentials, verify configuration, and preserve enough evidence to understand what happened.

## If my Cloudflare user account may be compromised

Cloudflare's current account-security guidance includes:

1. change the password;
2. revoke suspicious active sessions;
3. make sure 2FA is enabled;
4. change affected API keys and tokens;
5. review account activity and configuration for unauthorized changes.

I also secure the email account connected to the Cloudflare profile because email is part of the recovery path.

## If a Cloudflare API credential is exposed

1. Revoke or rotate the exposed credential immediately.
2. Identify which user/account, permissions, and resources the credential could access.
3. Replace the credential in applications, CI/CD, and secret stores.
4. Confirm the old credential no longer works.
5. Review recent account changes and relevant logs/audit records.
6. Search Git history, issues, pull requests, CI logs, chat, screenshots, and backups for additional copies.
7. Determine how the credential leaked.
8. Add a preventive control.

Do not delay revocation while cleaning Git history.

## If GitHub contains a secret

Deleting the file from the latest commit is not enough because previous commits and forks/clones may still contain the value.

My order of operations is:

1. revoke or rotate the secret;
2. update dependent systems;
3. verify the old secret is unusable;
4. clean repository history if necessary;
5. review forks, artifacts, logs, issues, and pull requests;
6. document the incident privately.

GitHub secret scanning and push protection are useful controls, but they are not a reason to keep a leaked credential active.

## If a client credential is exposed

I notify the authorized client contact according to the applicable contract, incident process, and legal/compliance requirements.

I do not hide an exposure simply because the credential was removed quickly.

## Source notes

- Cloudflare compromised-account guidance: https://developers.cloudflare.com/fundamentals/account/account-security/secure-a-compromised-account/
- Cloudflare active sessions: https://developers.cloudflare.com/fundamentals/account/account-security/manage-active-sessions/
- GitHub secret scanning: https://docs.github.com/en/code-security/concepts/secret-security/about-alerts
