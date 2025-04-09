class BannerEntity {
  String? id;
  bool isMen;
  bool isWomen;
  bool isAdornments;
  String image;
  String targetScreen;
  bool active;

  BannerEntity({
    this.id,
    required this.isMen,
    required this.isWomen,
    required this.isAdornments,
    required this.image,
    required this.targetScreen,
    required this.active,
  });
}
