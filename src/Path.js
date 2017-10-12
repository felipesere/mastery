import React from 'react';
import LearningModule from './LearningModule'

export default class Path extends React.Component {

  constructor(props) {
    super(props)
  }

  render() {
    const visibiity = 'visibile'
    if (this.props.modules.length === 0) {
      visibiity = 'hidden'
    }

    const learningModules = this.props.modules.map((module, idx) => {
      const removeItself = () => this.props.removeModule(idx)
      return (
        <LearningModule key={module.title}
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
