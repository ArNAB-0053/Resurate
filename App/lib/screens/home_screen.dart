import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resurate/Drawer/drawer.dart';
import 'package:resurate/constants.dart';
import '../models/jdModel.dart';
import '../models/jobs.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {



  late Future<JdModel> futureJdModel;

  @override
  void initState() {
    super.initState();
    futureJdModel = fetchJdModel();
  }

  Future<JdModel> fetchJdModel() async {
    final response = await http.get(Uri.parse('https://resurate.onrender.com/api/v1/job/all?id=Hello'));
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return JdModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load JdModel');
    }
  }




  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Job> _jobList
    = Job.joblist;
    //job category
    List<String> _jobTypes = [
      'Recommended',
      'Web Developer',
      'Android Developer',
      'React Developer'
    ];




    //toggle favourite button
    bool toggleIsFavourited(bool isFavourited){
      return !isFavourited;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        title: Text("Resurate", style: TextStyle(fontWeight: FontWeight.bold),),
      ),


      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: (Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0
                    ),
                    width: size.width * .9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search, color: Colors.black45.withOpacity(0.6),),
                        const Expanded(child: TextField(
                          showCursor: false,
                          decoration: InputDecoration(
                            hintText: "Search Job",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        )),

                        Icon(Icons.mic, color: Colors.black45.withOpacity(.6),),

                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),


                    ),)
                ],
              )),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50.0,
              width: size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _jobTypes.length,
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(
                          _jobTypes[index],
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: selectedIndex ==
                                  index ? FontWeight.bold : FontWeight.w300,
                              color: selectedIndex == index ? Constants.primaryColor :
                              Constants.blackColor
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),

            SizedBox(
              height: size.height * .3,
              child: ListView.builder(
                  itemCount: _jobList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      width:  200,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              height: 50,
                              width: 50,
                              child: IconButton(
                                onPressed: () {  },
                                icon: Icon(_jobList[index].isFavorated == true? Icons.favorite: Icons.favorite_border,),
                                color: Constants.primaryColor,
                                iconSize: 30,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),

                              ),
                            ),
                          ),
                          Positioned(
                            left: 50,
                            right: 50,
                            top: 50,
                            bottom: 50,
                            child: Image.asset(_jobList[index].imageURL),),
                          Positioned(
                              left: 20,
                              bottom: 15,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_jobList[index].category,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(_jobList[index].company,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                          ),

                          Positioned(
                              bottom: 15,
                              right: 20,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 2
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(r'₹' + _jobList[index].salary.toString(), style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 16
                                ),),
                              ))
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Constants.primaryColor.withOpacity(.8),
                          borderRadius: BorderRadius.circular(20)
                      ),
                    );
                  }
              ),
            ),

            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: Text('New Jobs', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 12
              ),
              height: size.height * .5,
              child: ListView.builder(
                  itemCount: _jobList.length,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 80.0,
                      padding: EdgeInsets.only(left: 10, top: 10),
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      width: size.width,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: Constants.primaryColor.withOpacity(0.8),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 0,
                                right: 0,
                                child: SizedBox(
                                  height: 80.0,
                                  child: Image.asset(_jobList[index].imageURL),
                                ),),
                              Positioned(
                                  bottom: 5,
                                  left: 80,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(_jobList[index].category),
                                      Text(_jobList[index].company, style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Constants.primaryColor
                                      ),)
                                    ],
                                  ))
                            ],
                          ),

                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(r'₹'+_jobList[index].salary, style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Constants.primaryColor
                            ),),
                          )

                        ],
                      ),

                    );
                  }),
            )

          ],

        ),
      ),
      drawer: const MyDrawer(),
    );

  }

}
