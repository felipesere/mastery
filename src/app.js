import React from 'react'
import ReactDOM from 'react-dom'
import ModuleCatalog from './ModuleCatalog'
import Header from './Header'
import Git from './Git'
import Filtering from './Filtering'

import { BrowserRouter, Route } from 'react-router-dom'

import 'normalize.css'

class Main extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      displayed_moduled: [],
      all_modules: []
    }
    this.onSearch = this.onSearch.bind(this)

    fetch(MODULES_URL)
      .then(r => r.json())
      .then(modules =>  this.setModules(modules))
  }

  setModules(modules) {
    this.setState({all_modules: modules,
                   displayed_moduled: modules})
  }

  onSearch(term) {
    let modules = Filtering.filter(this.state.all_modules, term);

    this.setState({displayed_moduled: modules})
  }

  render() {
    return (
      <div>
        <Header search={this.onSearch}></Header>
        <Route exact path="/" render={() => <ModuleCatalog modules={this.state.displayed_moduled} className="container is-fluid"/>} />
        <Route path="/healthcheck" render={() => <Git/>} />
      </div>
    )
  }
}

const app = document.getElementById('app')
ReactDOM.render(<BrowserRouter>
                  <Main />
                </BrowserRouter>
  , app)
