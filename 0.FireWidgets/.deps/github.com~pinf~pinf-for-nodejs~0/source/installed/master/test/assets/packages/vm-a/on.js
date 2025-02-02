
const MAIN = require("pinf-for-nodejs/lib/main");


MAIN.main(function(options, callback) {

	// NOTE: We use a non- string literal module id to trigger a dynamic require.
	//       We also declare this dynamic require in package.json so we don't trigger
	//		 a `Error: Bundling dynamic require '/extra.js' for '<main>'.` error.
	var hello = require("./" + "extra").getHello();

	return callback(null, hello + " World");

}, module);
