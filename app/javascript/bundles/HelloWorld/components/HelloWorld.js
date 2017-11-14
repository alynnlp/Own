//this is the MASTER page to include everything
import PropTypes from 'prop-types';
import React from 'react';

import Loginpage from './loginpage';
import Registerpage from './registerpage';

export default class HelloWorld extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };
  /**
   * @param props - Comes from your rails view.
   */
  constructor(props) {
    super(props);
    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = {
      showLogin: false,
      showRegister: false,
      visible: false,
    }
    this.handleLoginClick = this.handleLoginClick.bind(this);
    this.handleRegisterClick = this.handleRegisterClick.bind(this);
    this.closeForm = this.closeForm.bind(this);

  }

  render() {
    return (
      <div className="HelloMasterPage">
        <button className="login">
          <a className="login" onClick={this.handleLoginClick}>
                          Login</a>
        </button>
        <button className="register">
          <a className="register" onClick={this.handleRegisterClick}>
                              Register</a>
        </button>
        {this.state.showLogin ? <Loginpage checkExistUser = {this.checkExistUser}
                                            closeForm = {this.closeForm}/> : null}
        {this.state.showRegister ? <Registerpage getNewUser = {this.getNewUser}
                                            closeForm = {this.closeForm}/> : null}
      </div>
    );
  }
  handleLoginClick() {
    this.setState({
      showLogin: true
    });
  }
  handleRegisterClick() {
    this.setState({
      showRegister: true
    });
  }

  closeForm(){
    this.setState({
      showLogin: false,
      showRegister:false
    })
  }

  checkExistUser = (e) => {
    e.preventDefault()
  }
  getNewUser = (e) => {
    e.preventDefault()
  }
}
