import React from 'react';
import LearningModule from './LearningModule'

export default class Path extends React.Component {

  constructor(props) {
    super(props)
  }

  render() {
    let visibiity = "visibile"
    if(this.props.modules.length == 0) {
      visibiity = "hidden"
    }

    // TODO improve
    let learningModules = this.props.modules.map( (module, idx) => {
      return (
        <LearningModule key={idx} module={module} animated={false} />
      )
    })


    return (
      <div className={`path ${visibiity}`}>
        {learningModules}
      </div>
    )
  }
}
