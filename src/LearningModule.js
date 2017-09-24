import React from 'react';

class LearningModule extends React.Component {

  render() {
    let style = {
      border: '2px solid #30395C',
      padding: '1em',
      margin: '1em',
      width: '150px',
      minWidth: '150px',
      borderRadius: '5px'
    }

    return (
      <div style={style}>
        <h3>{this.props.title}</h3>
        <h5>{this.props.subtitle}</h5>
        <button>Open</button>
      </div>
    );
  }
}

export default LearningModule;
