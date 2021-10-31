class AutoMobiles {
  AutoMobiles({this.rating, this.imageLink, this.currency, this.name});
  final String name;
  final String rating;
  final String imageLink;
  final String currency;

  List<AutoMobiles> autoMobiles = [
    new AutoMobiles(
      name: '',
      imageLink: '',
      rating: '',
      currency: '',
    ),
    new AutoMobiles(
      name: '',
      imageLink: '',
      rating: '',
      currency: '',
    ),
    new AutoMobiles(
      name: '',
      imageLink: '',
      rating: '',
      currency: '',
    ),
    new AutoMobiles(
      name: '',
      imageLink: '',
      rating: '',
      currency: '',
    )
  ];
}
