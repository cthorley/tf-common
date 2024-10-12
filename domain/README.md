# `domain` module
DNS and ACM management for apex- and sub-domains.

## Usage
Provide `apex_domain_name`, `environment`, and `is_apex`.  If you'd like the delegation's subdomain name to be different than `environment`, then additionally provide `subdomain`.  `domain` will create a delegation regardless of whether or not the target environment uses the apex domain name.
