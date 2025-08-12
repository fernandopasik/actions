# GitHub Actions

My collection of github actions

<!-- BADGES - START -->

[![Build Status](https://github.com/fernandopasik/actions/actions/workflows/main.yml/badge.svg)](https://github.com/fernandopasik/actions/actions/workflows/main.yml "Build Status")
[![Known Vulnerabilities](https://snyk.io/test/github/fernandopasik/actions/badge.svg?targetFile=package.json)](https://snyk.io/test/github/fernandopasik/actions?targetFile=package.json "Known Vulnerabilities")

<!-- BADGES - END -->

## Usage

Include any of these composite Github Actions in workflows within the steps of a job with `uses`.

```yaml
on: [push]

jobs:
  my_job:
    runs-on: ubuntu-latest
    name: An example job
    steps:
      - uses: actions/checkout@v5
      - uses: fernandopasik/actions/setup-node@main
```

## Actions

### Auto Review

Automatically approves and sets automerge to a PR. A username can be provided or by default auto
review Dependabot PRs.

### Setup Ansible

Setup Ansible and install its dependencies. An `ansible.cfg` file and `requirements.yml` can be
provided to guide what galaxy packages to install and where. _Depends on having Python available_ or
it can be installed by the **Setup Python** action.

### Setup Node

Setup Node.js and dependencies. A custom version can be provided, otherwise will use LTS. Can be
used with any of the package managers: npm, yarn or pnpm. Caches and loads local node_modules
folder.

### Setup Python

Setup Python and install its dependencies. A `requirements.txt` can be provided to detail the list
of python dependencies. Displays both Python and Pip versions. Caches and loads from local folder.

## License

MIT (c) 2023 [Fernando Pasik](https://fernandopasik.com)
