class EndPoint {
  static const String categoriesEndPoint ="/api/v1/categories";
  static const String brandsEndPoint ="/api/v1/brands";
  static const String ProductsEndPoint ="/api/v1/products";
  static const String SignUpEndPoint = "/api/v1/auth/signup";
  static const String SignINEndPoint = "/api/v1/auth/signin";
  static String SubCategoryEndPoint (categoryId)=> '/api/v1/categories/$categoryId/subcategories';
}