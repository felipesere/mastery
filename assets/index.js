'use strict';

require('./static/index.html');
var Elm = require('./elm/src/Main.elm');


var sha = COMMIT_HASH
var time = BUILD_TIME
var baseUrl = MODULES_URL

var app = Elm.Main.fullscreen({
  baseUrl: baseUrl,
  buildTime: time,
  commit: sha
});
