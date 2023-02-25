import 'package:advanceproje/core/constant/image_manager.dart';

class CategoryManager {
  static List allCategory = [
    {
      'category_name': 'All Items',
      'category_image': ImageManager.categoryAll,
    },
    {
      'category_name': 'Dress',
      'category_image': ImageManager.categoryDress,
    },
    {
      'category_name': 'Hat',
      'category_image': ImageManager.categoryHat,
    },
    {
      'category_name': 'Watch',
      'category_image': ImageManager.categoryWatch,
    },
  ];
}
