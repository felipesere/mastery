const webpack = require('webpack')
const GitRevisionPlugin = require('git-revision-webpack-plugin')
const moment = require('moment')
const git = new GitRevisionPlugin()


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
        loader: 'elm-webpack-loader?cwd='+__dirname+'/elm&verbose=true&warn=true',
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
      'MODULES_URL': JSON.stringify(process.env.MODULES_URL || 'http://localhost:4000/'),
      'COMMIT_HASH': JSON.stringify(process.env.SOURCE_VERSION || JSON.stringify(git.commithash())),
      'BUILD_TIME': JSON.stringify(moment().format('LLLL') || "No build time derived")
    })
  ]
}
