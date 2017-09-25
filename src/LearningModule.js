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

  color(language) {
    switch(language) {
      case 'java':
        return "#e07c27"
      case 'elixir':
        return "#27a8e0"
      default:
        return "#7a7a7a"
    }
  }

  render() {
    let style = {
      margin: '1em',
      width: '250px',
      minWidth: '250px',
      borderRadius: '5px',
      boxShadow: `inset 0 0 2px 4px ${this.color(this.props.module.language)}`
    }

    let footerStyle = {
      margin: "0 4 4 4"
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
        <footer className="card-footer" style={footerStyle} >
          <a onClick={this.openModal} href="#" className="button card-footer-item">Open</a>
        </footer>
        {detailsModal}
      </div>
    );
  }
}

export default LearningModule;
