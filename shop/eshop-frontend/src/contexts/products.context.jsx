import { useState, useEffect, createContext } from "react";

export const ProductsContext = createContext({
  products: [],
  productsByCategory: [],
  setProductsByCategory: () => {},
});

export const ProductsProvider = ({ children }) => {
  const [products, setProducts] = useState([]);
  const [productsByCategory, setProductsByCategory] = useState([]);

  useEffect(() => {
    fetch("http://127.0.0.1:8000/api/shop")
      .then((response) => response.json())
      .then((data) => setProducts(data.products));
  }, []);

  const value = { products, productsByCategory, setProductsByCategory };
  return (
    <ProductsContext.Provider value={value}>
      {children}
    </ProductsContext.Provider>
  );
};
