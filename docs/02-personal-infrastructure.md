# 02 — Personal Infrastructure

## Purpose

Personal Infrastructure contains resources that belong to you as an individual.

Examples:

- personal domains;
- homelab services;
- personal VPS instances;
- development experiments;
- non-client hobby applications.

## Good boundary

```text
Personal Infrastructure
├── personal.example
├── lab.example
├── experiments
└── personal services
```

## Avoid

Do not use the personal account as a convenient dumping ground for:

- client domains;
- employer domains;
- company-owned production infrastructure;
- shared client credentials;
- assets that someone else legally owns.

## Why

Personal infrastructure should remain portable and understandable even if your employment, clients, or business structure changes.
