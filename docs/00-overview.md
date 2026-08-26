# 00 — How I Think About the Account Model

## Where I started

My first instinct was to keep everything under one Cloudflare account. That would be convenient, but convenience is not the same as clean ownership.

I expect to manage different kinds of infrastructure:

- things I personally own;
- things a business owns;
- things I administer for clients.

Those resources can have different owners, billing responsibilities, administrators, and handover requirements.

## The distinction that matters

Cloudflare has three concepts I keep separate in my head:

- **User profile** — my identity/login and user-level settings.
- **Account** — the administrative container with members, settings, billing context, zones, and account-level services.
- **Zone** — a domain or delegated domain onboarded to Cloudflare.

A user can belong to multiple Cloudflare accounts. That means I do not need to mix ownership simply to manage several environments from one identity.

## My ownership test

Before I place a resource somewhere, I ask:

1. Who owns it?
2. Who pays for it?
3. Who should be able to revoke my access?
4. Who should retain it if I stop working on it?
5. Who should receive the documentation during handover?
6. Would a mistake here affect unrelated infrastructure?

The first four questions usually make the correct boundary obvious.

## My target structure

```text
My user profile
│
├── Personal Infrastructure
│   ├── personal domains
│   ├── homelab
│   └── experiments
│
├── Business Infrastructure
│   ├── business domains
│   └── business-owned production services
│
└── Accounts owned by clients
    ├── Client A → invites my work identity
    ├── Client B → invites my work identity
    └── Client C → invites my work identity
```

The point is not to create many accounts. The point is to create **clear ownership boundaries**.

## What I avoid

I do not want this:

```text
My Personal Account
├── my domain
├── my lab
├── my business
├── Client A
├── Client B
└── Client C
```

It may work technically, but offboarding and ownership become unnecessarily coupled to me.

## Next

The next document turns this model into an implementation sequence:

[01 — My Step-by-Step Account Setup](01-step-by-step-account-setup.md)
