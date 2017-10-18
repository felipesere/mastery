var moment = require('moment')
var gitRevision = require('git-revision')

var baseUrl = function() {
  if (process.env.HEROKU_APP_NAME ) {
    return 'https://' + process.env.HEROKU_APP_NAME + '.herokuapp.com'
  } else {
    return 'http://localhost:4000'
  }
}

exports.config = {
  files: {
    javascripts: {
      joinTo: 'js/app.js'
    }
  },

  modules:{
    wrapper: false,
    definition: false
  },

  npm: {
    enabled: false
  },

  conventions: {
    assets: /^(static)/,
    ignored: [
      /tests/,
      /node_modules/
    ],
    vendor: /^(vendor)/
  },

  paths: {
    watched: ['static', 'css', 'js', 'vendor', 'elm'],
    public: '../priv/static'
  },

  plugins: {
    elmBrunch: {
      mainModules: ['src/Main.elm'],
      elmFolder: 'elm',
      outputFolder: '../vendor',
      executablePath: '../node_modules/.bin'
    },
    handlebars: {
      locals: {
        baseUrl: baseUrl(),
        buildTime: moment().format('LLLL') || 'No build time derived',
        commit: 'No commit derived'
      }
    }
  }
}
