import React from 'react';
import DetailsModal from './DetailsModal';
import GitHubColors from 'github-colors';

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

  render() {

    let style = {
      margin: '1em',
      width: '250px',
      minWidth: '250px',
      borderRadius: '5px',
      boxShadow: `inset 0 0 2px 4px ${GitHubColors.get(this.props.module.language).color}`
    }

    let footerStyle = {
      margin: "0 4 4 4"
    }

    let detailsModal = ""
    if( this.state.detailsOpen ) {
      detailsModal = <DetailsModal title={this.props.module.title}
                            description={this.props.module.description}
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
