import 'package:api_calling/Pixabay/Provider/PixabayProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context)=> Pixabay(),
        },
      ),
    );
  }
}
