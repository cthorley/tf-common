# `identity` module
Consistent, convenient naming patterns

## Usage
This module takes 2-3 tokens with an implied general-to-specific relationship, and produces a number of output strings that can be used for safely and consistently naming resources, using patterns that are common throughout AWS.

The input variables are as follows:

- `app` - the name of an overarching application or project; the apex namespace for target resources
- `env` - the name of an 'environment' in the classic, operational sense of the word (`prod`, `stage`, `dev`, etc.)
- `suffix` (optional) - an arbitrary suffix that can be used to support another subcontext of namespace localization throughout your infrastructure

## Outputs
Given the following inputs...

```
var.app    = "foo"
var.env    = "bar"
var.suffix = "qux"
```

...the following outputs will be produced:

- `app` - `foo`
- `env` - `bar`
- `suffix` - `qux`
- `app-env` - `foo-bar`
- `app-env-suffix` - `foo-bar-qux`
- `app-env-path` - `/foo/bar`
- `app-env-suffix-path` - `/foo/bar/qux`
- `app_env` - `foo_bar`
- `app_env_suffix` - `foo_bar_qux`
- `appEnv` - `fooBar`
- `appEnvSuffix` - `fooBarQux`
- `AppEnv` - `FooBar`
- `AppEnvSuffix` - `FooBarQux`
