import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators{

  //todo 1
  // BehaviorSubject merupakan StreamController yang mengambil the latest item
  // yang sudah ditambahkan pada controller
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // retrive data from stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid => CombineLatestStream.combine2(email, password, (e, p) => true);

  // ada data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  //todo 2 (next login_page)
  void submit(){
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email is $validEmail');
    print('Password is $validPassword');

  }

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

