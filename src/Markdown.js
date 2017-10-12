import Marked from 'marked'
import React from 'react'

export default class Markdown extends React.Component {
  render() {
    const markdown = {__html: Marked(this.props.text)}

    return (
      <div dangerouslySetInnerHTML={markdown}></div>
    )
  }
}
