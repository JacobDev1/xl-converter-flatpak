## Development Environment

The development environment for the official Flatpak builds of [XL Converter](https://github.com/JacobDev1/xl-converter).

[Flathub page](https://flathub.org/apps/eu.codepoems.xl-converter)

## Prerequisites

### Required

Install [Flatpak](https://flatpak.org/).

Install Flatpak Builder:

```bash
flatpak install app/org.flatpak.Builder/x86_64
```

Install SDK:

```bash
flatpak install -y \
    runtime/org.kde.Sdk/x86_64/6.8 \
    app/io.qt.PySide.BaseApp/x86_64/6.8 \
    org.freedesktop.Sdk.Extension.rust-stable/x86_64/24.08
```

### Optional

Required to run `generate-modules-xl-converter`:

```bash
wget https://raw.githubusercontent.com/flatpak/flatpak-builder-tools/refs/heads/master/pip/flatpak-pip-generator -O ~/.local/bin/flatpak-pip-generator
chmod +x ~/.local/bin/flatpak-pip-generator
pip install --user requirements-parser PyYAML
exec bash
```

Required to run `generate-sources-oxipng`:

```bash
wget https://raw.githubusercontent.com/flatpak/flatpak-builder-tools/refs/heads/master/cargo/flatpak-cargo-generator.py -O ~/.local/bin/flatpak-cargo-generator
chmod +x ~/.local/bin/flatpak-cargo-generator
pip install --user aiohttp toml
exec bash
```

Required to run `generate-sources-cpan-brotli`:

```bash
sudo apt update
sudo apt install \
    perl \
    cpanminus \
    libgetopt-long-descriptive-perl \
    libjson-maybexs-perl \
    libwww-perl \
    libmetacpan-client-perl \
    libcapture-tiny-perl
```

Required to run `x-data-checker`:

```bash
flatpak install org.flathub.flatpak-external-data-checker
```

Required to run `build-aarch64` and for testing `aarch64` support on `x86_64`:

```bash
sudo apt update
sudo apt install qemu-user-static binfmt-support
flatpak install -y org.kde.Sdk/aarch64/6.8 org.kde.Platform/aarch64/6.8 io.qt.PySide.BaseApp/aarch64/6.8 org.freedesktop.Sdk.Extension.rust-stable/aarch64/24.08
```

> [!NOTE]
> The Flatpak Builder may tell you to install nonexistent version of an Sdk extension like Rust ([related issue](https://github.com/flatpak/flatpak-builder/issues/494)). If this happens, check available branches with `flatpak search`.

## Running

```bash
make build
make run
```

Additional `Makefile` targets:
- `validate-manifest` - validate Flatpak manifest.
- `x-data-checker` - run x-data-checker.
- `build-aarch64` - build for aarch64.

## Regenerating Sources

Sources need to be regenerated regularly, even if package versions do not change.

Change a version tag in `Makefile` and run the corresponding target:
- `generate-modules-xl-converter`
- `generate-sources-oxipng`
- `generate-sources-cpan-brotli`

## Updating Dependencies

When updating dependencies, run `x-data-checker` to list outdated dependencies.

```bash
make x-data-checker
```

When updating commit hashes, copy new hashes from `x-data-checker` or dereference tags (`^{}`) like this:

```bash
git ls-remote https://github.com/AOMediaCodec/libavif.git 'refs/tags/v1.3.0^{}'
```

## Helpful Resources

- [Flatpak manifest schema](https://github.com/flatpak/flatpak-builder/blob/main/data/flatpak-manifest.schema.json)
- [Flatpak docs](https://docs.flatpak.org/)
- [Flathub docs](https://docs.flathub.org/)
- [Cargo generator docs](https://github.com/flatpak/flatpak-builder-tools/tree/master/cargo)
- [CPAN generator docs](https://github.com/flatpak/flatpak-builder-tools/tree/master/cpan)
- [pip generator docs](https://github.com/flatpak/flatpak-builder-tools/tree/master/pip)
