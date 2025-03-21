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
- [ ] Replace placeholder screenshot URLs.
- [ ] Validate build.
- [ ] Submit the application to Flathub.
- [ ] Application was accepted to Flathub.

## Prerequisites

Install [Flatpak](https://flatpak.org/).

### Installing SDK

```bash
flatpak install -y runtime/org.kde.Sdk/x86_64/6.8 app/io.qt.PySide.BaseApp/x86_64/6.8 org.freedesktop.Sdk.Extension.rust-stable//24.08
```

### Optional

Required if regenerating python3 requirements:

```bash
wget https://raw.githubusercontent.com/flatpak/flatpak-builder-tools/refs/heads/master/pip/flatpak-pip-generator -O ~/.local/bin/flatpak-pip-generator
chmod +x ~/.local/bin/flatpak-pip-generator
python install --user requirements-parser PyYAML
exec bash
```

Required if using x-data-checker:

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
- `generate-pip` - regenerate python3 requirements.

## Helpful Resources

- [Flatpak manifest schema](https://github.com/flatpak/flatpak-builder/blob/main/data/flatpak-manifest.schema.json)
- [Flatpak docs](https://docs.flatpak.org/)
- [Flathub docs](https://docs.flathub.org/)