import React from 'react';
import LearningModule from './LearningModule.js'

class ModuleCatalog extends React.Component {

  constructor(props) {
    super(props)
    this.state = {modules: []}
    let that = this;
    fetch("http://localhost:3000/modules")
      .then(r => r.json())
      .then(modules =>  this.setModules(modules))
  }

  setModules(modules) {
    this.setState({modules: modules})
  }

  render() {

    let learningModules = this.state.modules.map( (module, idx) => {
      return (
        <LearningModule key={idx} module={module} ></LearningModule>
      );
    });

    let style = {
      display: 'flex',
      flexWrap: 'wrap',
      alignContent: 'flex-start',
      justifyContent: 'flex-start',
    }

    return (
      <div style={style} className="module-catalog">
      {learningModules}
      </div>
    );
  }
}

export default ModuleCatalog;
