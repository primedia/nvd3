# Only include what we intend to use
JS_FILES = \
	src/intro.js \
	src/core.js \
	src/interactiveLayer.js \
	src/tooltip.js \
	src/utils.js \
	src/models/axis.js \
	src/models/legend.js \
	src/models/line.js \
	src/models/lineChart.js \
	src/models/pie.js \
	src/models/pieChart.js \
	src/models/scatter.js \
	src/outro.js
CSS_FILES = \
	src/nv.d3.css

JS_COMPILER = \
	uglifyjs

CSS_COMPILER = \
	cssmin

all: nv.d3.js nv.d3.min.js nv.d3.css nv.d3.min.css
nv.d3.js: $(JS_FILES)
nv.d3.min.js: $(JS_FILES)
nv.d3.css: $(CSS_FILES)
nv.d3.min.css: $(CSS_FILES)

nv.d3.js: Makefile
	rm -f $@
	cat $(filter %.js,$^) >> $@

nv.d3.css: Makefile
	rm -f $@
	cat $(filter %.css,$^) >> $@

%.min.js:: Makefile
	rm -f $@
	$(JS_COMPILER) nv.d3.js >> $@

%.min.css:: Makefile
	rm -f $@
	$(CSS_COMPILER) nv.d3.css >> $@


clean:
	rm -rf nv.d3*.js nv.d3*.css
