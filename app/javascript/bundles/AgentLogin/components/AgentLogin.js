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
    this.closeForm = this.closeForm.bind(this);
  }
  render(){
    return(
      <div >
        <a className="NewAgentClick" onClick={this.handleNewAgentClick}>
                                  New Agent</a>
        {this.state.showRegisterAgent ? <RegisterNewAgent
                                                    closeForm = {this.closeForm} /> : null}
      </div>
    )
  }

  handleNewAgentClick() {
    this.setState({
      showRegisterAgent: true,
    });
  }

  closeForm(){
    this.setState({
      showRegisterAgent: false,
    });
  }
}
