import 'package:adoption/screens/pet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pet extends StatelessWidget {
  final String name;
  final String family;
  final double age;
  final double distance;
  final String imageUrl;
  final String gender;
  final String favColour;

  Pet({
    this.name,
    this.family,
    this.age,
    this.distance,
    this.imageUrl,
    this.gender,
    this.favColour,
  });

  factory Pet.fromMap(Map map) {
    return Pet(
      name: map['name'],
      family: map['family'],
      age: map['age'],
      distance: map['distance'],
      imageUrl: map['imageUrl'],
      gender: map['gender'],
      favColour: map['favColour'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => PetPage(this))),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: 170.0,
                right: 10.0,
                top: 10.0,
                bottom: 10.0,
              ),
              alignment: Alignment.centerRight,
              width: double.infinity,
              height: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 25.0, //extend the shadow
                    offset: Offset(
                      5.0, // Move to right 10  horizontally
                      15.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                      FaIcon(
                        gender == 'male'
                            ? FontAwesomeIcons.mars
                            : FontAwesomeIcons.venus,
                        color: Colors.grey[500],
                      ),
                    ],
                  ),
                  Text(
                    family,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    '$age years old',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).primaryColor,
                        size: 15.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Distance: $distance km',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: favColour == 'green'
                        ? Color(0xFFC8D3D6)
                        : Color(0xFFECD4B1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 25.0, //extend the shadow
                        offset: Offset(
                          15.0, // Move to right 10  horizontally
                          15.0, // Move to bottom 10 Vertically
                        ),
                      ),
                    ],
                  ),
                  height: 200.0,
                  width: 160.0,
                ),
                Hero(
                  tag: name,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30.0),
                    width: 160.0,
                    height: 220.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imageUrl), fit: BoxFit.fitHeight),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List petsList = [
  {
    'name': 'Sola',
    'age': 2.0,
    'gender': 'male',
    'family': 'Abyssinian cat',
    'distance': 3.6,
    'favColour': 'green',
    'imageUrl': 'assets/images/abyssinian.png',
  },
  {
    'name': 'Orion',
    'age': 1.5,
    'gender': 'female',
    'family': 'Abyssinian cat',
    'distance': 7.8,
    'favColour': 'orange',
    'imageUrl': 'assets/images/abyssinian2.png',
  }
];
