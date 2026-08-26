# 05 — Member Access and Least Privilege

Cloudflare account-member access is policy-based.

A policy combines:

1. an **actor** — the user receiving access;
2. a **role** — what that user is allowed to do;
3. a **scope** — where the role applies.

The practical rule I use is:

> Give a person enough access to do the job, but no more.

## Scope matters

Cloudflare currently supports account-level, domain, domain-group, and certain resource-specific scopes.

Examples:

- a developer who manages only a staging domain should not automatically receive access to every production domain;
- someone responsible for billing does not necessarily need DNS edit access;
- a DNS operator does not necessarily need member-management access;
- a person who manages one supported resource-specific product can be scoped to that resource when the relevant role supports it.

Not every role can be used with every scope. I check the current Cloudflare role and scope documentation before assigning access.

## Effective permissions are additive

A member can receive multiple policies. Cloudflare also supports User Groups.

The effective permission set is the **union** of the permissions granted directly to the member and permissions inherited through groups. This means a narrowly scoped direct policy does not make the user narrowly scoped if another policy or group grants broader access.

For access reviews, I check both direct member policies and group membership.

## Super Administrator

`Super Administrator - All Privileges` is a highly privileged account-scoped role. Cloudflare documents that it can manage members, billing, purchases, settings, and Account API tokens.

I reserve it for people who genuinely require that level of control.

Cloudflare currently requires a Super Administrator with a verified email address to manage account members.

## Periodic access review

For every account, I review:

- active members;
- direct policies;
- User Group membership where used;
- former employees;
- former contractors;
- old agencies;
- broad account-level access;
- temporary access that was never removed.

## Client access

When joining a client account:

1. I use my own named work identity.
2. A client Super Administrator invites that identity.
3. I verify the account name before making changes.
4. I confirm which domains/resources are in scope.
5. I confirm the roles and scopes I actually received.
6. I avoid changes outside the approved project.
7. I remove or ask the client to revoke access when the engagement ends.

## Source notes

- Members and permissions: https://developers.cloudflare.com/fundamentals/manage-members/
- Policies: https://developers.cloudflare.com/fundamentals/manage-members/policies/
- Roles: https://developers.cloudflare.com/fundamentals/manage-members/roles/
- Role scopes: https://developers.cloudflare.com/fundamentals/manage-members/scope/
- User Groups: https://developers.cloudflare.com/fundamentals/manage-members/user-groups/
- Manage members: https://developers.cloudflare.com/fundamentals/manage-members/manage/
