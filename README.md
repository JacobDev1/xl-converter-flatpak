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
- [ ] Include ExifTool.
- [ ] Adjust program itself to Flatpak.
- [ ] Adjust update checker.
- [ ] Make sure scripts follow best practices.
- [ ] Make sure everything works.
- [ ] Submit the application to Flathub.

## Prerequisites

- Flatpak.
- `flatpak-pip-generator` (only if trying to regenerate requirements)
- cloned xl-converter repo.
- Sdk.

### Installing `flatpak-pip-generator`

```bash
wget https://raw.githubusercontent.com/flatpak/flatpak-builder-tools/refs/heads/master/pip/flatpak-pip-generator -O ~/.local/bin/flatpak-pip-generator
chmod +x ~/.local/bin/flatpak-pip-generator
exec bash
python install --user requirements-parser PyYAML
```

### Cloning repo

```bash
git clone --depth 1 -b v1.2.0 https://github.com/JacobDev1/xl-converter.git
```

### Installing SDK

```bash
flatpak install -y runtime/org.kde.Sdk/x86_64/6.8 app/io.qt.PySide.BaseApp/x86_64/6.8 org.freedesktop.Sdk.Extension.rust-stable//24.08
```

## Running

```bash
make build
make run
```
