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

    fetch("http://localhost:3000/modules")
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
      return module.title.toLowerCase().includes(term)
        || module.subtitle.toLowerCase().includes(term)
        || module.description.toLowerCase().includes(term)
        || contains(module.outputs, term)
        || contains(module.outcomes, term)
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
