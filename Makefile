THIS_FILE := $(lastword $(MAKEFILE_LIST))

SHELL := /bin/bash

OPENSCAD := $(which openscad)


.SUFFIXES: .stl .scad .png

.PHONY: all clean

.POSIX:


#################
# BUILDING SCAD
#################

%.stl:
	@echo $(basename $@).scad -> $@
	openscad --render -o $@ $(basename $@).scad

%.png:
	@echo $(basename $@).scad -> $@
	openscad --preview --imgsize 2000,2000 -o $@ $(basename $@).scad

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