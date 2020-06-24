package product.model;

public class ProductVO {
   
   private String parentTable;
   private String productId;
   private String categoryID;
   /* private String productSeq; */
   private String name;
   private String nameEng;
   private String description;
   private int price;
   private String img;
   private NutritionVO nutrition;
   private String custom = "";
   
   public ProductVO() {
      
   }

   public ProductVO(String parentTable, String productId, String categoryID, String name, String nameEng,
         String description, int price, String img) {
      super();
      this.parentTable = parentTable;
      this.productId = productId;
      this.categoryID = categoryID;
      this.name = name;
      this.description = description;
      this.price = price;
      this.img = img;
   }

   public String getParentTable() {
      return parentTable;
   }

   public void setParentTable(String parentTable) {
      this.parentTable = parentTable;
   }
   
   public String getProductId() {
      return productId;
   }

   public void setProductId(String productId) {
      this.productId = productId;
   }

   public String getcategoryID() {
      return categoryID;
   }

   public void setcategoryID(String categoryID) {
      this.categoryID = categoryID;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getNameEng() {
      return nameEng;
   }

   public void setNameEng(String nameEng) {
      this.nameEng = nameEng;
   }

   public String getDescription() {
      return description;
   }

   public void setDescription(String description) {
      this.description = description;
   }

   public int getPrice() {
      return price;
   }

   public void setPrice(int price) {
      this.price = price;
   }

   public String getImg() {
      return img;
   }

   public void setImg(String img) {
      this.img = img;
   }
   
   public NutritionVO getNutrition() {
      return nutrition;
   }
   
   public void setNutrition(NutritionVO nutrition) {
      this.nutrition = nutrition;
   }
   
   public String getCustom() {
	   return custom;
   }
	
   public void setCustom(String custom) {
	   this.custom = custom;
   }
	
}

