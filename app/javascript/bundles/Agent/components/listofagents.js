import PropTypes from 'prop-types';
import React from 'react';
import Agent from './agent.js';

export default class AgentList extends React.Component {
  /**
  * @param props - this component recieves props from Views
  */
  constructor(props) {
    super(props)
    this.state = {
    }
  }
  render(){
    const listAgents = this.state.agents.map(agent => {
        return <Agent name="agent.name" img="agent.image"/>
      })

    return (
      <div>
      {listAgents}
      </div>
    )
  }
}
