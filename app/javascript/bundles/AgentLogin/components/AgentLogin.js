import PropTypes from 'prop-types';
import React from 'react';

import RegisterNewAgent from './RegisterNewAgent';

export default class AgentLogin extends React.Component {
  /**
  * @param props
  */

  constructor(props){
    super(props);
    this.state = {
      showRegisterAgent: false,
    }
    this.handleNewAgentClick = this.handleNewAgentClick.bind(this);
  }
  render(){
    return(
      <div >
        <h2>Login</h2>
        <form id="agentlogin" className="agentlogin">
          <p>email:<input></input></p>
          <p>password:<input></input></p>
        </form>
        <a className="NewAgentClick" onClick={this.handleNewAgentClick}>
                                  New Agent</a>
        {this.state.showRegisterAgent ? <RegisterNewAgent /> : null}
      </div>
    )
  }

  handleNewAgentClick() {
    this.setState = {
      showRegisterAgent: true,
    }
  }

  closeForm(){
    this.setState={
      showRegisterAgent: false,
    }
  }

  getNewAgent(){
  }
}
