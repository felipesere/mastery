import React from 'react'
import ReactDOM from 'react-dom'
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider'
import LearningModule from './LearningModule.js'


class Main extends React.Component {
  render() {
    return (
      <MuiThemeProvider>
        <LearningModule></LearningModule>
      </MuiThemeProvider>
    )
  }
}

const app = document.getElementById('app')
ReactDOM.render(<Main />, app)
