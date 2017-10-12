import React from 'react'

export default class List extends React.Component {
  render() {
    const elements = this.props.elements
    if (elements.length === 0) { return <div></div> }

    const listItems = elements.map((element, idx) => {
      return <li key={idx}>{element}</li>
    })

    return (
      <div className="content">
        {this.props.name}:
        <ul>
          {listItems}
        </ul>
      </div>
    )
  }
}
