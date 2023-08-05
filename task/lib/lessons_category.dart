// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:task/models/lesson.dart';

class LessonsCategory extends StatefulWidget {
  const LessonsCategory({Key? key}) : super(key: key);

  @override
  State<LessonsCategory> createState() => _LessonsCategoryState();
}

class _LessonsCategoryState extends State<LessonsCategory> {

  late Future<List<Lesson>> lessonData;


  @override
  void initState() {
    lessonData= getLessonInfo() ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          FutureBuilder<List<Lesson>>(
              future: lessonData,
              builder: (context,snapshot){
                return snapshot.hasData? Expanded(
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width,
                    height: 300,

                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context,index){
                          return LessonsItems(
                              title: snapshot.data![index].category,
                              description: snapshot.data![index].name,
                              duration: snapshot.data![index].duration.toString(),
                              imagePath: 'assets/images/young-woman-doing-natarajasana-exercise 1.jpg');




                        }),
                  ),
                ):const CircularProgressIndicator();

              }),

        ],
      ),
    );
  }
}

class LessonsItems extends StatelessWidget {
  const LessonsItems({
    Key? key, required this.title, required this.description, required this.duration, required this.imagePath,
  }) : super(key: key);

  final String title;
  final String description;
  final String duration;
  final String imagePath;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 20,bottom: 20),
        width: 250,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10
            )],
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 150,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all( 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(title,style: Theme.of(context).textTheme.bodyText2,),
                    Text(description,style: Theme.of(context).textTheme.bodyText1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$duration min',style: Theme.of(context).textTheme.headline2,
                        ),
                        const Icon(Icons.lock_outline,color: Color(0xFF6D747A),)

                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


