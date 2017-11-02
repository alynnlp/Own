import PropTypes from 'prop-types';
import React from 'react';

export default class AgentProfile extends React.Component {

  /**
  * @param props - this component recieves props from Views
  */

  render(){
    return (
      <div>
        <h2>Message Agent</h2>
        <input type='text'></input>
        <button>Submit</button>
      </div>
    )
  }
}
