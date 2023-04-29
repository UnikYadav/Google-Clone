import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../color_pr.dart';

class SearchResultComponents extends StatefulWidget {
  final String link;
  final String text;
  final String linkToGo;
  final String desc;
  const SearchResultComponents({Key? key, required this.link, required this.text, required this.linkToGo, required this.desc}) : super(key: key);

  @override
  State<SearchResultComponents> createState() => _SearchResultComponentsState();
}

class _SearchResultComponentsState extends State<SearchResultComponents> {
  bool _showUnderline = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.link,),
         Padding(
          padding:const EdgeInsets.only(bottom: 8,),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async{
              if(await canLaunchUrlString(widget.linkToGo)){
                await launchUrlString(widget.linkToGo);
              }
            },
            onHover: (hovering){
              setState(() {
                _showUnderline = hovering;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.link,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF202124,),
                  ),
                ),
                Text(
                  widget.text,
                  style:  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: blueColor,
                    decoration: _showUnderline ? TextDecoration.underline : TextDecoration.none,
                  ),
                ),
              ],
            ),
        ),
        ),
        Text(widget.desc ,style: const TextStyle(fontSize: 14 , color: primaryColor ,), ),
        const SizedBox(height : 10,),
      ],
    );
  }
}
