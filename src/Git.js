import React from 'react'

var sha = COMMIT_HASH;

export default class Git extends React.Component {
  render() {
    return (
      <p>Commit: {sha}</p>
    )
  }
}
