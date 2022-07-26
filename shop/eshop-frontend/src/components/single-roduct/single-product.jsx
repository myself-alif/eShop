import Button from "../button/button.component";
import { useContext } from "react";
import { CartContext } from "../../contexts/cart.context";

const SingleProduct = ({ product }) => {
  const { product_title, product_price, product_image } = product;
  const { setCartItemCount, setCartItems } = useContext(CartContext);

  const addToCart = () => {
    const data = {
      product_title,
      product_image,
      product_price,
      product_quantity: 1,
    };
    fetch("http://127.0.0.1:8000/api/addToCart", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${sessionStorage.getItem("token")}`,
      },
      body: JSON.stringify(data),
    })
      .then((response) => response.json())
      .then((data) => {
        setCartItemCount(data.itemsCount);
        if (data.cartItems) {
          setCartItems(data.cartItems);
        }
      });
  };

  return (
    <div className="product-card-container">
      <img src={product_image} />
      <div className="footer">
        <span className="name">{product_title}</span>
        <span className="price">{product_price}</span>
      </div>
      <Button buttonType="inverted">Add to Cart</Button>

      {sessionStorage.getItem("token") ? (
        <Button buttonType="inverted" onClick={addToCart}>
          Add to Cart
        </Button>
      ) : (
        <Button
          disabled
          style={{ backgroundColor: "grey" }}
          buttonType="inverted"
        >
          Add to Cart
        </Button>
      )}
    </div>
  );
};

export default SingleProduct;
