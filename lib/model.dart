class Home {
  final String title;
  final String image;
  final String price;
  final String desc;

  Home({required this.title, required this.image, required this.price, required this.desc});
}

final List<Home> homes = [
  //Cones category
  Home(
      title: "Strawberry Cheesecake",
      image: "images/piz.png",
      price: "Rs 180",
      desc: "Delicious strawberry Cheesecake "),
  Home(
      title: "Chocolate Cone",
      image: "images/piz.png",
      price: "Rs 180",
      desc: "Rich chocolate flavored"),
  Home(
      title: "Caramel Cone",
      image: "images/piz.png",
      price: "Rs 200",
      desc: "Creamy caramel flavored ice cream in a cone."),
  Home(
      title: "Blueberry Cone",
      image: "images/piz.png",
      price: "Rs 150",
      desc:
          "The most running item, our Creamy "),
  Home(
      title: 'Sprinkled Cone',
      image: "images/piz.png",
      price: "Rs 150",
      desc:
          "Rich and Extra Sprinkled ice cream "),

  
];