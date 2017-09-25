import React from 'react';

class LearningModule extends React.Component {

  constructor(props) {
    super(props)
    this.openModal = this.openModal.bind(this)
    this.closeModal = this.closeModal.bind(this)
    this.state = {detailsOpen: false,
                  outputs: props.module.outputs || [],
                  outcomes: props.module.outcomes || [],
    }

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

  _outputs() {
    if(this.state.outputs.length === 0) { return }

    let outputs = this.state.outputs.map( (output, idx) => {
      return <li key={idx}>{output}</li>
    });

    return (
      <div className="content">
      Outputs:
      <ul>
        {outputs}
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

        <div className={"modal " + (this.state.detailsOpen ? 'is-active' : '')}>
          <div className="modal-background"></div>
            <div className="modal-card">
            <header className="modal-card-head">
               <p className="modal-card-title">{this.props.module.title}</p>
               <button onClick={this.closeModal} className="delete" aria-label="close"></button>
            </header>
            <section className="modal-card-body">
                {this._outputs()}
                {this._outcomes()}
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
