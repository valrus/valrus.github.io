build:
	peppermynt gen _src .

rebuild:
	peppermynt gen -f _src .

serve:
	peppermynt serve

_src/_assets/js/%.min.js: _src/_assets/js/_uncompressed/%.js
	uglifyjs -c -o $@ $<
