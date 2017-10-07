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
           selectModule={this.props.selectModule}
           key={idx} module={module} animated={!this.state.viewingDetails} />
      )
    })

    let style = {
      display: 'flex',
      flexWrap: 'wrap',
      alignContent: 'flex-start',
      justifyContent: 'center',
    }

    return (
      <div style={style}>
      {learningModules}
      </div>
    )
  }
}

export default ModuleCatalog;
