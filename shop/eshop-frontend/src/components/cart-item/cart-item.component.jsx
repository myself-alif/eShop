import "./cart-item.styles.scss";

const CartItem = ({ cartItem }) => {
  const { product_title, product_quantity, product_image, product_price } =
    cartItem;
  return (
    <div className="cart-item-container">
      <img src={product_image} />
      <div className="item-details">
        <span className="name">{product_title}</span>
        <span className="price">
          {product_quantity} x ${product_price}
        </span>
      </div>
    </div>
  );
};

export default CartItem;
