import 'package:flutter/material.dart';
import 'package:sayi_tahmin_app/main.dart';

class SonucEkrani extends StatefulWidget {
  SonucEkrani({Key? key}) : super(key: key);

  @override
  _SonucEkraniState createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("resimler/mutlu_resim.png"),
            const Text(
              "Kazandınız",
              style: TextStyle(color: Colors.black54, fontSize: 36),
            ),
            
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("TEKRAR DENE"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    textStyle: const TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}