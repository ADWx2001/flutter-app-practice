import 'package:awsome_places/pages/natural_wonders.dart';
import 'package:awsome_places/widgets/home/category_card.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart' as colors;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Awsome",
                          style: TextStyle(
                              fontSize: 20,
                              color: colors.mainTextColor,
                              fontWeight: FontWeight.w300),
                        ),
                        const Text(
                          "Places",
                          style: TextStyle(
                              fontSize: 40,
                              color: colors.mainColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(100.0)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "welcome to the app jkjk jnauerco uahf cmwjeof amsdiqjjndmmaddljii cndkm mkmadm iikmadijmmaldiaoj niijqoophtm blmaoiihf anrgjnas  oioalkmdnamd iiandk kdadkff lkamddoiegma nnlw oskdo owkqiiuht meufk mcod difjqm fwmtuu kakdnwd lla kmdken asnq opokrik lkcjr owqdm mwopm icwmq ijrm kcmwi kmckej mcewj kcmwi lodq ldmlkmfn lkwkut vnuiw oc llkvmvrokmm cioc kqwoflma dj kdjfk wjqvniommfwoeeik",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/Sigiriya.jpeg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Select One Category",
                  style: TextStyle(
                      color: colors.mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) =>const NaturalWonders(),
                          )
                        );
                      },

                      child: const CategoryCard(
                        category: "Category",
                        bgColor: colors.mainColor,
                        width: 175,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {},

                      child: const CategoryCard(
                        category: "Category",
                        bgColor: colors.secondCategoryColor,
                        width: 175,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryCard(
                      category: "Category",
                      bgColor: colors.mainNightLifeColor,
                      width: 175,
                    ),
                    CategoryCard(
                      category: "Category",
                      bgColor: colors.thirdCategoryColor,
                      width: 175,
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                const CategoryCard(
                  category: "Book a Ride", 
                  bgColor: Colors.yellow, 
                  width:double.infinity 
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
