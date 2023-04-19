clean:
	rm -rf docs/*

move:
	mv *.html docs/

all: clean generate move
