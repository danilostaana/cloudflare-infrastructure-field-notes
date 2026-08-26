# Cloudflare Infrastructure Field Notes

These notes document how I organize and maintain Cloudflare infrastructure across personal, business, and client-owned environments.

I started keeping them while working through my own setup. I wanted a clear record of what I configured, why I made certain decisions, what I checked before making changes, and how I handled problems when something did not work as expected.

My approach starts with ownership:

```text
My Cloudflare user
│
├── Personal Infrastructure
│   └── resources I personally own
│
├── Business Infrastructure
│   └── resources owned by my business
│
└── Client-owned Cloudflare accounts
    └── the client owns the account and grants my work identity the access it needs
```

The goal is straightforward: keep ownership clear, avoid unnecessary access, keep credentials out of public repositories, and make future maintenance or handover easier.

This is how I currently approach the work. It is not presented as the only correct way to configure Cloudflare, and it should not be treated as a substitute for current official documentation. Different environments have different technical, security, operational, contractual, and compliance requirements.

**This is independent documentation and is not affiliated with, sponsored by, or endorsed by Cloudflare.**

**Last source review:** 2026-08-26. See [Source verification](docs/16-source-verification.md).

---

## What I am trying to solve

At the beginning, putting everything in one place can look convenient:

```text
One account
├── personal domain
├── homelab
├── business website
├── Client A
└── Client B
```

The difficulty usually appears later. Ownership, billing, access, recovery, and handover become harder to reason about when unrelated resources are mixed together.

Before deciding where something belongs, I ask:

1. Who owns this resource?
2. Who should control it if I am no longer involved?
3. Who should be able to grant or revoke access?
4. Does this resource belong to me, a business, or a client?
5. Would a mistake here affect unrelated systems?

That leads to three practical boundaries:

| Boundary | Owner | Typical examples |
|---|---|---|
| Personal | Me as an individual | personal domains, homelab, experiments |
| Business | The business | business domains, production applications |
| Client | The client | client domains, DNS, client production services |

Cloudflare distinguishes user profiles, accounts, and zones. A user can belong to multiple accounts, so managing several environments does not require putting all of those environments under the same ownership boundary.

---

## What these notes cover

The focus is on the parts I need to understand and maintain consistently:

1. Cloudflare user, account, and zone boundaries;
2. personal and business ownership separation;
3. client-owned infrastructure;
4. member access and least privilege;
5. API credential handling;
6. Git and secret hygiene;
7. onboarding and offboarding;
8. recovery planning;
9. incident response;
10. troubleshooting and problem records;
11. publication checks for public documentation;
12. decision records and source verification.

Cloudflare Zero Trust, Tunnel architecture, WAF engineering, Workers, R2, D1, and advanced infrastructure automation are separate subjects. If I document those later, I would rather give them enough context than force them into an unrelated section.

---

## Reading order

1. [How I think about the account model](docs/00-overview.md)
2. [My step-by-step account setup](docs/01-step-by-step-account-setup.md)
3. [Personal infrastructure](docs/02-personal-infrastructure.md)
4. [Business infrastructure](docs/03-business-infrastructure.md)
5. [Client-owned infrastructure](docs/04-client-owned-infrastructure.md)
6. [Member access and least privilege](docs/05-member-access.md)
7. [Public and private boundaries](docs/06-public-private-boundary.md)
8. [Git and secrets](docs/07-git-and-secrets.md)
9. [API token hygiene](docs/08-api-token-hygiene.md)
10. [Client onboarding](docs/09-client-onboarding.md)
11. [Client offboarding](docs/10-client-offboarding.md)
12. [Recovery planning](docs/11-recovery.md)
13. [Incident response](docs/12-incident-response.md)
14. [Pre-publication review](docs/13-publication-checklist.md)
15. [Decision log template](docs/14-decision-log-template.md)
16. [Problem and solution records](docs/15-problem-solution-records.md)
17. [Source verification](docs/16-source-verification.md)

---

## Public notes and private operational information

Useful documentation does not require exposing the live environment.

| Reasonable to document publicly | Keep private or restrict |
|---|---|
| architecture concepts | passwords |
| sanitized diagrams | API token secrets |
| example domains | private keys |
| generic role examples | recovery codes |
| `.env.example` | real `.env` files |
| procedures | confidential client information |
| troubleshooting method | sensitive logs |
| lessons learned | Terraform state |
| generic configuration examples | production backups |

I review screenshots as carefully as text. Browser URLs, account identifiers, email addresses, terminal history, customer names, internal hostnames, and tokens can be exposed accidentally.

---

## Problems and solutions

When something fails, I document the problem rather than only recording the final fix.

A useful record includes:

```text
What I was trying to do
        ↓
What happened
        ↓
What I expected
        ↓
What recently changed
        ↓
What I checked
        ↓
What the evidence showed
        ↓
Root cause, if confirmed
        ↓
Corrective action
        ↓
Validation
        ↓
Rollback
        ↓
Prevention
```

If I cannot confirm the root cause, I say so. A workaround is not the same as a confirmed diagnosis.

See [Problem and solution records](docs/15-problem-solution-records.md).

---

## Security approach

I treat security as part of the operating process rather than a statement that a setup is simply "secure."

The recurring checks in these notes include:

- clear ownership;
- least-privilege access;
- named user identities instead of shared passwords;
- scoped API credentials;
- no secrets committed to Git;
- recovery planning;
- access removal during offboarding;
- validation after changes;
- rollback planning;
- review of current official documentation.

The appropriate controls still depend on the actual environment and its threat model.

---

## Contributions

Corrections and improvements are welcome through GitHub issues and pull requests.

Any contribution should remain sanitized. Real credentials, private keys, customer information, confidential employer material, production dumps, or copied material that the contributor does not have permission to publish should not be submitted.

See [CONTRIBUTING.md](CONTRIBUTING.md) and [SECURITY.md](SECURITY.md).

---

## Copyright and use

Copyright © 2026 danilostaana. All rights reserved.

No additional open-source or Creative Commons license is currently applied to my original written material in this repository.

The repository is publicly readable, and GitHub's platform may provide functionality such as viewing and forking public repositories under GitHub's Terms of Service. Public availability does not, by itself, grant broad permission to republish, sell, redistribute, or reproduce substantial portions of my original material outside rights provided by applicable law or GitHub's terms.

For broader reuse of substantial original material, permission should be requested first.

---

## Disclaimer

These notes are a record of my own implementation decisions, experiments, troubleshooting, and experience. They are provided for informational and educational purposes.

They are not official Cloudflare documentation, legal advice, a security certification, or a warranty that a particular procedure will be correct for another environment.

Cloudflare features, interfaces, APIs, permissions, plan availability, and recommended practices can change. I verify platform-specific details against current official documentation before applying them to production.

Anyone who chooses to apply an idea, command, configuration, or procedure from these notes is responsible for evaluating, testing, backing up, and validating it for their own environment and requirements. I do not promise that these notes are error-free, complete, continuously current, or suitable for every system.

---

## Third-party references

Cloudflare and related product names are trademarks of their respective owners. Their names are used only to identify the products and services discussed.

External documentation is referenced rather than reproduced. Third-party material remains subject to its own copyright, license, and terms.

See [REFERENCES.md](REFERENCES.md).
