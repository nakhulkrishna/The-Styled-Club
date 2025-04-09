class CategoryEntity {
  String name;
  String id;
  String image;
  String parentId;
  bool isFeatured;
  bool isMinimalStyle; // 🔥 New field
  String itemCategory; // 🔥 New field
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isSharpDressing;

  CategoryEntity({
    required this.name,
    required this.id,
    required this.image,
    this.isSharpDressing = false,
    this.parentId = "",
    this.isFeatured = false,
    this.isMinimalStyle = false, // 👈 Default false
    this.itemCategory = "", // 👈 Default empty
    this.createdAt,
    this.updatedAt,
  });
}
