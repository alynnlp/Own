import PropTypes from 'prop-types';
import React from 'react';

export default class ClientResponse extends React.Component {

  /**
  * @param props - this component recieves props from Views
  */

  render(){
    return (
      <div>
        <h2>Client Requirement</h2>
        <h3>Notes to Client</h3>
        <input type='text'></input>
        <button>Accept</button>
        <button>Reject</button>
      </div>
    )
  }
}
