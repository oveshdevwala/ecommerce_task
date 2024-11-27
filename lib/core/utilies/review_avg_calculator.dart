import 'package:ecommerce_task/features/product_home/models/model.dart';

String reviewAvgCal(List<ReviewModel?>? review) {
  int totalReview = 0;
  for (var each in review!) {
    totalReview += each!.rating!;
  }
  return (totalReview / review.length).toStringAsFixed(1);
}
