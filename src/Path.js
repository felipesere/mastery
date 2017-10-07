import React from 'react';
import LearningModule from './LearningModule'

export default class Path extends React.Component {

  constructor(props) {
    super(props)
  }

  render() {
    if(this.props.modules.length == 0) {
      return (null)
    }

    // TODO improve
    let learningModules = this.props.modules.map( (module, idx) => {
      return (
        <LearningModule key={idx} module={module} animated={false} />
      )
    })


    return (
      <div className="path">
        {learningModules}
      </div>
    )
  }
}
