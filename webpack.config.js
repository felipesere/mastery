const path = require('path')
const webpack = require('webpack')

const config = {
  entry: './src/app.js',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        loader: 'babel-loader',
        exclude: /node_modules/,
        query: {
          presets: ['es2016', 'react']
        }
      },
      {
        test: /\.css$/,
        use: [{ loader: 'style-loader' }, { loader: 'css-loader' }],
      }
    ]
  },
  plugins: [
    new webpack.DefinePlugin({
      'MODULES_URL': JSON.stringify(process.env.MODULES_URL || 'http://localhost:3000/modules')
    })
  ]
}

module.exports = config
