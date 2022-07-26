import { useState, createContext, useEffect } from "react";

export const CategoryContext = createContext({
  categories: [],
  setCategories: () => {},
});

export const CategoryProvider = ({ children }) => {
  const [categories, setCategories] = useState([]);

  useEffect(() => {
    fetch("http://127.0.0.1:8000/api/categories")
      .then((response) => response.json())
      .then((data) => setCategories(data.categories));
  }, []);

  const value = { categories, setCategories };
  return (
    <CategoryContext.Provider value={value}>
      {children}
    </CategoryContext.Provider>
  );
};
