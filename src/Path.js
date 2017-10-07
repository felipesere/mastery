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
      let removeItself = () => this.props.removeModule(idx)
      return (
        <LearningModule key={idx}
                        module={module}
                        animated={false}
                        removeModule={removeItself}/>
      )
    })


    return (
      <div className={`path ${visibiity}`}>
        {learningModules}
      </div>
    )
  }
}
