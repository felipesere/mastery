import React from 'react';

class LearningModule extends React.Component {

  constructor(props) {
    super(props)
    this.openModal = this.openModal.bind(this)
    this.closeModal = this.closeModal.bind(this)
    this.state = {detailsOpen: false}

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
      borderRadius: '5px'
    }

    return (
      <div className="card" style={style}>
        <header className="card-header">
          <p className="card-header-title is-centered">{this.props.title}</p>
        </header>
        <div className="card-content">
          <div className="content">
            {this.props.subtitle}
          </div>
        </div>
        <footer className="card-footer">
          <a onClick={this.openModal} href="#" className="button card-footer-item">Open</a>
        </footer>

        <div className={"modal " + (this.state.detailsOpen ? 'is-active' : '')}>
          <div className="modal-background"></div>
            <div className="modal-card">
            <header className="modal-card-head">
               <p className="modal-card-title">{this.props.title}</p>
               <button onClick={this.closeModal} className="delete" aria-label="close"></button>
            </header>
            <section className="modal-card-body">
                Bla bla bla
            </section>
            <footer className="modal-card-foot">
              <button onClick={this.closeModal} className="button is-success">Save changes</button>
              <button onClick={this.closeModal} className="button">Cancel</button>
            </footer>
          </div>
        </div>
      </div>
    );
  }
}

export default LearningModule;
