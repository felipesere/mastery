import React from 'react';
import LearningModule from './LearningModule.js'

class ModuleCatalog extends React.Component {

  constructor(props) {
    super(props)
  }

  render() {
    let learningModules = this.props.modules.map( (module, idx) => {
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
