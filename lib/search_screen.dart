import 'package:flutter/material.dart';
import 'package:google_clone/color_pr.dart';
import 'package:google_clone/services/api_services.dart';

import '../widgets/search_footer.dart';
import '../widgets/search_header.dart';
import '../widgets/search_result_components.dart';
import '../widgets/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({Key? key, required this.searchQuery, required this.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchHeader(),
               Padding(
                padding: EdgeInsets.only(left: size.width > 768 ? 150.0 :10.0),
                child: const SingleChildScrollView(scrollDirection:Axis.horizontal ,child: SearchTabs() ,),
              ),
              const Divider(
                height: 0,
                thickness: 0.3,
              ),
              FutureBuilder(
                future: ApiService().fetchData(
                  queryTerm: searchQuery,
                  start: start,
                ),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding:  EdgeInsets.only(
                                left:size.width>768? 150 : 10,
                                top: 12,
                              ),
                              child: Text(
                                'About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)',
                                style: const TextStyle(
                                    fontSize: 15, color: Color(0xFF70757a)),
                              ),
                            ),
                            ListView.builder(
                              itemCount: snapshot.data?['items'].length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(
                                        left: size.width > 768 ? 150.0 :10.0,
                                        top: 10,
                                      ),
                                      child: SearchResultComponents(
                                        link: snapshot.data?['items'][index]
                                            ['formattedUrl'],
                                        text: snapshot.data?['items'][index]['title'],
                                        linkToGo: snapshot.data?['items'][index]['link'],
                                        desc: snapshot.data?['items'][index]['snippet'],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        if (start != "0") {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => SearchScreen(
                                                  searchQuery: searchQuery,
                                                  start: (int.parse(start) - 10).toString()),
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text(
                                        '< Prev',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: blueColor,
                                        ),
                                      )),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => SearchScreen(
                                                searchQuery: searchQuery,
                                                start: (int.parse(start) - 10).toString()),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Next >',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: blueColor,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(width: 30,),
                            const SearchFooter(),
                          ],
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
