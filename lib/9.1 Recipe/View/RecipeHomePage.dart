import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Modal/RecipeModal.dart';
import '../Provider/RecipeProvider.dart';

class RecipeHomePage extends StatelessWidget {
  const RecipeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    RecipeProvider recipeProviderFalse =
        Provider.of<RecipeProvider>(context, listen: false);
    RecipeProvider recipeProviderTrue =
        Provider.of<RecipeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0.5,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Recipes',
          ),
          leading: const Icon(
            Icons.menu,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    image: const DecorationImage(
                      image: AssetImage('assets/Images/Daal.jpeg'),
                      fit: BoxFit.cover,

                    ),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 3),
                          // spreadRadius: 1,
                          blurRadius: 2)
                    ]),
              ),
            ),
            const SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Recipes',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                  )
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: Provider.of<RecipeProvider>(context, listen: false)
                    .fromMap(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    RecipeModal? re = snapShot.data;
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: re!.recipes.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                selectedIndex = index;
                                Navigator.of(context).pushNamed('/detail');
                              },
                              child: buildRow(re, index));
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRow(RecipeModal re, int index) {
    return Row(
      children: [
        Container(
          height: 150,
          width: 150,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(re.recipes[index].image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  re.recipes[index].name,
                  style: const TextStyle(

                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Difficulty: ${re.recipes[index].difficulty}',
                ),
                const SizedBox(height: 5),
                Text(
                  'Cuisine: ${re.recipes[index].cuisine}',
                ),
                const SizedBox(height: 5),
                Text(
                  'Servings: ${re.recipes[index].servings}',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

int selectedIndex = 0;
