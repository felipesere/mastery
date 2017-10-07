import React from 'react'
import ReactDOM from 'react-dom'
import ModuleCatalog from './ModuleCatalog'
import Header from './Header'
import Git from './Git'
import Filtering from './Filtering'
import Path from './Path'

import { BrowserRouter, Route } from 'react-router-dom'

import 'normalize.css'

class Main extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      selected_modules: [],
      displayed_modules: [],
      all_modules: []
    }
    this.onSearch = this.onSearch.bind(this)
    this.onAddModule = this.onAddModule.bind(this)

    fetch(MODULES_URL)
      .then(r => r.json())
      .then(modules =>  this.setModules(modules))
  }

  setModules(modules) {
    this.setState({all_modules: modules,
                   displayed_modules: modules})
  }

  onSearch(term) {
    let modules = Filtering.filter(this.state.all_modules, term);

    this.setState({displayed_modules: modules})
  }

  onAddModule(module) {
    this.state.selected_modules.unshift(module)
    this.setState({selected_modules: this.state.selected_modules})
  }

  render() {
    let catalogAndSidebar = () => {
      let style = {
        display: 'flex',
      }
      return (
        <div style={style}>
          <Path modules={this.state.selected_modules} className="container is-fluid" />
          <ModuleCatalog modules={this.state.displayed_modules}
                         selectModule={this.onAddModule} className="container is-fluid"/>
        </div>
      )
    }
    return (
      <div>
        <Header search={this.onSearch}></Header>
        <Route exact path="/" render={catalogAndSidebar} />
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
