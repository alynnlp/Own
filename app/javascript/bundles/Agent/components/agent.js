import PropTypes from 'prop-types';
import React from 'react';

export default class Agent extends React.Component {

  render(){
    return(
      <a href={`http://localhost:3000/agent/${this.props.agentid}`}>
      <img src={`../../../../assets/images/agenticon.jpg`}/>
      {this.props.agent.name}
      </a>
    )
  }

}
