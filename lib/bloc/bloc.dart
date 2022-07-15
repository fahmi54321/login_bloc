import 'dart:async';
import 'validators.dart';

class Bloc extends Object with Validators{

  final _email = StreamController<String>();
  final _password = StreamController<String>();

  // retrive data from stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  // ada data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose(){
    _email.close();
    _password.close();
  }
}


//todo contoh extended vs mixing
//     1. extend biasanya digunakan untuk base/ parent class, mixin untuk child
//        class
//     2. extend hanya bisa satu class, mixin bisa banyak class
//     3. mixin harus ada extend dalam pemakaiannya
void main() {
  final pria = PriaMuslim('fahmi', 23);

  print('nama : ${pria.nama}');

  // kewajiban
  pria.shalat();

  // sunnah
  pria.dhuha();

  // makhruh
  pria.perhiasan();
}

class PriaMuslim extends Kewajiban with Sunnah, Makhruh {
  PriaMuslim(this.nama, this.age);

  String nama;
  int age;
}

class Sunnah {
  void dhuha() {
    print('mengerjakan shalat dhuha');
  }
  void naikHaji() {
    print('naik haji bagi yang mampu');
  }
}

class Makhruh {
  void perhiasan() {
    print('memakai perhiasan bagi laki2');
  }
}

class Kewajiban {
  void shalat() {
    print('shalat 5 waktu sehari semalam');
  }
  void puasa() {
    print('puasa pada bulan ramadhan');
  }
}

