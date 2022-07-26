import { useState, createContext, useEffect } from "react";

export const CartContext = createContext({
  isCartOpen: false,
  setIsCartOpen: () => {},
  cartItemCount: 0,
  setCartItemCount: () => {},
  cartitems: [],
  setCartItems: () => {},
  total: 0,
  setTotal: () => {},
});

export const CartProvider = ({ children }) => {
  const [isCartOpen, setIsCartOpen] = useState(false);
  const [cartItems, setCartItems] = useState([]);
  const [cartItemCount, setCartItemCount] = useState(0);
  const [total, setTotal] = useState(0);

  useEffect(() => {
    if (sessionStorage.getItem("token")) {
      fetch("http://127.0.0.1:8000/api/cartItemCount", {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${sessionStorage.getItem("token")}`,
        },
      })
        .then((response) => response.json())
        .then((data) => setCartItemCount(data.itemsCount));
    }
  }, [cartItems]);

  useEffect(() => {
    if (sessionStorage.getItem("token")) {
      fetch("http://127.0.0.1:8000/api/viewCart", {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${sessionStorage.getItem("token")}`,
        },
      })
        .then((response) => response.json())
        .then((data) => setCartItems(data.items));
    }
  }, [cartItemCount]);

  useEffect(() => {
    const totalCost = cartItems.reduce(
      (initialValue, item) =>
        initialValue + item.product_price * item.product_quantity,
      0
    );
    setTotal(totalCost);
  }, [cartItems]);

  const value = {
    isCartOpen,
    setIsCartOpen,
    cartItemCount,
    setCartItemCount,
    cartItems,
    setCartItems,
    total,
  };

  return <CartContext.Provider value={value}>{children}</CartContext.Provider>;
};
