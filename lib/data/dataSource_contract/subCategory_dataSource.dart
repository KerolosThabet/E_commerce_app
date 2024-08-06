
import 'package:dartz/dartz.dart';

import '../model/SubCategory_response/SubCategoryResponse.dart';

abstract class SubcategoryDatasource{
 Future<Either<SubCategoryResponse,String>> getSubcategoryDatasource(String CategoryID);
}