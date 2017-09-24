import React from 'react';
import LearningModule from './LearningModule.js'

class ModuleCatalog extends React.Component {

  render() {
    return (
      <div>
        <LearningModule
            title="Java 3x3 TTT"
            subtitle="Learn the basics of a Java CLI app"
        >
        </LearningModule>
        <LearningModule
            title="Java 4x4 with Performance TTT"
            subtitle="Learn to measure performance and track bottlenecks"
        >
        </LearningModule>
      </div>
    );
  }
}

export default ModuleCatalog;
