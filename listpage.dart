import 'package:flutter/material.dart';
import 'beasiswa.dart';
import 'detailpage.dart';
import 'loginpage.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List beasiswa;

  @override
  void initState() {
    beasiswa = getBeasiswa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Beasiswa beasiswa) =>
        ListTile(
          contentPadding: EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 10.0),
              leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.black26)
                  )
              ),
              child: new Image(
                image: new AssetImage(beasiswa.logo),
                height: 50.0,
                width: 50.0,
              )
              ),
              title: Text(
                beasiswa.title,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),

              subtitle: Row(
                children: <Widget>[
                  Text("Beasiswa Tahun 2019",
                      style: TextStyle(color: Colors.black38))
                ],
              ),
              
              trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black38,
                  size: 30.0
              ),
              
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DetailPage(beasiswa: beasiswa)));
              },
        );

    Card makeCard(Beasiswa beasiswa) =>
        Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(254, 254, 254, .9)),
            child: makeListTile(beasiswa),
          ),
        );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: beasiswa.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(beasiswa[index]);
        },
      ),
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(254, 254, 254, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    final barBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(254, 254, 254, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.black38),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.question_answer, color: Colors.black38),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LoginPage()
                ));
              },
            ),
            IconButton(
              icon: Icon(Icons.reorder, color: Colors.black38),
              onPressed: () {},
            )
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 254, 254, 1.0),
      appBar: topAppBar,
      bottomNavigationBar: barBottom,
      body: makeBody,
    );
  }
}

List getBeasiswa() {
  return [
    Beasiswa(
        title: "Politeknik Elektronika Negeri Surabaya",
        content: "Beasiswa Tahun 2019 Tanpa Ribet, Ambil yuk secepatnya ! Gratis lho.",
        requirement: "1. WNI\n2. Sehat Jasmani Rohani\n3. Usia 17 Tahun\n4. Aktif berorganisasi",
        image: "assets/images/pens.jpg",
        logo: "assets/images/pens.png"
    ),
    Beasiswa(
        title: "UWIKA Scholarship",
        content: "Beasiswa Tahun 2019 Tanpa Ribet, Ambil yuk secepatnya ! Gratis lho.",
        requirement: "1. WNI\n2. Sehat Jasmani Rohani\n3. Usia 17 Tahun\n4. Aktif berorganisasi",
        image: "assets/images/uwika.jpg",
        logo: "assets/images/uwika.png"
    ),
    Beasiswa(
        title: "Beasiswa PPA",
        content: "Beasiswa Tahun 2019 Tanpa Ribet, Ambil yuk secepatnya ! Gratis lho.",
        requirement: "1. WNI\n2. Sehat Jasmani Rohani\n3. Usia 17 Tahun\n4. Aktif berorganisasi",
        image: "assets/images/ppa.jpg",
        logo: "assets/images/ppa.png"
    ),
    Beasiswa(
        title: "JawaPos Exellence",
        content: "Beasiswa Tahun 2019 Tanpa Ribet, Ambil yuk secepatnya ! Gratis lho.",
        requirement: "1. WNI\n2. Sehat Jasmani Rohani\n3. Usia 17 Tahun\n4. Aktif berorganisasi",
        image: "assets/images/jawapos.jpg",
        logo: "assets/images/jawapos.png"
    )
  ];
}


