.PHONY: generate-pip
generate-pip:
	# wget https://raw.githubusercontent.com/JacobDev1/xl-converter/refs/tags/v1.2.0/requirements.txt
	cat ./xl-converter/requirements.txt | grep -v "pyside6" > requirements.txt
	flatpak-pip-generator --yaml -r requirements.txt
	rm requirements.txt

.PHONY: build
build:
	rm -rf ./build
	flatpak run org.flatpak.Builder build --user --ccache --install eu.codepoems.xl-converter.yaml

.PHONY: run
run:
	flatpak run eu.codepoems.xl-converter

.PHONY: validate-appstream
validate-appstream:
	flatpak run --command=flatpak-builder-lint org.flatpak.Builder appstream eu.codepoems.xl-converter.metainfo.xml

.PHONY: validate-manifest
validate-manifest:
	flatpak run --command=flatpak-builder-lint org.flatpak.Builder manifest eu.codepoems.xl-converter.yaml