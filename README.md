# GitHub Actions

My collection of github actions

<!-- BADGES - START -->

[![Build Status](https://github.com/fernandopasik/actions/actions/workflows/main.yml/badge.svg)](https://github.com/fernandopasik/actions/actions/workflows/main.yml 'Build Status')
[![Known Vulnerabilities](https://snyk.io/test/github/fernandopasik/actions/badge.svg?targetFile=package.json)](https://snyk.io/test/github/fernandopasik/actions?targetFile=package.json 'Known Vulnerabilities')

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
      - uses: actions/checkout@v4
      - uses: fernandopasik/actions/setup-node@main
```

## License

MIT (c) 2023 [Fernando Pasik](https://fernandopasik.com)
