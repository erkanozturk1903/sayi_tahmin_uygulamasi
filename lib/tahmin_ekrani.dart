import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_app/sonuc_ekrani.dart';

class TahminEkrani extends StatefulWidget {
  TahminEkrani({Key? key}) : super(key: key);

  @override
  _TahminEkraniState createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tfTahmin = TextEditingController();
  int rasgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rasgeleSayi =
        Random().nextInt(101); // 0 ile 100 arasında rasgele sayı üretir.
    print("Rasgele Sayı : $rasgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tahmin Ekrani"),
      ),
      body: Center(
        child: Column(
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Kalan Hak: $kalanHak ",
              style: const TextStyle(color: Colors.pink, fontSize: 30),
            ),
            Text(
              "Yardım :$yonlendirme",
              style: const TextStyle(color: Colors.black54, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {


                  setState(() {
                    kalanHak = kalanHak - 1;
                  });

                  int tahmin = int.parse(tfTahmin.text);

                  if (tahmin == rasgeleSayi) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SonucEkrani(),
                      ),
                    );
                    return;
                  }

                  if(tahmin > rasgeleSayi) {
                    setState(() {
                      yonlendirme = "Tahmini Azalt";
                    });
                  }

                  if(tahmin < rasgeleSayi) {
                    setState(() {
                      yonlendirme = "Tahmini Arttır";
                    });
                  }
                  if(kalanHak ==0 ) {
                   Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SonucEkrani(),
                      
                      ),
                      
                    );
                    return;
                  }
                 

                  
                },
                child: const Text("TAHMİN ET"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                    textStyle: const TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
