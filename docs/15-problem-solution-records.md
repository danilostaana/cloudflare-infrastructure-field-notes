# 15 — Problem and Solution Records

A setup guide explains the expected path. Real infrastructure also needs a record of what happens when the expected path fails.

I use this section to document problems I actually encounter while building or maintaining the environment. The purpose is not to make the project look perfect. The useful part is recording how the problem was identified, investigated, fixed, and prevented from recurring.

## Why keep these records?

A good troubleshooting record answers more than "what command fixed it?"

It should preserve:

- what was supposed to happen;
- what actually happened;
- what changed before the problem appeared;
- what evidence was collected;
- which hypotheses were tested;
- the root cause, if known;
- the corrective action;
- how the fix was validated;
- how to roll back;
- what should prevent the same issue later.

This makes the repository useful as both operational documentation and a technical record.

---

## Problem record template

Copy this template for each real issue.

```markdown
# Problem: Short descriptive title

## Status

Resolved / Workaround / Investigating / Monitoring

## Date

YYYY-MM-DD

## Environment

Personal / Business / Client / Lab

Do not publish sensitive customer or production identifiers.

## What I was trying to do

Describe the intended change or expected behavior.

## Symptoms

What did I observe?

- error message;
- unexpected DNS response;
- HTTP status;
- failed deployment;
- inaccessible service;
- permission error;
- incorrect redirect;
- other measurable behavior.

Sanitize secrets and sensitive infrastructure information before publishing.

## Expected behavior

What should have happened?

## Actual behavior

What happened instead?

## Recent changes

What changed shortly before the problem appeared?

## Initial hypotheses

1. Possible cause
2. Possible cause
3. Possible cause

Do not present a hypothesis as the root cause until evidence supports it.

## Investigation

### Check 1

What I checked:

What I observed:

What this ruled in or ruled out:

### Check 2

What I checked:

What I observed:

What this ruled in or ruled out:

## Root cause

State the confirmed cause.

If the cause is not confirmed, write:

> Root cause not confirmed.

Do not invent certainty.

## Solution

Document the corrective action step by step.

1.
2.
3.

## Validation

Explain how I verified the fix.

Examples:

- DNS query returned the expected answer;
- HTTPS request returned the expected status;
- application became reachable;
- access was correctly denied for an unauthorized identity;
- deployment completed successfully;
- logs no longer showed the original error.

## Rollback

How could I safely return to the previous state if the fix caused another problem?

## Security impact

Did the problem or fix affect:

- authentication;
- authorization;
- DNS;
- origin exposure;
- credentials;
- customer data;
- logging;
- availability?

If a secret was exposed, rotate/revoke it before treating the incident as resolved.

## Prevention

What can reduce the chance of recurrence?

Examples:

- documentation update;
- monitoring;
- validation script;
- permission review;
- backup;
- configuration test;
- change-control step.

## What I learned

Short explanation in my own words.

## References

Link the official documentation or other authoritative material used during diagnosis.
```

---

## Example — DNS change caused a service to stop resolving

> This is a generic example using documentation-only names and addresses. It is not a production incident.

### What I was trying to do

I was reorganizing DNS records for `app.example.com`.

### Symptoms

After the change, the hostname no longer resolved to the expected destination.

### Expected behavior

`app.example.com` should resolve to the intended service.

### Actual behavior

DNS queries returned an unexpected result.

### Investigation

I first checked the Cloudflare DNS record instead of immediately changing unrelated settings.

I then compared:

1. hostname;
2. record type;
3. target/value;
4. proxy status where relevant;
5. authoritative DNS response;
6. recent DNS changes.

This narrowed the problem to the record that had just been edited.

### Root cause

The DNS record contained the wrong target.

### Solution

I corrected the record and saved the change.

### Validation

I queried DNS again and confirmed that the authoritative result matched the intended value. I then tested the application separately.

### Prevention

Before changing important DNS records, I now record the previous value and define a rollback value.

### What I learned

Troubleshooting was faster when I started with the most recent change and verified each layer separately instead of changing several settings at once.

---

## Rules for public troubleshooting notes

A useful incident record does not require publishing the entire environment.

Before committing a problem/solution record, remove or replace:

- API token secrets;
- passwords;
- session cookies;
- private keys;
- customer personal information;
- confidential client names;
- sensitive origin addresses;
- account and zone identifiers when unnecessary;
- internal-only hostnames when unnecessary;
- raw logs containing secrets;
- screenshots containing private information.

Use examples such as:

```text
example.com
app.example.com
192.0.2.10
198.51.100.20
203.0.113.30
```

The objective is to preserve the **technical reasoning** while removing information that does not need to be public.
