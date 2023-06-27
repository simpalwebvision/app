import 'package:app/constants.dart';
import 'package:app/models/food_model.dart';
import 'package:app/pages/components/color_picker.dart';
import 'package:flutter/material.dart';

class FoodItem extends StatefulWidget {
  final FoodModel foodModel;
  final String tag;
  const FoodItem({super.key, required this.foodModel, required this.tag});

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  Color? color;
  Future getColor() async {
    Color? color = await getImagePalette(
      AssetImage(widget.foodModel.image),
    );
    setState(() {
      this.color = color;
    });
  }

  @override
  void initState() {
    super.initState();
    getColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: kBorderColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: color == null
                    ? Container()
                    : CircleAvatar(
                        radius: 50,
                        backgroundColor: color!.withOpacity(0.4),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: color,
                        ),
                      ),
              ),
              Hero(
                tag: widget.tag,
                child: Image.asset(
                  widget.foodModel.image,
                  height: 90,
                  width: 90,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.foodModel.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 20),
              ),
              const SizedBox(height: 7),
              Text(
                widget.foodModel.weight,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "\$",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14),
                  ),
                  Text(
                    widget.foodModel.price.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 19),
                  )
                ],
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
