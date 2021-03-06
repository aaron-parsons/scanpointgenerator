# Specify defaults for testing
PREFIX := $(shell pwd)/prefix
PYTHON = dls-python
MODULEVER=0.0

# Override with any release info
-include Makefile.private

# This is run when we type make
dist: setup.py $(wildcard scanpointgenerator/*.py)
	MODULEVER=$(MODULEVER) $(PYTHON) setup.py bdist_egg
	touch dist

# Clean the module
clean:
	$(PYTHON) setup.py clean
	rm -rf build dist *egg-info installed.files prefix docs/html
	find -name '*.pyc' -delete -or -name '*~' -delete

# Install the built egg and keep track of what was installed
install: dist docs
	$(PYTHON) setup.py easy_install -m \
		--record=installed.files \
		--prefix=$(PREFIX) dist/*.egg

# Upload to pypi test. To upload a new release to pypi, push to Travis with a tag.
testpublish:
	$(PYTHON) setup.py register -r https://testpypi.python.org/pypi sdist upload -r https://testpypi.python.org/pypi

test:
	$(PYTHON) setup.py test

docs/html/index.html: $(wildcard docs/*.rst docs/conf.py)
	sphinx-build -b html docs docs/html

docs: dist docs/html/index.html

