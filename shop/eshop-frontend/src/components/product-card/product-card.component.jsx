import Button from "../button/button.component";
import { Fragment, useContext, useEffect } from "react";
import { CartContext } from "../../contexts/cart.context";
import SingleProduct from "../single-roduct/single-product";

const ProductCard = ({ products }) => {
  // const { setCartItemCount } = useContext(CartContext);
  // const { product_title, product_price, product_image } = product;
  // // const { addItemToCart } = useContext(CartContext);
  // const addToCart = () => {
  //   const data = {
  //     product_title,
  //     product_image,
  //     product_price,
  //     product_quantity: 1,
  //   };
  //   fetch("http://127.0.0.1:8000/api/addToCart", {
  //     method: "POST",
  //     headers: {
  //       "Content-Type": "application/json",
  //       Authorization: `Bearer ${sessionStorage.getItem("token")}`,
  //     },
  //     body: JSON.stringify(data),
  //   });
  // };
  // const getCartItems = () => {
  //   fetch("http://127.0.0.1:8000/api/viewCart", {
  //     method: "GET",
  //     headers: {
  //       "Content-Type": "application/json",
  //       Authorization: `Bearer ${sessionStorage.getItem("token")}`,
  //     },
  //   })
  //     .then((response) => response.json())
  //     .then((data) => {
  //       setCartItems(data.items);
  //       setCartItemCount(data.items.length);
  //     });
  // };
  // const addProductToCart = () => addItemToCart(product);
};

export default ProductCard;
