import 'package:flutter/material.dart';
import 'package:flutter_king_master/model/Drawer.dart';

class my_listView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<String> fruitname = ['Otp1', 'Otp2', 'Otp3', 'Otp4', 'Otp5'];

  static List url = [
    'photo/otp1.jpg',
    'photo/otp2.png',
    'photo/otp3.png',
    'photo/otp4.png',
    'photo/five.jpg',
  ];
  // yaha par conect kia image our text our next activity me b show ho raha he
  final List<FruitDataModel> Fruitdata = List.generate(
      fruitname.length,
      (index) => FruitDataModel('${fruitname[index]}', '${url[index]}',
          '${fruitname[index]} Description...'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer_item(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.sort,
              ),
            );
          },
        ),
        title: Text('Otp Ui Design'),
      ),
      body: ListView.builder(
        itemCount: Fruitdata.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(url[index]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, top: 8),
                          child: Text(fruitname[index]),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.28,
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FruitDetail(
                                          fruitDataModel: Fruitdata[index],
                                        )));
                              },
                              child: Text(
                                'Free',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0XffFFBD2E),
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
          );
          //   return Card(
          //     child: ListTile(
          //       title: Text(Fruitdata[index].name),
          //       leading: SizedBox(
          //         width: 250,
          //         height: 150,
          //         child: Image.network(Fruitdata[index].ImageUrl),
          //       ),
          //       onTap: () {
          //         Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => FruitDetail(
          //                   fruitDataModel: Fruitdata[index],
          //                 )));
          //       },
          //     ),
          //   );
        },
      ),
    );
  }
}

// another class
class FruitDataModel {
  final String name, ImageUrl, desc;
  FruitDataModel(this.name, this.ImageUrl, this.desc);
}

// another class
class FruitDetail extends StatelessWidget {
  final FruitDataModel fruitDataModel;
  const FruitDetail({Key? key, required this.fruitDataModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fruitDataModel.name),
      ),
      body: Column(
        children: [
          Image.network(fruitDataModel.ImageUrl),
          SizedBox(
            height: 10,
          ),
          Text(
            fruitDataModel.desc,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
