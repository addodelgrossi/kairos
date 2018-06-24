#!/usr/bin/make
 
.DEFAULT_GOAL := all

DIST_DIR := dist
PLATFORMS := linux/amd64 linux/386 linux/arm darwin/amd64 darwin/386 freebsd/amd64 freebsd/386 windows/386 windows/amd64

LD_FLAGS := -ldflags "-X github.com/addodelgrossi/kairos/version.Version=`cat VERSION` -X github.com/addodelgrossi/kairos/version.BuildDate=`date -u +%Y-%m-%d_%H:%M:%S` -X github.com/addodelgrossi/kairos/version.GitHash=`git rev-parse HEAD` "

temp = $(subst /, ,$@)
os = $(word 1, $(temp))
arch = $(word 2, $(temp))

releases: $(PLATFORMS)

$(PLATFORMS):
	GOOS=$(os) GOARCH=$(arch) go build $(LD_FLAGS) -o 'dist/kairos_$(os)-$(arch)'

release:
	go build $(LD_FLAGS) -o 'dist/kairos'

release_win:
	GOOS='windows' GOARCH='386' go build $(LD_FLAGS) -o 'dist/kairos_windows-386'

clean:
	@rm -rf $(DIST_DIR)

all:
	@make -s clean release
