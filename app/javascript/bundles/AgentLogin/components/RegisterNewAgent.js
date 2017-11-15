import PropTypes from 'prop-types';
import React from 'react';

export default class RegisterNewAgent extends React.Component {

  render(){
    return(
      <div className="registerpage">
        <h3>REGISTER<a className="cancel" onClick={this.props.closeForm}>x</a></h3>
        <hr />
        <form id="userregisterform"className="registerform" onSubmit={this.props.getNewAgent}>
          <p>name: <input placeholder="Full name" className="agename"></input></p>
          <p>email: <input placeholder="example@gmail.com" className="ageemail"></input></p>
          <p>password: <input className="agepw"></input></p>
          <p>biography: <input className="agebio"></input></p>
          <p>specialty:
            <input className="agespecialty"></input><br></br>
            <span>(eg. Condominium,Semi-detached House)</span>
          </p>
          <p>profile pic: <input type="url" className="ageimg" placeholder="http://"></input></p>
          <p><button type="submit">Register</button></p>
        </form>
      </div>
    )
  }

}
