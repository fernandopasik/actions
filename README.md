# GitHub Actions

My collection of github actions

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
