PATH := node_modules/.bin:$(PATH)
SHELL := /bin/bash

NODE ?= $(shell which node)
YARN ?= $(shell which yarn)
PKG ?= $(if $(YARN),$(YARN),$(NODE) $(shell which npm))

.PHONY:

all: clean .PHONY
	babel src -d dist --source-maps

configure: .PHONY
	@NODE_ENV= $(PKG) install
	@touch node_modules

watch: .PHONY
	babel-watch src/index

start: .PHONY
	node dist/index

lint: .PHONY
	eslint src test

clean: .PHONY
	rimraf dist
