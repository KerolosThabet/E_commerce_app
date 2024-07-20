import 'package:e_commerce_route/data/model/categories_response/CategoryModel.dart';
import 'package:e_commerce_route/domain/entites/CategoryEntity.dart';

import 'BrandEntity.dart';
import 'SubcategoryEntity.dart';


/// sold : 10148
/// images : ["https://ecommerce.routemisr.com/Route-Academy-products/1680403156555-3.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403156555-2.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403156554-1.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403156556-4.jpeg"]
/// subcategory : [{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}]
/// ratingsQuantity : 18
/// _id : "6428ead5dc1175abc65ca0ad"
/// title : "Woman Shawl"
/// slug : "woman-shawl"
/// description : "Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen"
/// quantity : 220
/// price : 149
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680403156501-cover.jpeg"
/// category : {"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"}
/// brand : {"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"}
/// ratingsAverage : 4.8
/// createdAt : "2023-04-02T02:39:17.204Z"
/// updatedAt : "2024-06-26T10:12:27.450Z"
/// id : "6428ead5dc1175abc65ca0ad"

class ProductEntity {
  ProductEntity({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 

      });

  num? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryEntity? category;
  BrandEntity? brand;
  num? ratingsAverage;


}