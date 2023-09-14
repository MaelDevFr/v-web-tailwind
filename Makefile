.PHONY: css run

css:
	npx tailwindcss -i ./src/templates/page/home.css -o ./src/templates/page/outpout.css --watch

run:
	v -d vweb_livereload watch run .