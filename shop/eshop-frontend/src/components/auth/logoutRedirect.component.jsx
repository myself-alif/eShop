const LogoutRedirect = () => {
  sessionStorage.clear();
  window.location.replace("http://localhost:3000");
};

export default LogoutRedirect;
