import PropTypes from 'prop-types';
import React from 'react';

export default class RegisterNewAgent extends React.Component {

  constructor(props){
    super(props);
    this.handleSubmit = this.handleSubmit.bind(this);
  }


  handleSubmit(e){
    e.preventDefault();

    const form = e.target;
    const formData = {}
    for (let element of form.elements) {
      if (element.tagName === 'Button'){
        continue;
      }
      formData[element.name] = element.value;
    };
    console.log('--->', formData)
    fetch('/agentlogin', formData, {
      method:"POST",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: ({
        name: formData.name,
        email: formData.email,
        password: formData.password,
        bio: formData.bio,
        specialty: formData.specialty,
        location:formData.location,
        img: formData.img,
      })
    }).then(res => {
      console.log(res)
      return res;
    }).catch(err => console.log(err));
  }

  render(){
    return(
      <div className="registerpage">
        <h3>REGISTER<a className="cancel" onClick={this.props.closeForm}>x</a></h3>
        <hr />

        <form id="userregisterform" name="myForm" className="registerform" onSubmit={this.handleSubmit}>
          <label htmlFor="agenname">name: </label>
            <input placeholder="Full name" id="agename" name="name" type="text"></input><br></br>
          <label htmlFor="ageemail">email: </label>
            <input placeholder="example@gmail.com" id="ageemail" name="email" type="email"></input><br></br>
          <label htmlFor="agepw">password: </label>
            <input id="agepw" name="password" type="string"></input><br></br>
          <label htmlFor="agebio">biography: </label>
            <input id="agebio" name="bio" type="text"></input><br></br>
          <label htmlFor="agespecialty">specialty: </label>
            <input id="agespecialty" name="specialty" type="text"></input><br></br>
            <span>(eg. Condominium, Semi-detached House)</span><br></br>
          <label htmlFor="agelocation">location: </label>
            <input id="agelocation" name="location" type="text"></input><br></br>
          <label htmlFor="ageimg">profile pic: </label>
            <input id="ageimg" name="img" placeholder="http://" type="url" ></input><br></br>
          <input type="submit" value="Submit"/>
        </form>
      </div>
    )
  };
}
