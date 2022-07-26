import "./auth.styles.scss";
import SignInForm from "./sign-in-form.component";
import { useContext } from "react";
import { AuthContext } from "../../contexts/auth.context";
import SignUpForm from "./sign-up-form.component";

const Auth = () => {
  const { signInUrl } = useContext(AuthContext);
  return (
    <div className="authentication-container">
      <SignInForm googleSignInUrl={signInUrl} />
      <SignUpForm />
    </div>
  );
};
export default Auth;
