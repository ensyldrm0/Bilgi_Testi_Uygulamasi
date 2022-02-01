import 'package:bilgi_testi/cons.dart';
import 'package:flutter/material.dart';
import 'TestVerileri.dart';

void main() {
  runApp(bilgiuyg());
}

class bilgiuyg extends StatefulWidget {
  const bilgiuyg({Key? key}) : super(key: key);

  @override
  State<bilgiuyg> createState() => _bilgiuygState();
}

class _bilgiuygState extends State<bilgiuyg> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: home());
  }
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<Widget> secimler = [];
  TestVerileri test_1 = TestVerileri();

  void butonFonksiyonu(bool deger) {
    if (test_1.bittiMi() == true) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('TEST BİTTİ'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Testi tamamladınız'),
                  Text('Lütfen başa dönmek için butona tıklayınız'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('DÖN'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      secimler = [];
      test_1.testiSifirla();
    } else {
      test_1.getSoruYaniti() == deger
          ? secimler.add(kdogru)
          : secimler.add(kyanlis);
      test_1.sayiArt();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://static.wixstatic.com/media/a27d24_f5a9cdfc806a41129c62ea15cba06e49~mv2.jpeg/v1/fill/w_1000,h_1000,al_c,q_90,usm_0.66_1.00_0.01/a27d24_f5a9cdfc806a41129c62ea15cba06e49~mv2.jpeg"),
                radius: 150,
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Center(
                    child: Text(
                      test_1.getSoruMetni(),
                      style: TextStyle(
                        fontSize: (30),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Wrap(
                  children: secimler,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                butonFonksiyonu(false);
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red.shade900,
                              padding: EdgeInsets.all(12),
                            ),
                            child: Icon(
                              Icons.thumb_down,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                butonFonksiyonu(true);
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green.shade900,
                              padding: EdgeInsets.all(12),
                            ),
                            child: Icon(
                              Icons.thumb_up,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
