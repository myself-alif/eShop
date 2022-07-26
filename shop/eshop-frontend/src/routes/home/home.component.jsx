import Directory from "../../components/directory/directory.component";
import { Outlet } from "react-router-dom";
import { useContext } from "react";
import { CategoryContext } from "../../contexts/categories.context";
const Home = () => {
  const { categories } = useContext(CategoryContext);

  return (
    <div>
      <Directory categories={categories} />
      <Outlet />
    </div>
  );
};

export default Home;
