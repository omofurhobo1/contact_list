import 'package:contactlist/screens/contact_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 80,
          width: double.infinity,
          // color: const Color.fromARGB(220, 96, 215, 85),
          child: Padding(
            padding: EdgeInsets.only(right: 25, left: 25),
            child: TextField(
              decoration: InputDecoration(
                hintText: "search contacs ...",
                suffixIcon: Icon(Icons.search_rounded),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 80,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: ((context) => const ContactScreen())));
                  },
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                  leading: Image.asset("asset/images/add-user.png"),
                  title: const Text("Innocent"),
                  subtitle: const Text("+23480 640 695 92"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              }),
        )
      ],
    );
  }
}
