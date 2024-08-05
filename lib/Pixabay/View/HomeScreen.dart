
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Modal/PixabayModal.dart';
import '../Provider/PixabayProvider.dart';

class Pixabay extends StatelessWidget {
  const Pixabay({super.key});

  @override
  Widget build(BuildContext context) {
    PixabayProvider pixabayProviderFalse = Provider.of<PixabayProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const Icon(
            Icons.menu_outlined,
            color: Colors.green,
            size: 25,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.4,
          title: const Text('Pixabay',style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                cursorColor: Colors.green,
                onSubmitted: (value) {
                  pixabayProviderFalse.getImages(value);
                },
                controller: txtSearch,
                decoration: InputDecoration(
                  label: const Text('Search Images',style: TextStyle(
                      color: Colors.grey
                  ),),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 25,
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: Provider.of<PixabayProvider>(context, listen: false)
                    .fromMap(Provider.of<PixabayProvider>(context, listen: true).searchImg),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    PixaBayModal? image = snapShot.data;
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        physics: const BouncingScrollPhysics(),
                        itemCount: image!.hits.length,
                        itemBuilder: (context, index) {
                          int likes = image.hits[index].likes;
                          bool isLiked = false;
                          return Container(
                            height: 200,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(image.hits[index].largeImageURL),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
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
}

TextEditingController txtSearch = TextEditingController();
