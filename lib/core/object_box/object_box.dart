import 'package:ecommerce_task/core/object_box/models/product_model_box.dart';
import 'package:ecommerce_task/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  late final Store store;

  late final Box<ProductModelBox> productBox; // For storing products.

  ObjectBox._create(this.store) {
    productBox = Box<ProductModelBox>(store);
  }

  static Future<ObjectBox> create() async {
    final dir = await getApplicationDocumentsDirectory();
    final store = Store(
      getObjectBoxModel(),
      directory: '${dir.path}/objectbox',
    );
    return ObjectBox._create(store);
  }
}
