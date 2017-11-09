import PropTypes from 'prop-types';
import React from 'react';

export default class ClientResponse extends React.Component {

  /**
  * @param props - this component recieves props from Views
  */

  render(){
    return (
      <div>
        <p>Accepted Client</p>
        <p>Rejected Client</p>
      </div>
    )
  }
}
