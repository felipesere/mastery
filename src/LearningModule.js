import React from 'react';
import {Card, CardActions, CardHeader, CardMedia, CardTitle, CardText} from 'material-ui/Card';
import FlatButton from 'material-ui/FlatButton';
import RaisedButton from 'material-ui/RaisedButton';

class LearningModule extends React.Component {

  render() {
    return (
      <Card style={{width: '250px'}}>
      <CardTitle title={this.props.title} />
      <CardText>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id tellus vitae neque molestie blandit. Sed lectus felis, egestas in malesuada tempor, rhoncus dapibus nibh.
      </CardText>
      <CardActions>
      <FlatButton label="Expand" />
      <RaisedButton label="Done" />
      </CardActions>
      </Card>
    );
  }
}

export default LearningModule;
