import React from 'react'
import ReactDOM from 'react-dom'
import ModuleCatalog from './ModuleCatalog.js'
import Header from './Header.js'

import 'normalize.css'

class Main extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      modules: [],
      all_modules: []
    }
    this.onSearch = this.onSearch.bind(this)

    // This will need tweaking for local development!
    fetch(MODULES_URL)
      .then(r => r.json())
      .then(modules =>  this.setModules(modules))
  }

  setModules(modules) {
    this.setState({all_modules: modules,
                   modules: modules})
  }


  onSearch(term) {
    let lower_term = term.toLowerCase()
    let contains = (elements, term) =>  elements.some(element => element.toLowerCase().includes(term) );

    let modules = this.state.all_modules.filter( (module) => {
      return module.title.toLowerCase().includes(lower_term)
        || module.subtitle.toLowerCase().includes(lower_term)
        || module.description.toLowerCase().includes(lower_term)
        || contains(module.outputs, lower_term)
        || contains(module.outcomes, lower_term)
    })

    this.setState({modules: modules})
  }

  render() {
    return (
      <div>
        <Header search={this.onSearch}></Header>
        <ModuleCatalog modules={this.state.modules} className="container is-fluid"></ModuleCatalog>
      </div>
    )
  }
}

const app = document.getElementById('app')
ReactDOM.render(<Main />, app)
