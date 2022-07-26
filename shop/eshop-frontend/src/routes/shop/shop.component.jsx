import { Route, Routes } from "react-router-dom";
import ProductsByCategory from "../../components/productsByCategory/productsByCategory.component";
import CategoriesComponent from "../categories-preview/categories-preview.component";

import "./shop.styles.scss";

const Shop = () => {
  return (
    <Routes>
      <Route index element={<CategoriesComponent />} />
      <Route path=":category" element={<ProductsByCategory />} />
    </Routes>
  );
};

export default Shop;
