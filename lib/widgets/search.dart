import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
 import '../screens/search_screen.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/google-logo.png',
            height: size.height * 0.12,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width:size.width > 768? size.width*0.4 : size.width*0.9,
          child: TextFormField(
            onFieldSubmitted: (query){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchScreen(
                      searchQuery: query,
                      start: '0',
                ),
              ),
              );
            },
            decoration:  InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: searchBorder,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),

              prefixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.search ,color: searchBorder,),
              ),
              suffixIcon: IconButton(
                 padding: const EdgeInsets.all(8.0),
                icon: const Icon(Icons.mic , size: 28,),
                //icon: Image.asset('assets/images/mic_icon.png', height: 1 ,width: 1,color: searchBorder ,),
                onPressed: (){
                   //  HomeScreen();
                },
                // child: Image.asset('assets/images/mic_icon.png', height: 1 ,width: 1,),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
