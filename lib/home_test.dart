import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class HomeTest extends StatelessWidget {
  const HomeTest({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List imgs = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcP_KqqYxJF7MBsD6j5svjS84mOdPgSrRJjg&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBiLksanWFFnR0bvwAPwPIgt2v0McmsUgiYg&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVqUvJVBXyvjMRAEQe60Xj9357mZd-DKFBrw&usqp=CAU',
    ];

    Widget container(String url) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.fill,
          ),
        ),
      );
    }
    IndexedWidgetBuilder itemBuilder;

    return Scaffold(
      appBar:  AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Abo El Ezz ',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.cyan),
          ),
          centerTitle: true),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          SizedBox(height: 10,),
      CarouselSlider(
      items: [
        container(imgs[0]),
        container(imgs[1]),
        container(imgs[2]),

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
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(15),
            child: const Text(
              "Catigores",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            ),
          ),
          itemName(),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(15),
            child: const Text(
              "all product",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Grad(),
          ),









        ],
      ),
    );
  }
}
 class itemName extends StatelessWidget {
   const itemName({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: SingleChildScrollView(
         physics: BouncingScrollPhysics(),
         scrollDirection: Axis.horizontal,
         child: Row(
           children: [
             Container(
               height: 50,
               width: 50,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Colors.cyan
               ),
               child: Center(
                 child: Text('add',style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold
                 ),),
               ),

             ),
            SizedBox(width: 10,),
             Container(
               height: 50,
               width: 50,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Colors.cyan
               ),
               child: Center(
                 child: Text('add',style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold
                 ),),
               ),

             ),
             SizedBox(width: 10,),
             Container(
               height: 50,
               width: 50,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Colors.cyan
               ),
               child: Center(
                 child: Text('add',style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold
                 ),),
               ),

             ),
             SizedBox(width: 10,),
             Container(
               height: 50,
               width: 50,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Colors.cyan
               ),
               child: Center(
                 child: Text('add',style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold
                 ),),
               ),

             ),
             SizedBox(width: 10,),
             Container(
               height: 50,
               width: 50,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Colors.cyan
               ),
               child: Center(
                 child: Text('add',style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold
                 ),),
               ),

             ),
             SizedBox(width: 10,),
             Container(
               height: 50,
               width: 50,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Colors.cyan
               ),
               child: Center(
                 child: Text('add',style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold
                 ),),
               ),

             ),
             SizedBox(width: 10,),
             Container(
               height: 50,
               width: 50,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Colors.cyan
               ),
               child: Center(
                 child: Text('add',style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold
                 ),),
               ),

             ),
           ],
         ),
       ),
     );
   }
 }
class Grad extends StatelessWidget {
  const Grad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: ScrollPhysics(),
      shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: 8,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
             boxShadow: [
               BoxShadow(
                 color: Colors.black12,
                 spreadRadius: 1,
                 blurRadius: 8,
                 offset: Offset(0,4)
               )
             ]

            ),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/tes.png'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
               // Image.asset('assets/images/img1.jpg',fit: BoxFit.cover,),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Name",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(



                      children: [
                        Spacer(),
                        InkWell(
                          child: Container(
                            height: 30,
                            width: 20,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.cyan,
                            ),
                            child: Icon(Icons.remove,size: 18,color: Colors.white,),
                          ),
                          onTap: (){},
                        ),
                        Spacer(),
                        Text('01',style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        Spacer(),
                        InkWell(
                          child: Container(
                            height: 30,
                            width: 20,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.cyan,
                            ),
                            child: Icon(Icons.add,size: 18,color: Colors.white,),
                          ),
                          onTap: (){},
                        ),
                        Spacer(),
                        InkWell(
                          child: Container(
                            height: 30,
                            width: 20,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Icon(Icons.shopping_cart,size: 20,),
                          ),
                          onTap: (){},
                        ),
                        Spacer()




                      ],
                    ),
                  ),
                )


              ],
            ),
          );
        }
        );
  }
}



