# ServicePlus CLI — Releases

Pre-built binaries and the install script for the **ServicePlus CLI** — the
command-line tool that sets up and manages self-hosted Mautic stacks (and
companion services) on your VPS.

> **What this repo is:** a public distribution point for compiled release
> binaries, an installer script, and release notes — nothing more.
>
> **What this repo is NOT:** the source code repository. The CLI's source
> lives in a private repository. Binaries here are pre-compiled artifacts;
> no source files are published in this repo.

## Quick install

```bash
curl -fsSL https://raw.githubusercontent.com/aimaddotnet/serviceplus-cli-releases/main/install.sh | bash
```

This script downloads the latest release, runs the installer (sets up Docker
if needed and installs the `sp` command), and removes all temporary files when
it's done — your VPS is left with just the `sp` command, ready to use.

## Manual download

Grab a specific version's binary from the [Releases](https://github.com/aimaddotnet/serviceplus-cli-releases/releases) page.

## Documentation

Full setup and usage docs: https://sp.aimad.net/docs/
