MANIFEST_PATH 				= ./eu.codepoems.xl-converter.yaml
METAINFO_PATH 				= ./eu.codepoems.xl-converter.metainfo.xml
BUILD_DIR					= ./build
VERSION_FOR_PIP_GENERATOR 	= v1.2.0

.PHONY: build
build:
	rm -rf $(BUILD_DIR)
	flatpak run org.flatpak.Builder $(BUILD_DIR) --user --ccache --install $(MANIFEST_PATH)

.PHONY: run
run:
	flatpak run eu.codepoems.xl-converter

.PHONY: generate-pip
generate-pip:
	wget https://raw.githubusercontent.com/JacobDev1/xl-converter/refs/tags/$(VERSION_FOR_PIP_GENERATOR)/requirements.txt
	cat requirements.txt | grep -v "pyside6" > requirements.txt
	flatpak-pip-generator --yaml -r requirements.txt
	rm requirements.txt

.PHONY: validate-appstream
validate-appstream:
	flatpak run --command=flatpak-builder-lint org.flatpak.Builder appstream $(METAINFO_PATH)

.PHONY: validate-manifest
validate-manifest:
	flatpak run --command=flatpak-builder-lint org.flatpak.Builder manifest $(MANIFEST_PATH)

.PHONY: x-data-checker
x-data-checker:
	flatpak run org.flathub.flatpak-external-data-checker $(MANIFEST_PATH)