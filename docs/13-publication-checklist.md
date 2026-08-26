# 13 — Public Repository Publishing Checklist

Run this before making documentation public.

## Content

- [ ] No real API token secrets
- [ ] No passwords
- [ ] No SSH private keys
- [ ] No recovery codes
- [ ] No authentication cookies
- [ ] No customer personal information
- [ ] No private database credentials
- [ ] No private certificates
- [ ] No Terraform state
- [ ] No backup archives
- [ ] No sensitive logs

## Infrastructure metadata

- [ ] Screenshots reviewed
- [ ] Account IDs removed when unnecessary
- [ ] Zone IDs removed when unnecessary
- [ ] Real origin IPs removed when unnecessary
- [ ] Internal hostnames sanitized
- [ ] Customer names sanitized
- [ ] Email addresses reviewed
- [ ] QR codes reviewed
- [ ] Terminal history reviewed

## Git

- [ ] `.gitignore` reviewed
- [ ] GitHub secret scanning status reviewed
- [ ] GitHub push protection status reviewed
- [ ] Repository security settings reviewed
- [ ] Previous commits inspected
- [ ] No secrets were committed earlier
- [ ] Repository ownership/use terms reviewed (no additional open-source license is currently applied)
- [ ] README states project is unofficial

## Accuracy

- [ ] Cloudflare dashboard steps checked against current official docs
- [ ] Deprecated terminology removed
- [ ] Security claims are not absolute
- [ ] Examples are clearly examples


## GitHub note

GitHub currently provides secret scanning for public repositories and supports push protection for supported secret patterns. These controls reduce risk but do not detect every possible secret or sensitive operational detail.

A manual review is still required before publication.

## Source notes

- Secret scanning alerts: https://docs.github.com/en/code-security/concepts/secret-security/about-alerts
- Push protection: https://docs.github.com/en/code-security/how-tos/secure-your-secrets/prevent-future-leaks/enable-push-protection
- Repository security settings: https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-security-and-analysis-settings-for-your-repository
