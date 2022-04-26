import 'package:flutter/material.dart';
import 'package:pharmacy/layout/home_layout.dart';
import 'package:pharmacy/moduels/sign_in/sign_in.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';




class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  var boardController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/shop.png',
      title: 'شراء الادوية عبر الانترنت',
      body: 'اختيار وشراء الادوية دون زيارة الصيدلية',
    ),
    BoardingModel(
      image: 'assets/images/shop1.png',
      title: 'الكل في مكان واحد',
      body: "استشارة الطبيب وطلب الادوية ..  كل شئ هنا"
    ),
    BoardingModel(
      image: 'assets/images/shop3.png',
      title: 'شحن سريع توصيل خلال دقائق',
      body: 'نقوم بتوصيل الادوية الخاصة بكم  بسرعة ',
    ),
  ];
  bool isLast = false;
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length-1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    bulidBorderingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [

                TextButton(
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()),
                              (route)=>false
                      );

                    },
                    child: Text('تخطي',style: TextStyle(fontWeight: FontWeight.bold
                        ,color: Colors.cyan),)),
                Spacer(),

                SmoothPageIndicator(

                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.cyan,
                      dotHeight: 6,
                      expansionFactor: 4,
                      dotWidth: 6,
                      spacing: 5),
                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.cyan,
                  onPressed: () {
                    if (isLast) {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()),
                              (route)=>false
                      );

                    } else {
                      boardController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget bulidBorderingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Image(
            image: AssetImage('${model.image}'),
            // fit: BoxFit.fill,
          )),
          Text(
            '${model.title}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            '${model.body}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.grey),
          ),
        ],
      );
}
