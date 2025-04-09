class ProductsVeriationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  int soldQuantity;
  Map<String, String> attributesValues;

  ProductsVeriationModel({
    required this.id,
    this.sku = "",
    this.image = "",
    this.description = "",
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    this.soldQuantity = 0,
    required this.attributesValues,
  });

  static ProductsVeriationModel empty() =>
      ProductsVeriationModel(id: "", attributesValues: {});

  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "Image": image,
      "Description": description,
      "Price": price,
      "SalePrice": salePrice,
      "SKU": sku,
      "Stock": stock,
      "SoldQuantity": soldQuantity,
      "AttributesValues": attributesValues,
    };
  }

  factory ProductsVeriationModel.fromJson(Map<String, dynamic> document) {
    if (document.isEmpty) return ProductsVeriationModel.empty();

    return ProductsVeriationModel(
      id: document["Id"] ?? "",
      sku: document["SKU"] ?? "",
      image: document["Image"] ?? "",
      description: document["Description"],
      price: double.tryParse(document["Price"]?.toString() ?? "0.0") ?? 0.0,
      salePrice:
          double.tryParse(document["SalePrice"]?.toString() ?? "0.0") ?? 0.0,
      stock: document["Stock"] ?? 0,
      soldQuantity: document["SoldQuantity"] ?? 0,
      attributesValues: Map<String, String>.from(
        document["AttributesValues"] ?? {},
      ),
    );
  }
}
