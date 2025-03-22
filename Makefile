MANIFEST_PATH 				= ./eu.codepoems.xl-converter.yaml
METAINFO_PATH 				= ./eu.codepoems.xl-converter.metainfo.xml
BUILD_DIR					= ./build
XL_CONVERTER_TAG 			= v1.2.0
OXIPNG_TAG					= v9.1.3

.PHONY: build
build:
	rm -rf $(BUILD_DIR)
	flatpak run org.flatpak.Builder $(BUILD_DIR) --user --ccache --install $(MANIFEST_PATH)

.PHONY: run
run:
	flatpak run eu.codepoems.xl-converter

.PHONY: generate-sources-xl-converter
generate-sources-xl-converter:
	wget https://raw.githubusercontent.com/JacobDev1/xl-converter/refs/tags/$(XL_CONVERTER_TAG)/requirements.txt
	cat requirements.txt | grep -v "pyside6" > requirements.txt
	flatpak-pip-generator --yaml -r requirements.txt
	rm requirements.txt

.PHONY: generate-sources-oxipng
generate-sources-oxipng:
	wget https://raw.githubusercontent.com/shssoichiro/oxipng/refs/tags/$(OXIPNG_TAG)/Cargo.lock
	flatpak-cargo-generator Cargo.lock -o oxipng_sources.json
	rm Cargo.lock

.PHONY: generate-sources-cpan-brotli
generate-sources-cpan-brotli:
	flatpak-cpan-generator.pl "IO::Uncompress::Brotli" -o cpan_brotli_sources.json

.PHONY: validate-appstream
validate-appstream:
	flatpak run --command=flatpak-builder-lint org.flatpak.Builder appstream $(METAINFO_PATH)

.PHONY: validate-manifest
validate-manifest:
	flatpak run --command=flatpak-builder-lint org.flatpak.Builder manifest $(MANIFEST_PATH)

.PHONY: x-data-checker
x-data-checker:
	flatpak run org.flathub.flatpak-external-data-checker $(MANIFEST_PATH)