import React from 'react';
import LearningModule from './LearningModule.js'

class ModuleCatalog extends React.Component {

  constructor(props) {
    super(props)
    this.state = {viewingDetails: false}
    this.openModal = this.openModal.bind(this)
    this.closeModal = this.closeModal.bind(this)
  }

  openModal() {
    this.setState({viewingDetails: true})
  }

  closeModal() {
    this.setState({viewingDetails: false})
  }

  render() {
    let learningModules = this.props.modules.map( (module, idx) => {
      return (
        <LearningModule
           openModal={this.openModal}
           closeModal={this.closeModal}
           key={idx} module={module} animated={!this.state.viewingDetails} ></LearningModule>
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
