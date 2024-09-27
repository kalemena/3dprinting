THIS_FILE := $(lastword $(MAKEFILE_LIST))

SHELL := /bin/bash

OPENSCAD := $(which openscad)

OBJS_SCAD=./models/cats/cat-tree/models-cat-tree.scad \
	./models/covid-19/keychain-covid/keychain-covid.scad \
	./models/cats/game-tube-01.scad
OBJS_PNG=$(OBJS_SCAD:.scad=.png)
OBJS_STL=$(OBJS_SCAD:.scad=.stl)

.SUFFIXES: .stl .scad .png

.PHONY: all clean

.POSIX:

all: $(OBJS_STL) $(OBJS_PNG)

#################
# BUILDING SCAD
#################

%.stl:
	@echo $(basename $@).scad -> $@
	openscad --render -o $@ $(basename $@).scad

%.png:
	@echo $(basename $@).scad -> $@
	openscad --render --colorscheme="Tomorrow" --imgsize 2000,2000 -o $@ $(basename $@).scad

clean:
	rm -f $(OBJS_STL) $(OBJS_PNG)

###########################
# BUILDING & PUBLISHING DOC
###########################

# Builds PDF book
doc.publishToPDF: 
	source .github/docPublishingScripts.sh && publishPDF

# Builds PDF book
doc.publishToHTML: 
	source .github/docPublishingScripts.sh && publishHTML

# Clean caches
doc.clean:
	rm -rf $(CURDIR)/build
	# docker run --rm -v $(CURDIR):/docs alpine rm -rf /docs/build