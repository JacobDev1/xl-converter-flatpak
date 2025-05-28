MANIFEST_PATH 				= ./eu.codepoems.xl-converter.yaml
BUILD_DIR					= ./build
XL_CONVERTER_TAG 			= v1.2.1
OXIPNG_TAG					= v9.1.5

.PHONY: build
build:
	flatpak run org.flatpak.Builder $(BUILD_DIR) --user --ccache --install --force-clean $(MANIFEST_PATH)

.PHONY: build-aarch64
build-aarch64:
	flatpak run org.flatpak.Builder $(BUILD_DIR) --arch=aarch64 --user --ccache --install --force-clean $(MANIFEST_PATH)

.PHONY: run
run:
	flatpak run eu.codepoems.xl-converter

.PHONY: generate-modules-xl-converter
generate-modules-xl-converter:
	wget https://raw.githubusercontent.com/JacobDev1/xl-converter/refs/tags/$(XL_CONVERTER_TAG)/requirements.txt
	cat requirements.txt | grep -v "pyside6" > requirements_filtered.txt
	flatpak-pip-generator --yaml -r requirements_filtered.txt -o xl_converter_modules
	rm requirements.txt requirements_filtered.txt

.PHONY: generate-sources-oxipng
generate-sources-oxipng:
	wget https://raw.githubusercontent.com/shssoichiro/oxipng/refs/tags/$(OXIPNG_TAG)/Cargo.lock
	flatpak-cargo-generator Cargo.lock -o oxipng_sources.json
	rm Cargo.lock

.PHONY: generate-sources-cpan-brotli
generate-sources-cpan-brotli:
	flatpak-cpan-generator.pl "IO::Uncompress::Brotli" -o cpan_brotli_sources.json

.PHONY: validate-manifest
validate-manifest:
	flatpak run --command=flatpak-builder-lint org.flatpak.Builder manifest $(MANIFEST_PATH)

.PHONY: x-data-checker
x-data-checker:
	flatpak run org.flathub.flatpak-external-data-checker $(MANIFEST_PATH)
