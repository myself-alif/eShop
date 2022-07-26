import Home from "./routes/home/home.component";
import Navigation from "./routes/navigation/navigation.component";
import { Routes, Route } from "react-router-dom";
import Auth from "./components/auth/auth.component";
import Logout from "./components/auth/logout.component";
import LogoutRedirect from "./components/auth/logoutRedirect.component";
import Shop from "./routes/shop/shop.component";
import Checkout from "./routes/checkout/checkout.component";
import GoogleSignInRedirect from "./components/auth/googleSignInRedirect.component";
import ProductsByCategory from "./components/productsByCategory/productsByCategory.component";

const App = () => {
  return (
    <Routes>
      <Route path="/" element={<Navigation />}>
        <Route index element={<Home />} />
        <Route path="shop/*" element={<Shop />} />
        <Route path="auth" element={<Auth />} />
        <Route path="checkout" element={<Checkout />} />
      </Route>
      <Route path="/logout" element={<Logout />} />
      <Route path="/logoutredirect" element={<LogoutRedirect />} />
      <Route path="/googleSignInRedirect" element={<GoogleSignInRedirect />} />
    </Routes>
  );
};

export default App;
