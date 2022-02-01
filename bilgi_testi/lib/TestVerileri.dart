import 'package:bilgi_testi/sorular.dart';
import 'package:bilgi_testi/cons.dart';

int _SoruIndex = 0;

class TestVerileri {
  List<Soru> _SoruBankasi = [
    Soru(
        soruMetni: "Titanic gelmiş geçmiş en büyük gemidir", soruYaniti: false),
    Soru(
        soruMetni: "Dünyadaki tavuk sayısı insan sayısından fazladır",
        soruYaniti: true),
    Soru(soruMetni: "Kelebeklerin ömrü bir gündür", soruYaniti: false),
    Soru(soruMetni: "Dünya düzdür", soruYaniti: false),
    Soru(
        soruMetni: "Kaju fıstığı aslında bir meyvenin sapıdır",
        soruYaniti: true),
    Soru(
        soruMetni: "Fatih Sultan Mehmet hiç patates yememiştir",
        soruYaniti: true),
    Soru(soruMetni: "Fransızlar 80 demek için, 4 - 20 der", soruYaniti: true),
  ];

  String getSoruMetni() {
    return _SoruBankasi[_SoruIndex].soruMetni!;
  }

  bool getSoruYaniti() {
    return _SoruBankasi[_SoruIndex].soruYaniti!;
  }

  void sayiArt() {
    if (_SoruIndex + 1 < _SoruBankasi.length) {
      _SoruIndex++;
    }
  }

  bool bittiMi() {
    if (_SoruIndex + 1 >= _SoruBankasi.length) {
      return true;
    } else {
      return false;
    }
  }

  void testiSifirla() {
    _SoruIndex = 0;
  }
}
