import React from 'react';
import LearningModule from './LearningModule'

export default class Path extends React.Component {

  constructor(props) {
    super(props)
  }

  render() {
    let style = {
      float: "left",
      width: "300px",
      height: "100%",
      background: "white",
      boxShadow: "0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24), 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22)"

    }

    // TODO improve
    let learningModules = this.props.modules.map( (module, idx) => {
      return (
        <LearningModule key={idx} module={module} animated={false} />
      )
    })


    return (
      <div style={style}>
        {learningModules}
      </div>
    )
  }
}
