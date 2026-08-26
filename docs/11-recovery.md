# 11 — Recovery and Break-Glass Planning

Security also means being able to recover safely.

## Questions to answer

- What happens if the primary administrator loses access?
- What happens if the primary email is compromised?
- Who can restore business access?
- Who can restore client access?
- Where are recovery codes stored?
- Who controls billing?
- Who controls the domain registrar?
- Is there a second authorized administrator for important business infrastructure?

## Private recovery record

Keep sensitive recovery material outside the public repository.

The public repository should document the procedure, not the actual recovery secrets.

Example public procedure:

```text
1. Verify account ownership.
2. Use approved recovery channel.
3. Restore administrator access.
4. Review member list.
5. Revoke suspicious sessions/tokens.
6. Rotate affected credentials.
7. Review DNS and account changes.
8. Record the incident.
```
