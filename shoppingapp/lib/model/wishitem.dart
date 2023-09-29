class wishtItem {
  final int id;
  final String image;
  final String productTitle;

  final double productPrice;

  var quantity;

  wishtItem(
      {required this.id,
      required this.image,
      required this.productTitle,
      required this.productPrice});
}
