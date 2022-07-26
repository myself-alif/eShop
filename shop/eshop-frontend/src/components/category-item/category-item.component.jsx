import "./category-item.styles.scss";
import { Link } from "react-router-dom";
const CategoryItem = ({ category }) => {
  const { image, title } = category;
  return (
    <div className="category-container">
      <Link
        to={`/shop/${title}`}
        className="background-image"
        style={{
          backgroundImage: `url(${image})`,
        }}
      />
      <div className="category-body-container">
        <h2>{title}</h2>
        <p>SHOP NOW</p>
      </div>
    </div>
  );
};
export default CategoryItem;
