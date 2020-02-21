mkcsr() {
  local commonname="$1"

  if [[ -z "${commonname}" ]]; then
    echo "ERROR: Please provide a domain name to create a CSR for" >&2
    return 1
  fi

  # Check for wildcard cert request
  local dnsname="${commonname/\*/star}"
  local key="${dnsname}.key"
  local csr="${dnsname}.csr"
  local subj="/C=US/ST=Michigan/L=Ann Arbor/O=ProQuest LLC/CN=${commonname}"
  local genrsa_opts=(-out "${key}" 2048)
  local req_opts=(-sha256 -new -key "${key}" -out "${csr}" -subj "${subj}")

  openssl genrsa "${genrsa_opts[@]}" > /dev/null 2>&1
  openssl req "${req_opts[@]}"
}
