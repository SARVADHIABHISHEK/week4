import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UrlLaunch extends StatefulWidget {
  const UrlLaunch({Key? key}) : super(key: key);

  @override
  State<UrlLaunch> createState() => _UrlLaunchState();
}

class _UrlLaunchState extends State<UrlLaunch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 70,
              child: ListTile(
                title: IconButton(
                    color: Colors.white,
                    onPressed: () async {
                      if(!await launchUrl(Uri.parse('https://wa.me/+917600175674'),))throw 'could not find no';
                    },
                    icon: const Icon(FontAwesomeIcons.whatsapp)),
              ),
            ),
            Container(
              width: 70,
              child: ListTile(
                title: IconButton(
                    color: Colors.white,
                    onPressed: () async {
                       {
                         if(!await(launchUrl(Uri.parse('tel:+917600175674'))));
                       }
                    },
                    icon: const Icon(FontAwesomeIcons.phone)),
              ),
            ),
            Container(
              width: 70,
              child: ListTile(
                title: IconButton(
                    color: Colors.white,
                    onPressed: () async {
                      if(!await launchUrl(Uri.parse('https://www.linkedin.com')));
                    },
                    icon: const Icon(FontAwesomeIcons.linkedinIn)),
              ),
            ),
            Container(
              width: 70,
              child: ListTile(
                title: IconButton(
                    color: Colors.white,
                    onPressed: () async {
                      if(!await launchUrl(Uri.parse("mailto:patelabhishek102001@gmail.com")));
                    },
                    icon: const Icon(FontAwesomeIcons.inbox)),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
