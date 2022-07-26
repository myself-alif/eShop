import { useLocation } from "react-router-dom";
import { useContext, useEffect } from "react";
import { AuthContext } from "../../contexts/auth.context";

const GoogleSignInRedirect = () => {
  const { search } = useLocation();
  const { setToken } = useContext(AuthContext);

  useEffect(() => {
    fetch(`http://127.0.0.1:8000/api/auth/callback${search}`)
      .then((response) => response.json())
      .then((data) => {
        sessionStorage.setItem("token", data.token);
        setToken(sessionStorage.getItem("token"));
        window.location.replace(data.url);
      });
  }, []);
};

export default GoogleSignInRedirect;
