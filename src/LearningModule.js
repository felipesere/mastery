import React from 'react';

class LearningModule extends React.Component {

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
          <a href="#" className="button card-footer-item">Open</a>
        </footer>
      </div>
    );
  }
}

export default LearningModule;
