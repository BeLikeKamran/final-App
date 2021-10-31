class Clothes {
  Clothes({this.rating, this.imageLink, this.currency, this.name});
  final String name;
  final String rating;
  final String imageLink;
  final String currency;

  List<Clothes> clothes = [
    new Clothes(
      name: '',
      imageLink: '',
      rating: '',
      currency: '',
    ),
    new Clothes(
      name: '',
      imageLink: '',
      rating: '',
      currency: '',
    ),
    new Clothes(
      name: '',
      imageLink: '',
      rating: '',
      currency: '',
    ),
    new Clothes(
      name: '',
      imageLink: '',
      rating: '',
      currency: '',
    )
  ];
}
