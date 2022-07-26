import { Fragment, useContext } from "react";
import { ProductsContext } from "../../contexts/products.context";
import { Link } from "react-router-dom";
import SingleProduct from "../../components/single-roduct/single-product";
import "./categories.styles.scss";
import "../../components/product-card/product-card.styles.scss";

const CategoriesComponent = () => {
  const { products } = useContext(ProductsContext);

  return (
    <div className="category-preview-container">
      {products.map((product) => {
        return (
          <div style={{ marginBottom: "80px" }} key={product.name}>
            <h2>
              <Link to={`/shop/${product.name}`}>
                {product.name.toUpperCase()}
              </Link>
            </h2>
            <div className="preview">
              {product.items.map((item, index) =>
                index <= 3 ? (
                  <SingleProduct key={item.id} product={item} />
                ) : (
                  false
                )
              )}
            </div>
          </div>
        );
      })}
      {/* {products.map((product) => {
        console.log(product);
        return <ProductCard key={product.id} product={product} />;
      })} */}

      {/* <ProductCard products={products} /> */}
    </div>
  );
};

export default CategoriesComponent;
