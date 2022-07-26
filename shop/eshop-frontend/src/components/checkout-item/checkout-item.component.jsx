import "./checkout-item.styles.scss";
import { useContext } from "react";
import { CartContext } from "../../contexts/cart.context";

const CheckoutItem = ({ cartItem }) => {
  const { setCartItems } = useContext(CartContext);
  const { product_title, product_image, product_price, product_quantity } =
    cartItem;

  const data = {
    product_title,
    product_quantity,
  };
  const removeItem = () => {
    fetch("http://127.0.0.1:8000/api/removeItem", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${sessionStorage.getItem("token")}`,
      },
      body: JSON.stringify(data),
    })
      .then((response) => response.json())
      .then((data) => setCartItems(data.cartItems));
  };

  const increseQuantity = () => {
    fetch("http://127.0.0.1:8000/api/increseItem", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${sessionStorage.getItem("token")}`,
      },
      body: JSON.stringify(data),
    })
      .then((response) => response.json())
      .then((data) => setCartItems(data.cartItems));
  };
  const dicreseQuantity = () => {
    fetch("http://127.0.0.1:8000/api/dicreseItem", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${sessionStorage.getItem("token")}`,
      },
      body: JSON.stringify(data),
    })
      .then((response) => response.json())
      .then((data) => setCartItems(data.cartItems));
  };

  return (
    <div className="checkout-item-container">
      <div className="image-container">
        <img src={product_image} />
      </div>
      <span className="name">{product_title}</span>
      <span className="quantity">
        <div className="arrow" onClick={dicreseQuantity}>
          &#10094;
        </div>
        <span className="value">{product_quantity}</span>
        <div className="arrow" onClick={increseQuantity}>
          &#10095;
        </div>
      </span>
      <span className="price">${product_price}</span>
      <div className="remove-button" onClick={removeItem}>
        &#10005;
      </div>
    </div>
  );
};

export default CheckoutItem;
