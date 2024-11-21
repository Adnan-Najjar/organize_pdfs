PACKAGE_NAME = organize-pdfs
VERSION = 1.0.0
BUILD_DIR = build
DEB_DIR = $(BUILD_DIR)/DEBIAN
BIN_DIR = $(BUILD_DIR)/usr/bin

.PHONY: all clean build package install uninstall

all: clean build package

clean:
	@echo "Cleaning up..."
	rm -rf $(BUILD_DIR) *.deb

build:
	@echo "Making build directory..."
	mkdir -p $(DEB_DIR)
	mkdir -p $(BIN_DIR)
	cp organize_pdfs.sh $(BIN_DIR)/organize_pdfs
	chmod +x $(BIN_DIR)/organize_pdfs
	@echo "Creating control file..."
	echo "Package: $(PACKAGE_NAME)" > $(DEB_DIR)/control
	echo "Version: $(VERSION)" >> $(DEB_DIR)/control
	echo "Section: utils" >> $(DEB_DIR)/control
	echo "Priority: optional" >> $(DEB_DIR)/control
	echo "Architecture: all" >> $(DEB_DIR)/control
	echo "Depends: poppler-utils, parallel, tree" >> $(DEB_DIR)/control
	echo "Maintainer: Adnan, Noureddine, Osama" >> $(DEB_DIR)/control
	echo "Description: A utility to organize PDF files." >> $(DEB_DIR)/control

package:
	@echo "Building Debian package..."
	dpkg-deb --build $(BUILD_DIR)
	mv $(BUILD_DIR).deb $(PACKAGE_NAME)_$(VERSION).deb
	@echo "Package created: $(PACKAGE_NAME)_$(VERSION).deb"

install:
	@echo "Installing package..."
	sudo dpkg -i $(PACKAGE_NAME)_$(VERSION).deb

uninstall:
	@echo "Uninstalling package..."
	sudo dpkg -r $(PACKAGE_NAME)
