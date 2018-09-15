NAME = business-client
BUILDDIR=/dev/shm/${NAME}
TARGET = $(BUILDDIR)/business-client

SERVERSRC:=$(BUILDDIR)/src/business-client.nim
BUILDSRC:=$(BUILDDIR)/business_client.nimble

all: $(TARGET)

$(TARGET): $(SERVERSRC) $(BUILDSRC)
	cd $(BUILDDIR); nimble build; cd -

$(SERVERSRC): business-client.org | prebuild
	org-tangle $<

$(BUILDSRC): build.org | prebuild
	org-tangle $<

prebuild:
ifeq "$(wildcard $(BUILDDIR))" ""
	@mkdir -p $(BUILDDIR)/src
endif

clean:
	rm -rf $(BUILDDIR)

.PHONY: all clean prebuild
