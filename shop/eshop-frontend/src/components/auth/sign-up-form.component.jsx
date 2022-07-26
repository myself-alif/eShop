import { useState } from "react";
import Button from "../button/button.component";
import FormInput from "./form-input.component";

const defaultFormFields = {
  displayName: "",
  email: "",
  password: "",
  confirmPassword: "",
};

const SignUpForm = () => {
  const [formFields, setFormFields] = useState(defaultFormFields);
  const { displayName, email, password, confirmPassword } = formFields;
  const handleChange = (event) => {
    const { name, value } = event.target;
    setFormFields({
      ...formFields,
      [name]: value,
    });
  };

  const registerUserByEmailAndPassword = (e) => {
    e.preventDefault();
    fetch("http://127.0.0.1:8000/api/auth/signUpWithEmailAndPassword", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formFields),
    })
      .then((response) => response.json())
      .then((data) => {
        sessionStorage.setItem("token", data.token);
        if (data.url) {
          window.location.replace(data.url);
        } else {
          console.log(data.message);
        }
      });
  };

  return (
    <div className="sign-up-container">
      <h2>Don't have an Account?</h2>
      <span>Sign-Up with Email & Password</span>
      <form onSubmit={registerUserByEmailAndPassword}>
        <FormInput
          label="Name"
          required
          type="text"
          onChange={handleChange}
          name="displayName"
          value={displayName}
        />

        <FormInput
          label="Email"
          required
          type="email"
          onChange={handleChange}
          name="email"
          value={email}
        />

        <FormInput
          label="Password"
          required
          type="password"
          onChange={handleChange}
          name="password"
          value={password}
        />

        <FormInput
          label="Confirm Password"
          required
          type="password"
          onChange={handleChange}
          name="confirmPassword"
          value={confirmPassword}
        />

        <Button type="submit">Sign-Up</Button>
      </form>
    </div>
  );
};

export default SignUpForm;
