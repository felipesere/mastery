import React from 'react'
import ReactDOM from 'react-dom'
import ModuleCatalog from './ModuleCatalog.js'

import 'normalize.css'

class Main extends React.Component {
  render() {
    let style = {
      width: '80%',
      margin: 'auto'
    }
    return (
      <div className="container" style={style}>
        <ModuleCatalog></ModuleCatalog>
      </div>
    )
  }
}

const app = document.getElementById('app')
ReactDOM.render(<Main />, app)
