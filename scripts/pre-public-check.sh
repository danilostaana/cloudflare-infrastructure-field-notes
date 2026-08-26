#!/usr/bin/env bash
set -euo pipefail

echo "Running basic public-repository checks..."

fail=0
tmp_file="$(mktemp)"
trap 'rm -f "$tmp_file"' EXIT

# Patterns intentionally focus on high-risk credential material.
patterns=(
  '-----BEGIN (OPENSSH |RSA |EC |DSA )?PRIVATE KEY-----'
  'cfut_[A-Za-z0-9_-]{20,}'
  'cfat_[A-Za-z0-9_-]{20,}'
  'cfk_[A-Za-z0-9_-]{20,}'
  '(password|passwd|secret|api[_-]?key|api[_-]?token)[[:space:]]*=[[:space:]]*[^[:space:]#]{8,}'
  'Authorization:[[:space:]]*Bearer[[:space:]]+[A-Za-z0-9._~+/-]{20,}'
)

for pattern in "${patterns[@]}"; do
  if grep -RInE \
      --exclude-dir=.git \
      --exclude="pre-public-check.sh" \
      --exclude="*.zip" \
      "$pattern" . >"$tmp_file" 2>/dev/null; then
    echo
    echo "Potential sensitive pattern found:"
    cat "$tmp_file"
    fail=1
  fi
done

echo
echo "Checking for high-risk filenames..."

while IFS= read -r path; do
  case "$path" in
    "./.env.example") continue ;;
  esac
  echo "Potentially sensitive file: $path"
  fail=1
done < <(
  find . -type f \
    \( -name ".env" -o -name ".env.*" -o \
       -name "*.pem" -o -name "*.key" -o -name "*.p12" -o -name "*.pfx" -o \
       -name "terraform.tfstate" -o -name "terraform.tfstate.*" -o \
       -name "*.sqlite" -o -name "*.sqlite3" -o -name "*.sql" \) \
    -not -path "./.git/*" \
    | sort
)

echo
echo "Manual review is still required:"
echo "- screenshots and image metadata"
echo "- browser URLs and terminal history"
echo "- account/zone IDs"
echo "- real domains and origin IPs"
echo "- customer/client information"
echo "- Git history and previous commits"
echo "- CI artifacts and logs"
echo "- Terraform state and backups"
echo "- secrets not covered by known patterns"

if [ "$fail" -ne 0 ]; then
  echo
  echo "Review findings before publishing."
  exit 1
fi

echo
echo "No listed high-risk patterns or filenames were found."
echo "This check is intentionally incomplete and is not a security guarantee."
