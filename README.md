An official prototype for a Flatpak build of XL Converter.

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
- [ ] Adjust program itself to Flatpak.
- [ ] Adjust update checker.
- [ ] Make sure scripts follow best practices.
- [ ] Make sure everything works.
- [ ] Replace placeholder screenshot URLs.
- [ ] Submit the application to Flathub.

## Prerequisites

- Flatpak.
- cloned xl-converter repo.
- Sdk.

### Cloning repo

```bash
git clone --depth 1 -b v1.2.0 https://github.com/JacobDev1/xl-converter.git
```

### Installing SDK

```bash
flatpak install -y runtime/org.kde.Sdk/x86_64/6.8 app/io.qt.PySide.BaseApp/x86_64/6.8 org.freedesktop.Sdk.Extension.rust-stable//24.08
```

### Optional

Required for regenerating python3 requirements:

```bash
wget https://raw.githubusercontent.com/flatpak/flatpak-builder-tools/refs/heads/master/pip/flatpak-pip-generator -O ~/.local/bin/flatpak-pip-generator
chmod +x ~/.local/bin/flatpak-pip-generator
exec bash
python install --user requirements-parser PyYAML
```

Required if validating x-data-checker:

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

## Resources

- [Flatpak schema](https://github.com/flatpak/flatpak-builder/blob/main/data/flatpak-manifest.schema.json)