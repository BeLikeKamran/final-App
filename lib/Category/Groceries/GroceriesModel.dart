class Groceries {
  Groceries({this.rating, this.imageLink, this.currency, this.name});
  final String name;
  final String rating;
  final String imageLink;
  final String currency;

  List<Groceries> groceries = [
    new Groceries(
      name: '',
      imageLink: '',
      rating: '',
      currency: '',
    ),
    new Groceries(
      name: '',
      imageLink: '',
      rating: '',
      currency: '',
    ),
    new Groceries(
      name: '',
      imageLink: '',
      rating: '',
      currency: '',
    ),
    new Groceries(
      name: '',
      imageLink: '',
      rating: '',
      currency: '',
    )
  ];
}
