// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
class ProductModelBox {
  @Id()
  int id ;
  int productId;
  String name;
  double price;
  double discountPercentage;
  String description;
  String imageUrl;
  int quantity;

  ProductModelBox({
     this.id=0,
    required this.productId,
    required this.name,
    required this.price,
    required this.discountPercentage,
    required this.description,
    required this.imageUrl,
    required this.quantity,
  });


  ProductModelBox copyWith({
    int? id,
    int? productId,
    String? name,
    double? price,
    double? discountPercentage,
    String? description,
    String? imageUrl,
    int? quantity,
  }) {
    return ProductModelBox(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
    );
  }
}
