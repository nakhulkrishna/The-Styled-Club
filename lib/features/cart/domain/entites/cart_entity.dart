class CartEntity {
  final String productId;
  final String title;
  final double price;
  final String? image;
  final int quantity;
  final String variationId;
  final String? brandName;
  final Map<String, String>? selectedVariation;

  const CartEntity({
    required this.productId,
    required this.title,
    required this.price,
    this.image,
    required this.quantity,
    required this.variationId,
    this.brandName,
    this.selectedVariation,
  });
}
