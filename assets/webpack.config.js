const webpack = require('webpack')
const WebpackNotifierPlugin = require('webpack-notifier')
const GitRevisionPlugin = require('git-revision-webpack-plugin')
const moment = require('moment')
const git = new GitRevisionPlugin()

var baseUrl = function() {
  if (process.env.MODULES_URL) {
    return process.env.MODULES_URL
  } else if (process.env.HEROKU_APP_NAME) {
    return 'https://' + process.env.HEROKU_APP_NAME + '.herokuapp.com'
  } else {
    return 'http://localhost:4000'
  }
}

module.exports = {
  entry:  {
    'js/app.js': __dirname + '/index.js'
  },
  output: {
    path: __dirname + '/../priv/static/',
    filename: '[name]'
  },

  resolve: {
    extensions: ['.js', '.elm']
  },

  module: {
    loaders: [
      {
        test: /\.elm$/,
        loader: 'elm-webpack-loader?cwd='+__dirname+'/elm&verbose=true&warn=true&forceWatch=true',
        exclude: [/elm-stuff/, /node-modules/]
      },
      {
        test:    /\.html$/,
        exclude: /node_modules/,
        loader:  'file-loader?name=[name].[ext]',
      },
    ],
    noParse: /\.elm$/
  },
  plugins: [
    new webpack.DefinePlugin({
      'MODULES_URL': JSON.stringify(baseUrl()),
      'COMMIT_HASH': JSON.stringify(process.env.SOURCE_VERSION || JSON.stringify(git.commithash())),
      'BUILD_TIME': JSON.stringify(moment().format('LLLL') || "No build time derived")
    }),
    new WebpackNotifierPlugin()
  ]
}
