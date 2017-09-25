import React from 'react';
import DetailsModal from './DetailsModal';

class LearningModule extends React.Component {

  constructor(props) {
    super(props)
    this.openModal = this.openModal.bind(this)
    this.closeModal = this.closeModal.bind(this)
    this.state = {detailsOpen: false }

  }

  openModal(e) {
    e.preventDefault()
    this.setState({detailsOpen: true})
  }

  closeModal(e) {
    e.preventDefault()
    this.setState({detailsOpen: false})
  }

  _outcomes() {
    if(this.state.outcomes.length === 0) { return }

    let outcomes = this.state.outcomes.map( (outcome, idx) => {
      return <li key={idx}>{outcome}</li>
    });

    return (
      <div className="content">
      Outcomes:
      <ul>
        {outcomes}
      </ul>
      </div>
    )
  }

  render() {
    let style = {
      margin: '1em',
      width: '250px',
      minWidth: '250px',
      borderRadius: '5px'
    }

    let detailsModal = ""
    if( this.state.detailsOpen ) {
      detailsModal = <DetailsModal title={this.props.module.title}
                            outputs={this.props.module.outputs}
                            outcomes={this.props.module.outcomes}
                            onClose={this.closeModal}>
                     </DetailsModal>
    }

    return (
      <div className="card" style={style}>
        <header className="card-header">
          <p className="card-header-title is-centered">{this.props.module.title}</p>
        </header>
        <div className="card-content">
          <div className="content">
            {this.props.module.subtitle}
          </div>
        </div>
        <footer className="card-footer">
          <a onClick={this.openModal} href="#" className="button card-footer-item">Open</a>
        </footer>
        {detailsModal}
      </div>
    );
  }
}

export default LearningModule;
