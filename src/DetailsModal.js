import React from 'react';
import Markdown from './Markdown.js';
import List from './List.js';

class DetailsModal extends React.Component {
  constructor(props) {
    super(props)
    this.closeModal = this.closeModal.bind(this)
  }

  closeModal(e) {
    this.props.onClose(e)
  }

  render() {
    let description = this.props.description;
    return (
        <div className="modal is-active">
          <div className="modal-background"></div>
            <div className="modal-card">
            <header className="modal-card-head">
               <p className="modal-card-title">{this.props.title}</p>
               <button onClick={this.closeModal} className="delete" aria-label="close"></button>
            </header>
            <section className="modal-card-body">
              <Markdown className="description" text={description}></Markdown>
              <List elements={this.props.outputs} name="Outputs"></List>
              <List elements={this.props.outcomes} name="Outcomes"></List>
            </section>
            <footer className="modal-card-foot">
              <button onClick={this.closeModal} className="button is-info">Close</button>
            </footer>
          </div>
        </div>
    );
  }
}

export default DetailsModal;
