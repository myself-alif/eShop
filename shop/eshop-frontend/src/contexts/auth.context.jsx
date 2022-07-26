import { useState, createContext, useEffect } from "react";

export const AuthContext = createContext({
  signInUrl: "",
  setsignInUrl: () => {},
  token: "",
  setToken: () => {},
});

export const AuthProvider = ({ children }) => {
  const [signInUrl, setsignInUrl] = useState("");
  const [token, setToken] = useState(sessionStorage.getItem("token"));

  useEffect(() => {
    fetch("http://127.0.0.1:8000/api/auth/redirect")
      .then((response) => response.json())
      .then((data) => setsignInUrl(data.url));
  }, []);

  const value = {
    signInUrl,
    setsignInUrl,
    token,
    setToken,
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
};
