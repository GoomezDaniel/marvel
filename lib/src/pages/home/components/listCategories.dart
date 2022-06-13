import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel/src/models/categories.dart';
import '../../../size_config.dart';

/// Contructor to the module of the categories
class ListCategories extends StatelessWidget {
  const ListCategories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Categories> categories = [
      Categories(
          title: 'Characters',
          image: 'assets/images/characters.jpg',
          color: Colors.redAccent[700]),
      Categories(
          title: 'Comics',
          image: 'assets/images/comics.jpg',
          color: Colors.yellowAccent[700]),
      Categories(
          title: 'Events',
          image: 'assets/images/events.jpg',
          color: Colors.blueAccent[700]),
      Categories(
          title: 'Series',
          image: 'assets/images/series.jpg',
          color: Colors.greenAccent[700])
      /*Categories(
          title: 'Stories',
          image: 'assets/images/stories.jpeg',
          color: Colors.purpleAccent[700]),*/
    ];

    return Container(
      width: screenWidth(),
      height: getProportionateScreenHeight(100),
      child: GridView.builder(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: getProportionateScreenWidth(10)),
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {},
                child: ContainerCategories(type: categories, index: index));
          }),
    );
  }
}

/// Constructor the container of the categories
class ContainerCategories extends StatelessWidget {
  const ContainerCategories({
    Key key,
    @required List<Categories> type,
    this.index,
  })  : _type = type,
        super(key: key);

  final List<Categories> _type;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: getProportionateScreenHeight(20),
          bottom: getProportionateScreenHeight(5)),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Theme.of(context).backgroundColor, blurRadius: 6)
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              _type[index].image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    _type[index].color.withOpacity(0.2),
                    _type[index].color.withOpacity(0.9)
                  ]),
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(_type[index].title.toUpperCase(),
                        style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenHeight(15)))),
              )),
        ]),
      ),
    );
  }
}
