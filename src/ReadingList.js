import React from 'react'
import Markdown from './Markdown'

export default class ReadingList extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    let material = this.props.material;
    if(material === undefined || material.length === 0) { return (null) }

    let listItems = material.map( (element, idx) => {
      return <li key={idx}><Markdown text={element} /></li>
    });

    return (
      <div className="content">
        <span className="icon">
          <i className="fa fa-book fa-fw"></i>
        </span>
        Reading material:
        <ul>
          {listItems}
        </ul>
      </div>
    )
  }
}
