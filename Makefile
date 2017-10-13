default: build

ELM_FILES = $(shell find . -prune -o -type f -name '*.elm')

build: $(ELM_FILES)
	elm-make --yes src/Main.elm --output=app.js

clean:
	rm -rf app.js

