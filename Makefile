NAMESPACE  ?= phaeno
REPOSITORY ?= packages.poweruplink.com/kubernetes/magento-operator
PREFIX     ?= sao
LOGO_URL   ?= "https://www.expertrec.com/wp-content/uploads/2017/11/magento-logo.png"

all: release
	@true

release:
	@./generate-and-install-operator.sh "$(NAMESPACE)" "$(REPOSITORY)" "$(shell git describe --tags)" "$(PREFIX)"

logo.png:
	curl -L -o logo.png "$(LOGO_URL)"

logo: logo.png
	@printf '  icon:\n    - base64data: >-\n        ' > logo
	@echo "[CONVERT] $<" 
	@convert logo.png -resize 40x40 - | base64 -b0 >> logo

.PHONY: logo