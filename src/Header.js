import React from 'react'

export default class Header extends React.Component {
  render() {
    return (
      <header className="top navbar">
        <div className="navbar-brand">
           <a className="navbar-item" href="/"><img src="https://8thlight.com/images/branding/8th-Light-Logo-Color-No-Text-28048670.png" alt="8th Light logo"></img>
           </a>
            <div className="navbar-item">
             <div className="field has-addons is-centered">
               <div className="control">
                 <input className="input" type="text" placeholder="Search for anything"></input>
               </div>
               <div className="control">
                 <a className="button is-info">
                   Go
                 </a>
               </div>
             </div>
          </div>
        </div>
      </header>
    )
  }
}

