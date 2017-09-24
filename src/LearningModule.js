import React from 'react';
import {Card, CardActions, CardHeader, CardMedia, CardTitle, CardText} from 'material-ui/Card';
import FlatButton from 'material-ui/FlatButton';
import RaisedButton from 'material-ui/RaisedButton';

class LearningModule extends React.Component {

  render() {
    return (
      <Card style={{width: '250px'}}>
      <CardHeader
         title={this.props.title}
         subtitle={this.props.subtitle}
         actAsExpander={true}
         showExpandableButton={true}
      />

      <CardText expandable={true}>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id tellus vitae neque molestie blandit. Sed lectus felis, egestas in malesuada tempor, rhoncus dapibus nibh.
      </CardText>
      <CardActions>
        <RaisedButton primary={true} label="Done" />
        <RaisedButton label="Add" />
      </CardActions>
      </Card>
    );
  }
}

export default LearningModule;
