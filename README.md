I have found success with the following structure that focuses on an
account/zone/product level separation. This allows having fine grained owners
and scoped Terraform operations to a specific product in a zone. Using this model,
your change impact should be explicit, known and limited to the lowest directory
selection.

For rulesets, you can extend this even further by partitioning at the phase
level (firewall, redirects, origin rules, etc).

```
example-tf/
├── demo_account_a                  # per account segregation of resources
│   ├── users                       # top level directory for account members as they are "zoneless"
│   │   ├── provider.tf             # `provider.tf` is for configuring the providers
│   │   ├── users.tf                # `<subject>.tf` (users.tf) is for managing the individual resources
│   │   └── vars.tf                 # manage all variables for this component
│   ├── zone_a                      # group all zone based features together
│   │   ├── dns                     # individual (or grouped, your choice) of products or features to manage together
│   │   │   ├── dns.tf              # `<subject>.tf` (dns.tf) is for managing the individual resources
│   │   │   ├── provider.tf         # `provider.tf` is for configuring the providers
│   │   │   └── vars.tf             # manage all variables for this component
│   │   └── page_rules              # ... same as above but for page rules
│   │       ├── page_rules.tf
│   │       ├── provider.tf
│   │       └── vars.tf
│   ├── zone_b
│   │   ├── dns
│   │   │   ├── dns.tf
│   │   │   ├── provider.tf
│   │   │   └── vars.tf
│   │   └── page_rules
│   │       ├── page_rules.tf
│   │       ├── provider.tf
│   │       └── vars.tf
│   └── zone_c
│       ├── dns
│       │   ├── dns.tf
│       │   ├── provider.tf
│       │   └── vars.tf
│       └── page_rules
│           ├── page_rules.tf
│           ├── provider.tf
│           └── vars.tf
└── demo_account_b
    ├── users
    │   ├── provider.tf
    │   ├── users.tf
    │   └── vars.tf
    ├── zone_a
    │   ├── dns
    │   │   ├── dns.tf
    │   │   ├── provider.tf
    │   │   └── vars.tf
    │   └── page_rules
    │       ├── page_rules.tf
    │       ├── provider.tf
    │       └── vars.tf
    ├── zone_b
    │   ├── dns
    │   │   ├── dns.tf
    │   │   ├── provider.tf
    │   │   └── vars.tf
    │   └── page_rules
    │       ├── page_rules.tf
    │       ├── provider.tf
    │       └── vars.tf
    └── zone_c
        ├── dns
        │   ├── dns.tf
        │   ├── provider.tf
        │   └── vars.tf
        └── page_rules
            ├── page_rules.tf
            ├── provider.tf
            └── vars.tf
```
