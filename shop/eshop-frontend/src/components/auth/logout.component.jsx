

const Logout = () => {
  fetch("http://127.0.0.1:8000/api/auth/logout", {
    method: "POST",
    headers: {
      Authorization: `Bearer ${sessionStorage.getItem("token")}`,
    },
  })
    .then((response) => response.json())
    .then((data) => {
      sessionStorage.clear();
      window.location.replace(data.url);
    });
};

export default Logout;
