The development environment for the official Flatpak builds of XL Converter.

## Progress

- [x] Write AppStream.
- [x] Write Python build scaffolding.
- [x] Get the Python program to build.
- [x] Get all libraries to build correctly.
    - [x] libjxl
    - [x] libjpeg-turbo
    - [x] oxipng
    - [x] libavif
    - [x] ImageMagick
    - [x] ExifTool
- [x] Get x-checker-data to work correctly.
- [x] Reduce bundle size:
    - [x] oxipng
    - [x] libjpeg-turbo
    - [x] libjxl
    - [x] libavif
    - [x] ImageMagick
    - [x] ExifTool
- [x] Fix the icon handling.
- [x] Add screenshots.
- [x] Generate and integrate sources:
    - [x] oxipng
    - [x] libavif
    - [x] cpan brotli
- [x] Validate build.
- [x] Replace placeholder screenshot URLs.
- [x] Submit the application to Flathub ([view submission](https://github.com/flathub/flathub/pull/6305)).
- [ ] Address Flathub reviewers' requests for changes.

## Prerequisites

Install [Flatpak](https://flatpak.org/).

### Installing SDK

```bash
flatpak install -y runtime/org.kde.Sdk/x86_64/6.8 app/io.qt.PySide.BaseApp/x86_64/6.8 org.freedesktop.Sdk.Extension.rust-stable//24.08
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

## Running

```bash
make build
make run
```

Additional `Makefile` targets:
- `validate-appstream` - valdiate appstream file.
- `validate-manifest` - validate flatpak manifest.
- `x-data-checker` - run x-data-checker.

## Regenerating Sources

Sources need to be regenerated every update of that module.

Change a version tag in `Makefile` and run the corresponding target:
- `generate-modules-xl-converter`
- `generate-sources-oxipng`
- `generate-sources-cpan-brotli`

## Helpful Resources

- [Flatpak manifest schema](https://github.com/flatpak/flatpak-builder/blob/main/data/flatpak-manifest.schema.json)
- [Flatpak docs](https://docs.flatpak.org/)
- [Flathub docs](https://docs.flathub.org/)
- [Cargo generator docs](https://github.com/flatpak/flatpak-builder-tools/tree/master/cargo)
- [CPAN generator docs](https://github.com/flatpak/flatpak-builder-tools/tree/master/cpan)
- [pip generator docs](https://github.com/flatpak/flatpak-builder-tools/tree/master/pip)