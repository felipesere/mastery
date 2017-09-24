import React from 'react';
import LearningModule from './LearningModule.js'

class ModuleCatalog extends React.Component {

  render() {

    let modules = [
      {
        title: "Java 3x3 TTT",
        subtitle: "Learn the basics of a Java CLI app"
      },
      {
        title: "Java 4x4 performance",
        subtitle: "Learn the basics of a Java CLI app"
      },
      {
        title: "Java Echo Server",
        subtitle: "What are Sockets and why do they matter?"
      },
      {
        title: "Java Chat server",
        subtitle: "Talking is fun!"
      },
      {
        title: "Java HTTP server",
        subtitle: "A challenge to be experienced!"
      },
    ]

    let learningModules = modules.map( (module, idx) => {
      return (
        <LearningModule key={idx} title={module.title} subtitle={module.subtitle} ></LearningModule>
      );
    });

    
    return (
      <div className="module-catalog">
      {learningModules}
      </div>
    );
  }
}

export default ModuleCatalog;
