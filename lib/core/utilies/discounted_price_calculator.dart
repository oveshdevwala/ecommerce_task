String discountedPrice(double price, double discount) {
  return (price * (1 - discount / 100)).toStringAsFixed(2);
}
