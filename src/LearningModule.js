import React from 'react';
import {Card, CardActions, CardHeader, CardMedia, CardTitle, CardText} from 'material-ui/Card';
import FlatButton from 'material-ui/FlatButton';
import RaisedButton from 'material-ui/RaisedButton';

const LearningModule = () => (
  <Card style={{width: '250px'}}>
    <CardTitle title="Java TTT 3x3" />
    <CardText>
      Write a basic Java TTT for the command line.
    </CardText>
    <CardActions>
      <FlatButton label="Expand" />
      <RaisedButton label="Done" />
    </CardActions>
  </Card>
);

export default LearningModule;
