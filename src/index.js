// Main entrypoint file
require( '../dist/index.html' );

var Elm = require( './elm/Main' );
Elm.embed( Elm.Main, document.getElementById( 'main' ) );