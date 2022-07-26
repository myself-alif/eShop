import "./productsByCategory.styles.scss";
import { useParams } from "react-router-dom";
import { Fragment, useEffect } from "react";
import SingleProduct from "../single-roduct/single-product";
import { useContext } from "react";
import { ProductsContext } from "../../contexts/products.context";

const ProductsByCategory = () => {
  const { productsByCategory, setProductsByCategory } =
    useContext(ProductsContext);
  const { category } = useParams();

  useEffect(() => {
    fetch(`http://127.0.0.1:8000/api/shop/categories/${category}`)
      .then((response) => response.json())
      .then((data) => setProductsByCategory(data.products));
  }, []);

  return (
    <Fragment>
      <h2>{category.toUpperCase()}</h2>
      <div className="products-container">
        {productsByCategory.map((productByCategory) => (
          <SingleProduct
            key={productByCategory.id}
            product={productByCategory}
          />
        ))}
      </div>
    </Fragment>
  );
};

export default ProductsByCategory;
