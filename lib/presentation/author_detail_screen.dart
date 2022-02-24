import 'package:flutter/material.dart';

class AuthorDetailScreen extends StatelessWidget {
  const AuthorDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const  Widget spacing =  SizedBox(
      height: 18,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Author Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.quotable.dev/profile/400/a-p-j-abdul-kalam.jpg"),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Name',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Text('Description',
                    style: Theme.of(context).textTheme.headline5),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
