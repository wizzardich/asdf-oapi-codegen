# asdf-oapi-codegen

[![Build](https://github.com/wizzardich/asdf-oapi-codegen/actions/workflows/build.yml/badge.svg)](https://github.com/wizzardich/asdf-oapi-codegen/actions/workflows/build.yml) [![Lint](https://github.com/wizzardich/asdf-oapi-codegen/actions/workflows/lint.yml/badge.svg)](https://github.com/wizzardich/asdf-oapi-codegen/actions/workflows/lint.yml)

[oapi-codegen](https://github.com/deepmap/oapi-codegen) plugin for the [asdf version manager](https://asdf-vm.com).

## Contents

- [asdf-oapi-codegen](#asdf-oapi-codegen)
  - [Contents](#contents)
  - [Dependencies](#dependencies)
  - [Install](#install)
  - [Contributing](#contributing)
  - [License](#license)

## Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `go`: golang installation, best provisioned with `asdf-golang`

## Install

Plugin:

```shell
asdf plugin add oapi-codegen
# or
asdf plugin add oapi-codegen https://github.com/wizzardich/asdf-oapi-codegen.git
```

oapi-codegen:

```shell
# Show all installable versions
asdf list-all oapi-codegen

# Install specific version
asdf install oapi-codegen latest

# Set a version globally (on your ~/.tool-versions file)
asdf global oapi-codegen latest

# Now oapi-codegen commands are available
oapi-codegen --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

## Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/wizzardich/asdf-oapi-codegen/graphs/contributors)!

## License

See [LICENSE](LICENSE) © [Vlad Tomashpolskyi](https://github.com/wizzardich/)
