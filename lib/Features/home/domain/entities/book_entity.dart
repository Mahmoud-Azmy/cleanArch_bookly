class BookEntity {
  final String bookId;
  final String? image;
  final String title;
  final String? autherName;
  final num? price;
  final num? rating;

  BookEntity(
      {required this.bookId,
      required this.image,
      required this.title,
      required this.autherName,
      required this.price,
      required this.rating});
}
