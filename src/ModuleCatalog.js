import React from 'react';
import LearningModule from './LearningModule.js'

class ModuleCatalog extends React.Component {

  render() {
    return (
      <div>
        <LearningModule title="Java 3x3 TTT"></LearningModule>
        <LearningModule title="Java 4x4 with Performance TTT"></LearningModule>
      </div>
    );
  }
}

export default ModuleCatalog;
