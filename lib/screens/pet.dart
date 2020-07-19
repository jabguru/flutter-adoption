import 'package:adoption/models/pets.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PetPage extends StatelessWidget {
  final Pet pet;
  PetPage(this.pet);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 50.0),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Hero(
                        tag: pet.name,
                        child: Carousel(
                          images: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 40.0),
                              child: Image.asset(pet.imageUrl),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 40.0),
                              child: Image.asset(pet.imageUrl),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 40.0),
                              child: Image.asset(pet.imageUrl),
                            ),
                          ],
                          boxFit: BoxFit.contain,
                          dotBgColor: Colors.white.withOpacity(0.0),
                          dotColor: Colors.white,
                          dotIncreasedColor: Theme.of(context).primaryColor,
                          dotSize: 5.0,
                          dotSpacing: 15.0,
                          autoplay: false,
                        ),
                      ),
                      color: pet.favColour == 'green'
                          ? Color(0xFFC8D3D6)
                          : Color(0xFFECD4B1),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 35.0,
                                color: Colors.grey[700],
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            Icon(
                              Icons.cloud_upload,
                              size: 35.0,
                              color: Colors.grey[700],
                            )
                          ]),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      top: MediaQuery.of(context).size.height * 0.11,
                      bottom: 15.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                child: Icon(Icons.person, color: Colors.white),
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Alibrown Julius',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      letterSpacing: 1.1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Text(
                                    'Owner',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            'May 15, 2019',
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'My job requires moving to another country, I don\'t have the opportunity to take the cat with me. I am looking for good people who will shelter my ${pet.name}.',
                        style: TextStyle(
                          letterSpacing: 1.1,
                          color: Colors.grey[500],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 55.0,
                          width: 65.0,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.4),
                                  blurRadius: 10.0, //extend the shadow
                                  offset: Offset(
                                    0.0, // Move to right 10  horizontally
                                    10.0, // Move to bottom 10 Vertically
                                  ),
                                ),
                              ]),
                          child: Icon(
                            FontAwesomeIcons.heart,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          height: 55.0,
                          width: 215.0,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.4),
                                  blurRadius: 10.0, //extend the shadow
                                  offset: Offset(
                                    0.0, // Move to right 10  horizontally
                                    10.0, // Move to bottom 10 Vertically
                                  ),
                                ),
                              ]),
                          child: Center(
                            child: Text(
                              'Adoption',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 30.0,
              right: 30.0,
              top: MediaQuery.of(context).size.height * 0.42,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                width: MediaQuery.of(context).size.width,
                height: 120.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          pet.name,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                        Icon(
                          pet.gender == 'male'
                              ? FontAwesomeIcons.mars
                              : FontAwesomeIcons.venus,
                          color: Colors.grey[500],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          pet.family,
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          '${pet.age} years old',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Lagos State.',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
