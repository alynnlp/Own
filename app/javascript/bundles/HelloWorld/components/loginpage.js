import PropTypes from 'prop-types';
import React from 'react';


export default class LoginPage extends React.Component {
  render(){
    return(
      <div className="loginpage">
        <h3>LOGIN<a className="cancel" onClick={this.props.closeForm}>x</a></h3>
        <hr />
        <form className="loginform" onSubmit={this.props.checkExistUser}>
          <p>email: <input name="email"></input></p>
          <p>password: <input name="password"></input></p>
          <p><button type="submit">Login</button></p>
        </form>
      </div>
    )
  }
}
