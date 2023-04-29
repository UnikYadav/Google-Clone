import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_clone/colors.dart';

import '../../screens/search_screen.dart';

class SearchButton extends StatelessWidget {
    final String title;
  const SearchButton({Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = TextEditingController();
    return MaterialButton(
      elevation: 0,
      shape:  const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ) ,
      color: searchColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 25 , vertical: 18,
      ),

      onPressed: (){
        if(title == "Google Search"){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SearchScreen(
                searchQuery: query.text,
                start: '0',
              ),
            ),
          );
        }
        else{
          (){};
        }
      },
      child:Text(title) ,
    );
  }
}
