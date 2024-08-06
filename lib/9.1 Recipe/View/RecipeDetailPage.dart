import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Modal/RecipeModal.dart';
import '../Provider/RecipeProvider.dart';
import 'RecipeHomePage.dart';

class RecipesDetailsPage extends StatelessWidget {
  const RecipesDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.4,
        centerTitle: true,
        title: Text('Details Screen'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.020,
          ),
          Expanded(
            child: FutureBuilder(
              future:
                  Provider.of<RecipeProvider>(context, listen: false).fromMap(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  RecipeModal? food = snapShot.data;
                  return Column(
                    children: [
                      Center(
                        child: Container(
                          height: height * 0.4,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  food!.recipes[selectedIndex].image,
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Text(
                                food!.recipes[selectedIndex].name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Text(
                                " Cuisine: ${food!.recipes[selectedIndex].cuisine}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      " Difficulty : ${food!.recipes[selectedIndex].difficulty}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "Time :  ${food!.recipes[selectedIndex].cookTimeMinutes} min",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      " Servings : ${food!.recipes[selectedIndex].servings}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "ReviewCount :  ${food!.recipes[selectedIndex].reviewCount}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: height * 0.050,
                                indent: 1,
                                endIndent: 2,
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Instructions",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: food.recipes[selectedIndex]
                                      .instructions.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: Text(
                                        'Step ${index + 1} - ${food.recipes[selectedIndex].instructions[index]}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Divider(
                                height: height * 0.050,
                                indent: 1,
                                endIndent: 2,
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Ingredients",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: food.recipes[selectedIndex]
                                      .ingredients.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        '${food.recipes[selectedIndex].ingredients[index]}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
