import React from 'react'
import ReactDOM from 'react-dom'
import ModuleCatalog from './ModuleCatalog.js'
import Header from './Header.js'

import 'normalize.css'

class Main extends React.Component {
  render() {
    return (
      <div>
        <Header></Header>
        <ModuleCatalog className="container is-fluid"></ModuleCatalog>
      </div>
    )
  }
}

const app = document.getElementById('app')
ReactDOM.render(<Main />, app)
