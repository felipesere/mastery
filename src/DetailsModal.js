import React from 'react';

class DetailsModal extends React.Component {
  constructor(props) {
    super(props)
    this.closeModal = this.closeModal.bind(this)
    this.state = {
      outputs: props.outputs || [],
      outcomes: props.outcomes || [],
    }
  }

  closeModal(e) {
    this.props.onClose(e)
  }

  outcomes() {
    return this.list(this.state.outcomes, "Outcomes")
  }

  outputs() {
    return this.list(this.state.outputs, "Outputs")
  }

  list(elements, name) {
    if(elements.length === 0) { return }

    let listItems = elements.map( (element, idx) => {
      return <li key={idx}>{element}</li>
    });

    return (
      <div className="content">
      {name}:
      <ul>
      {listItems}
      </ul>
      </div>
    )
  }

  render() {
    return (
        <div className="modal is-active">
          <div className="modal-background"></div>
            <div className="modal-card">
            <header className="modal-card-head">
               <p className="modal-card-title">{this.props.title}</p>
               <button onClick={this.closeModal} className="delete" aria-label="close"></button>
            </header>
            <section className="modal-card-body">
                {this.outputs()}
                {this.outcomes()}
            </section>
            <footer className="modal-card-foot">
              <button onClick={this.closeModal} className="button is-success">Save changes</button>
              <button onClick={this.closeModal} className="button">Cancel</button>
            </footer>
          </div>
        </div>
    );
  }
}

export default DetailsModal;
