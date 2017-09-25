import React from 'react';
import LearningModule from './LearningModule.js'

class ModuleCatalog extends React.Component {

  render() {

    let modules = [
      {
        title: "Java 3x3 TTT",
        subtitle: "Learn the basics of a Java CLI app",
        language: 'java',
        outputs: [
          "A basic 3x3 TTT",
          "100% code coverage",
          "Human vs Computer",
          "If possible, unbeatble"
        ],
        outcomes: [
          "Basic understanding of static typing",
          "Understand how a Java project is structured"
        ]
      },
      {
        title: "Java 4x4 performance",
        subtitle: "Learn the basics of a Java CLI app",
        language: 'java'
      },
      {
        title: "Java Echo Server",
        subtitle: "What are Sockets and why do they matter?",
        language: 'java'
      },
      {
        title: "Java Chat server",
        subtitle: "Talking should be a fun exercise.",
        language: 'java'

      },
      {
        title: "Java HTTP server",
        subtitle: "A challenge to be experienced!",
        language: 'java'
      },
      {
        title: "Elixir koans",
        subtitle: "Basic syntax of the language",
        language: 'elixir',
      },
      {
        title: "Elixir TTT",
        subtitle: "Basic Human vs Human with a cute UI",
        language: 'elixir',
      },
      {
        title: "Elixir Guilded Rose",
        subtitle: "Refactoring and pattern matching",
        language: 'elixir',
      },
    ]

    let learningModules = modules.map( (module, idx) => {
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
