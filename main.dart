// import 'package:flutter/material.dart';
// import 'package:news_app/services/news_service.dart';
// import 'package:news_app/views/home_view.dart';
// import 'package:dio/dio.dart';

// void main() {
//   NewsService(dio: Dio()).getNews();
//   runApp(NewsApp());
// }

// class NewsApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeView(),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(Task());
}

class Task extends StatefulWidget {
  @override
  State<Task> createState() => _MyTask();
}

class _MyTask extends State<Task> {
  int ind = 0;
  final List<Widget> screens = [
    ContainerListView(),
    ContainerGridView(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Color(0xff957B60),
                selectedItemColor: Colors.white,
                currentIndex: ind,
                onTap: (index) {
                  setState(() {
                    ind = index;
                    print(index);
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'ListView',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.grid_view),
                    label: 'GridView',
                  ),
                ],
              ),
              body: screens.elementAt(ind),
            )));
  }
}

class ContainerGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff957B60),
          title: Center(
            child: Text(
              'GridView',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 20),
                itemCount: 16,
                itemBuilder: (context, index) {
                  return Stack(children: [
                    Container(
                      height: 150,
                      child: Image.asset(
                        'assets/food.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 15,
                      child: Text(
                        'Food',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]);
                }),
          ),
        ));
  }
}

class ContainerListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff957B60),
        title: Center(
          child: Text(
            'ListView',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
              itemCount: 16,
              itemBuilder: (context, index) {
                return Stack(children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 150,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/food.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 20,
                    child: Text(
                      'Food',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ]);
              }),
        ),
      ),
    );
  }
}
