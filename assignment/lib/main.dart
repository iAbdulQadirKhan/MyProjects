import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Assignment',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Contacts', style: TextStyle(color: Colors.black))),
        actions: [
          IconButton(
              icon: Icon(Icons.menu), color: Colors.grey, onPressed: () {})
        ],
        leading: IconButton(
            icon: Icon(Icons.search), color: Colors.grey, onPressed: () {}),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ONLINE',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                        Text('+ADD FRIENDS',
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold))
                      ]),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 70,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                onlineCircleAvatar('images/img1.jpg'),
                                onlineCircleAvatar('images/img2.jpg'),
                                onlineCircleAvatar('images/img3.jpg'),
                                onlineCircleAvatar('images/img4.jpg'),
                                onlineCircleAvatar('images/img5.png'),
                                onlineCircleAvatar('images/img6.jpg'),
                                onlineCircleAvatar('images/img7.png'),
                                onlineCircleAvatar('images/img8.png'),
                                onlineCircleAvatar('images/img9.png'),
                              ]))),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 3, 10),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'images/img9.png',
                              )),
                          SizedBox(width: 12),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 11),
                                Text('Khristina Shtromberger',
                                    style: nameTextStyle()),
                                Text(' Typing...',
                                    style: TextStyle(color: Colors.blue))
                              ]),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 15),
                              Text('15:43'),
                              CircleAvatar(
                                backgroundColor: Colors.orange,
                                radius: 10,
                                child: Text('3',
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  chatTile('images/img8.png', 'Marta Niko', 'What to do?',
                      '12:07', true, '1'),
                  chatTile('images/img7.png', 'Julia Schetko',
                      'What\'s New? How are you?', '00:16', false),
                  chatTile('images/img6.jpg', 'Sandra Sokolovskaya',
                      'See you tomorrow', '1 day ago', false),
                  chatTile('images/img5.png', 'Alex Neta', 'Karma has no menu?',
                      '1 day ago', true, '3'),
                  chatTile('images/img4.jpg', 'Nize Emirshah',
                      'Hi! When we go to ...', '2 days ago', false),
                  chatTile('images/img3.jpg', 'Anita', 'Where are you?',
                      '2 days ago', true, '2'),
                  chatTile('images/img2.jpg', 'Ms. Kapoor', 'Hello.',
                      '3 days ago', false),
                  chatTile('images/img1.jpg', 'Arica', 'Hi! How are you...',
                      '3 days ago', true, '5')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle nameTextStyle() {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
}

Padding chatTile(String img, String name, String msg, String time, bool newMsg,
    [var msgCount = '0']) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 10, 3, 10),
    child: Container(
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          CircleAvatar(radius: 30, backgroundImage: AssetImage(img)),
          SizedBox(width: 12),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 11),
                Text(name, style: nameTextStyle()),
                Visibility(
                    visible: newMsg,
                    child: Text(msg,
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Visibility(
                    visible: !newMsg,
                    child: Text(msg, style: TextStyle(color: Colors.grey[500])))
              ]),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 15),
              Text(time),
              Visibility(
                  visible: newMsg,
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: 10,
                    child:
                        Text(msgCount, style: TextStyle(color: Colors.white)),
                  )),
              Visibility(
                  visible: !newMsg,
                  child: Text('✓✓', style: TextStyle(color: Colors.grey)))
            ],
          )
        ],
      ),
    ),
  );
}

CircleAvatar onlineCircleAvatar(String img) {
  return CircleAvatar(
      radius: 40,
      backgroundImage: AssetImage(
        img,
      ));
}
