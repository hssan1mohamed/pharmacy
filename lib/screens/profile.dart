import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GFG Slider"),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("img/img1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text("hassan"),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  //  image: DecorationImage(
                  //  image: NetworkImage(
                  //    "https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fdepositphotos.com%2F49564259%2Fstock-photo-3d-text.html&psig=AOvVaw0dysQxi3XWK7oC3H2D1e7E&ust=1650025448654000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJim2JfIk_cCFQAAAAAdAAAAABAI"),
                  //      fit: BoxFit.cover,
                  //   ),
                ),
                child: Text("hassan"),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
