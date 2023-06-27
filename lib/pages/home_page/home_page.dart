import 'package:app/constants.dart';
import 'package:app/data/data.dart';
import 'package:app/models/food_model.dart';
import 'package:app/pages/details_page/details_page.dart';
import 'package:app/pages/home_page/components/food_item.dart';
import 'package:app/pages/home_page/components/home_deliver_ads.dart';
import 'package:flutter/material.dart';

Size? size;

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static final GlobalKey<ScaffoldState> _scaffoldkey =
      GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldkey,
      drawer: const Drawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _scaffoldkey.currentState!.openDrawer(),
          icon: menuIcon,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: userIcon),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size!.width * .068),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Everything in your\ndoor step",
                style: Theme.of(context).textTheme.bodyText1!,
              ),
              SizedBox(
                height: size!.height * .039,
              ),

              /// Stay home we deliver ads
              const HomeDeliverAds(),
              const SizedBox(height: 20),
              GridView.builder(
                itemCount: foodList.length,
                shrinkWrap: true,
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 31,
                ),
                itemBuilder: (context, index) {
                  FoodModel foodModel = foodList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return FadeTransition(
                              opacity: animation,
                              child: DetailPage(
                                foodModel: foodModel,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: FoodItem(
                      foodModel: foodModel,
                      tag: foodModel.image,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
