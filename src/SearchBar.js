import React from 'react'

export default class SearchBar extends React.Component {

  constructor(props) {
    super(props)
    this.state = {value: ""}

    this.handleChange = this.handleChange.bind(this)
  }

  handleChange(event) {
    let term = event.target.value
    this.setState({value: term})
    this.props.search(term)
  }

  render() {
    return (
      <div className="field has-addons is-centered">
        <div className="control">
          <input onChange={this.handleChange} value={this.state.value} className="input" type="text" placeholder="Search for anything"></input>
        </div>
        <div className="control">
          <a className="button is-info">
            Go
          </a>
        </div>
      </div>
    )
  }
}
