import 'package:flutter/material.dart';

import '../models/category.dart';
import '../providers/api_connector.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiConnector.getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ClipRRect(
            child: Container(
              height: 20,
              width: 20,
            ),
          );
        }
        if (snapshot.error != null) return Text('Error');
        List<Category> categories = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                'Popular Categories',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) {
                  final category = categories[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          backgroundImage: NetworkImage(
                            category.thumb,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          category.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
