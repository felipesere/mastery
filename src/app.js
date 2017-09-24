import React from 'react'
import ReactDOM from 'react-dom'
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider'
import ModuleCatalog from './ModuleCatalog.js'


class Main extends React.Component {
  render() {
    return (
      <MuiThemeProvider>
        <ModuleCatalog>
      </ModuleCatalog>
      </MuiThemeProvider>
    )
  }
}

const app = document.getElementById('app')
ReactDOM.render(<Main />, app)
