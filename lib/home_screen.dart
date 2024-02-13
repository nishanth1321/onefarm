import 'package:flutter/material.dart';
import 'package:main_pro/Availabilities.dart';
import 'drawermenu.dart';
import 'package:main_pro/icons.dart';
import 'colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<String> bannerlist = [
    "https://images.pexels.com/photos/1274613/pexels-photo-1274613.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/1656663/pexels-photo-1656663.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/3036364/pexels-photo-3036364.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/209482/pexels-photo-209482.jpeg?auto=compress&cs=tinysrgb&w=400",
  ];

  double translateX = 0.0;
  double translatey = 0.0;

  double scale = 1;

  bool toogle = false;
  late AnimationController _animationcontroller;
  @override
  void initState() {
    _animationcontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DrawerMenu(),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          transform: Matrix4.translationValues(translateX, translatey, 0)
            ..scale(scale),
          child: ClipRRect(
            borderRadius:
                (toogle) ? BorderRadius.circular(20) : BorderRadius.circular(0),
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_arrow,
                      color: Colors.black,
                      progress: _animationcontroller),
                  /* icon: const Icon(
                    Icons.menu,
                    color: Color.fromARGB(255, 70, 3, 82),
                  ),*/
                  onPressed: () {
                    toogle = !toogle;
                    if (toogle) {
                      translateX = 200;
                      translatey = 80;
                      scale = 0.8;
                      _animationcontroller.forward();
                    } else {
                      translateX = 0.0;
                      translatey = 0.0;
                      scale = 1;
                      _animationcontroller.reverse();
                    }
                    setState(() {});
                  },
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Delivery To:",
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        print("Clicked");
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Current Location",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: primarycolor,
                            size: 30,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                height: 45,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(30),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(30),
                                    onTap: () {},
                                    child: const Row(
                                      children: [
                                        Icon(Icons.search),
                                        Text(
                                          "Search Product",
                                          style: TextStyle(fontSize: 16.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              filter_image,
                              height: 30,
                              width: 40,
                              color: primarycolor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: titletext(context, "Availabilities"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Container(
                          height: 115,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()),
                              );
                            },
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: listCards.length,
                                itemBuilder: (context, index) {
                                  return categorycard(
                                      categoryModel: listCards[index]);
                                }),
                          ),
                        ),
                      ),
                      titletext(context, "Most Purchased"),
                      for (int i = 0; i < bannerlist.length; i++) ...{
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0, top: 10),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 236, 219, 240),
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                  ),
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (toogle != listCards[i])
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyApp()));
                                  },
                                  child: Container(
                                    height: 220,
                                    margin: const EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      image: DecorationImage(
                                        image: NetworkImage(bannerlist[i]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("product name",
                                      style: TextStyle(fontSize: 17)),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: primarycolor,
                                        size: 23,
                                      ),
                                      Text(
                                        "4.5",
                                        style: TextStyle(
                                            color: primarycolor, fontSize: 16),
                                      ),
                                      Text(
                                        "(128 Ratings)",
                                        style: TextStyle(
                                            fontSize: 16, color: primarycolor),
                                      ),
                                      Spacer(),
                                      Text("Senthil"),
                                      Text(" \$5")
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2)
                              ],
                            ),
                          ),
                        ),
                      }
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Text titletext(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 21),
    );
  }
}

class categorycard extends StatelessWidget {
  final CategoryModel categoryModel;
  const categorycard({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(top: 5, bottom: 2, right: 5, left: 8),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 236, 219, 240),
              borderRadius: BorderRadius.circular(15)),
          child: Image.asset(
            categoryModel.imageurl,
          ),
        ),
        Text(
          categoryModel.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 17),
        )
      ],
    );
  }
}

class CategoryModel {
  String imageurl;
  String title;
  CategoryModel(this.imageurl, this.title);
}

List<CategoryModel> listCards = [
  CategoryModel(carrot_image, "Carrot"),
  CategoryModel(potato_image, "Potato"),
  CategoryModel(tomato_image, "Tomato"),
  CategoryModel(onion_image, "Onion"),
  CategoryModel(pumpkin_image, "Pumpkin"),
];

// ignore: empty_constructor_bodies
class popularItemModel {
  late String Productname;
  late int Productprice;
  late double Rating;
  late double RatingCount;
  popularItemModel({
    required this.Productname,
    required this.Productprice,
    required this.Rating,
    required this.RatingCount,
  });
}
