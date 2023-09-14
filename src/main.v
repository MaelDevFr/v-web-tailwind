module main

import vweb
import os

struct App {
	vweb.Context
}

struct Object {
	title       string
	description string
}

fn main() {
	vweb.run_at(new_app(), vweb.RunParams{
		port: 8081
	}) or { panic(err) }
}

fn new_app() &App {
	mut app := &App{}
	app.mount_static_folder_at(os.resource_abs_path('.'), '/')
	return app
}

['/']
pub fn (mut app App) page_home() vweb.Result {
	return $vweb.html()
}

['/upload'; post]
pub fn (mut app App) page_upload() vweb.Result {
	dump(app.form)
	dump(app.files)
	fdata := app.files['upfile']
	mut files := []vweb.RawHtml{}
	for d in fdata {
		files << d.data.replace_each(['\n', '<br>', '\n\r', '<br>', '\t', '	', ' ', '&nbsp;'])
	}

	return $vweb.html()
}

['/submit'; post]
pub fn (mut app App) page_submit() vweb.Result {
	dump(app.form)
	form_data := app.form.clone()

	return $vweb.html()
}
