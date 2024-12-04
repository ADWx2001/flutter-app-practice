import 'package:flutter/material.dart';
import 'package:shopping_app_ui/widgets/app_bar/app_bar.dart';
import 'package:shopping_app_ui/widgets/tiles/tile.dart';
import 'package:shopping_app_ui/widgets/app_bar/search_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: appBarLeading,
        title: appBarTitle,
        actions: appBaractions,
        shadowColor: Colors.black.withOpacity(0.50),
        elevation: 2,
      ),
      
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySearchBar(),
              SizedBox(height: 5,),
              Text("Explore Items",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductCard(
                    title: 'Vegetable', 
                    description: 'Small description heree', 
                    textColor: Colors.white, 
                    backgroundColor: Colors.green,
                    boxColor: Colors.red,
                  ),
                  ProductCard(
                    title: 'Toys', 
                    description: 'Small description heree', 
                    textColor: Colors.white, 
                    backgroundColor: Colors.purple, 
                    boxColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductCard(
                    title: 'Vegetable', 
                    description: 'Small description heree', 
                    textColor: Colors.white, 
                    backgroundColor: Colors.green, 
                    boxColor: Colors.yellow,
                  ),
                  ProductCard(
                    title: 'Toys', 
                    description: 'Small description heree', 
                    textColor: Colors.white, 
                    backgroundColor: Colors.purple, 
                    boxColor: Colors.white,
                  ),
                ],
              ),

            ],
          ),
        ),
      ),

    );
  }
}