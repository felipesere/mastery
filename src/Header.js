import React from 'react'
import SearchBar from './SearchBar.js'

import {Link} from 'react-router-dom'

export default class Header extends React.Component {
  render() {
    return (
      <header className="top navbar">
        <div className="navbar-brand">
           <Link className="navbar-item" to="/"><img src="https://8thlight.com/images/branding/8th-Light-Logo-Color-No-Text-28048670.png" alt="8th Light logo"></img>
           </Link>
            <div className="navbar-item">
              <SearchBar search={this.props.search}></SearchBar>
            </div>
            <Link className="navbar-item" to="/healthcheck">Healthcheck</Link>
        </div>
      </header>
    )
  }
}

