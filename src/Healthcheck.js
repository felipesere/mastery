import React from 'react'

var sha = COMMIT_HASH
var time = BUILD_TIME

export default class Healthcheck extends React.Component {
  render() {
    return (
      <div>
        <p>Commit: {sha}</p>
        <p>Build time: {time}</p>
      </div>
    )
  }
}
