import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/pic9.png'),
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi maryam',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '3rd year ,class1',
                style: TextStyle(fontSize: 13),
              ),
            ],
          )),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('0'),
                      Text('Exams'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('4'),
                      Text('projects'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('80'),
                      Text('classes'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 150,
                    image: AssetImage('assets/images/pic1.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reserve your spot now ',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Don\'t miss the biggest tech ',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'event on campus ',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(child: girid()),
          ],
        ),
      ),
    );
  }
}

class girid extends StatefulWidget {
  const girid({super.key});

  @override
  State<girid> createState() => _giridState();
}

class _giridState extends State<girid> {
  List griddata = [
    'study scheduel',
    'exams',
    'timeline',
    'community',
    'acadimic results',
    'tuition free',
    'assignments'
  ];
  List gridphoto = [
    'assets/images/pic2.png',
    'assets/images/pic3.png',
    'assets/images/pic4.png',
    'assets/images/pic5.png',
    'assets/images/pic6.png',
    'assets/images/pic7.png',
    'assets/images/pic8.png',
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: griddata.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.5,
          crossAxisCount: 2,
          mainAxisSpacing: 25,
          crossAxisSpacing: 25),
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                gridphoto[index],
                width: 45,
                height: 45,
              ),
              Text(
                griddata[index],
              ),
            ],
          ),
        );
      },
    );
  }
}
