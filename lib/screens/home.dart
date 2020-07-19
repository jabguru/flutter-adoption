import 'package:adoption/models/pets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int catSelectedIndex = 0;

  List<Map> categoriesMap = [
    {'name': 'Cats', 'icon': FontAwesomeIcons.cat, 'index': 0},
    {'name': 'Dogs', 'icon': FontAwesomeIcons.dog, 'index': 1},
    {'name': 'Parrots', 'icon': FontAwesomeIcons.kiwiBird, 'index': 2},
    {'name': 'Horses', 'icon': FontAwesomeIcons.horse, 'index': 3},
    {'name': 'Fishes', 'icon': FontAwesomeIcons.fish, 'index': 4},
  ];

  buildCategories(BuildContext context) {
    List<Widget> categories = [];
    categoriesMap.forEach((cat) {
      final category = buildCategoriesIcons(cat);
      categories.add(category);
    });
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 110.0),
      child: ListView(
        padding: const EdgeInsets.only(left: 30.0),
        children: categories,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  buildCategoriesIcons(Map category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          catSelectedIndex = category['index'];
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Material(
              elevation: catSelectedIndex == category['index'] ? 10.0 : 7.0,
              shadowColor: catSelectedIndex == category['index']
                  ? Theme.of(context).primaryColor
                  : Colors.black,
              color: catSelectedIndex == category['index']
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                height: 60.0,
                width: 60.0,
                child: Icon(
                  category['icon'],
                  size: 30.0,
                  color: catSelectedIndex == category['index']
                      ? Colors.white
                      : Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              category['name'],
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  buildPetsList(BuildContext context) {
    List<Pet> pets = [];
    petsList.forEach((map) {
      final pet = Pet.fromMap(map);
      pets.add(pet);
    });
    return Expanded(
      flex: 3,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        children: pets,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey[700],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'Location',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14.0,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Theme.of(context).primaryColor,
                  size: 22.0,
                ),
                Text(
                  ' Kyiv, ',
                  style: TextStyle(
                      color: Colors.grey[700], fontWeight: FontWeight.bold),
                ),
                Text(
                  'Ukraine',
                  style: TextStyle(
                      color: Colors.grey[700], fontWeight: FontWeight.w300),
                )
              ],
            )
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: 15.0,
            ),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 15.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.sort),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search pet to adopt',
                      border: InputBorder.none),
                ),
              ),
            ),
            buildCategories(context),
            buildPetsList(context),
          ],
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Alibrown Julius',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text('Active status',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 12.0,
                            )),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildNavMenuList(
                        icon: FontAwesomeIcons.paw,
                        title: 'Adoption',
                        isFirst: true),
                    buildNavMenuList(
                        icon: FontAwesomeIcons.solidEnvelopeOpen,
                        title: 'Donation'),
                    buildNavMenuList(
                        icon: FontAwesomeIcons.plus, title: 'Add pet'),
                    buildNavMenuList(
                        icon: FontAwesomeIcons.solidHeart, title: 'Favourite'),
                    buildNavMenuList(
                        icon: FontAwesomeIcons.solidEnvelope,
                        title: 'Messages'),
                    buildNavMenuList(icon: Icons.person, title: 'Profile'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 18.0,
                    ),
                    Text(
                      'Settings   |   Log out',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 18.0,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildNavMenuList({String title, IconData icon, bool isFirst = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: isFirst ? Colors.white : Colors.white.withOpacity(0.5),
          ),
          SizedBox(width: 18.0),
          Text(
            title,
            style: TextStyle(
              color: isFirst ? Colors.white : Colors.white.withOpacity(0.5),
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
