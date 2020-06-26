package product.model;

import java.sql.SQLException;
import java.util.List;

public interface InterProductDAO {

	// product list
	List<ProductVO> getProductList() throws SQLException;

}
