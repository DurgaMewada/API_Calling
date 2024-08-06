import 'package:api_calling/9.1%20Recipe/Provider/RecipeProvider.dart';
import 'package:api_calling/9.1%20Recipe/View/RecipeDetailPage.dart';
import 'package:api_calling/Pixabay/Provider/PixabayProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '9.1 Recipe/View/RecipeHomePage.dart';
import 'Pixabay/View/HomeScreen.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> PixabayProvider(),),
        ChangeNotifierProvider(create: (context)=>RecipeProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context)=> RecipeHomePage(),
          '/detail': (context)=> RecipesDetailsPage(),
        },
      ),
    );
  }
}
