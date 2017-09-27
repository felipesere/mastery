import React from 'react'
import SearchBar from './SearchBar.js'

export default class Header extends React.Component {
  render() {
    return (
      <header className="top navbar">
        <div className="navbar-brand">
           <a className="navbar-item" href="/"><img src="https://8thlight.com/images/branding/8th-Light-Logo-Color-No-Text-28048670.png" alt="8th Light logo"></img>
           </a>
            <div className="navbar-item">
              <SearchBar search={this.props.search}></SearchBar>
            </div>
        </div>
      </header>
    )
  }
}

