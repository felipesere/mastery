exports.config = {
  files: {
    javascripts: {
      joinTo: 'js/app.js'
    },
    stylesheets: {
      joinTo: 'css/app.css'
    }
  },

  conventions: {
    assets: /^(static)/,
    ignored: [
      /tests/
    ]
  },

  paths: {
    watched: ['static', 'css', 'js', 'vendor', 'elm'],
    public: '../priv/static'
  },

  plugins: {
    elmBrunch: {
      mainModules: ['src/Main.elm'],
      elmFolder: 'elm',
      outputFolder: '../vendor'
    },
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/vendor/, /elm/]
    }
  },

  npm: {
    enabled: true
  }
}
