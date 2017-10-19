var webpack = require('webpack')

module.exports = {
  entry:  {
    app: __dirname + '/elm/src/Main.elm',
  },
  output: {
    filename: 'app.js'
  },

  resolve: {
    extensions: ['.js', '.elm']
  },

  module: {
    loaders: [
      { test: /\.elm$/, loader: 'elm-webpack-loader?cwd='+__dirname+'/elm&verbose=true&warn=true', exclude: [/elm-stuff/, /node-modules/]},
    ],
    noParse: /\.elm$/
  }
}
