import PropTypes from 'prop-types';
import React from 'react';

export default class RegisterPage extends React.Component {

  render(){
    return(
      <div className="registerpage">
        <h3>REGISTER<a className="cancel" onClick={this.props.closeForm}>x</a></h3>
        <hr />
        <form className="registerform" onSubmit={this.props.getNewUser}>
          <p>name: <input placeholder="Full name" className="regname"></input> * </p>
          <p>email: <input placeholder="example@gmail.com" className="regemail"></input> * </p>
          <p>password: <input className="regpw"></input> * </p>
          <p>location:
            <input className="reglocation"></input> *
          </p>
          <p>budget: <input className="regbudget"></input> ,000  * </p>
          <p>size: <input className="regsize"></input> square ft  * </p>
          <p>age: <input className="regage"></input></p>
          <p>address: <input className="regadd"></input></p>
          <p>occupation: <input className="regoccupation"></input></p>
          <p><button type="submit">Register</button></p>
        </form>
        <p> - please fill in all the *boxes - </p>
      </div>
    )
  }



}
