import 'package:flutter/cupertino.dart';

class SelectedData extends ChangeNotifier{

  bool _androidDevelopment = false;
  bool _politics = false;
  bool _hunting = false;
  bool _racing = false;
  bool _dancing = false;
  bool _origami = false;
  bool _singing = false;
  bool _cooking = false;
  bool _soccer = false;
  bool _modelling = false;
  bool _meditation = false;
  List<String> _hobbies = [];

  bool get androidDevelopment => _androidDevelopment;
  set androidDevelopment (bool androidDevelopment){
    _androidDevelopment = androidDevelopment;
    notifyListeners();
  }

  bool get politics => _politics;
  set politics (bool politics){
    _politics = politics;
    notifyListeners();
  }

  bool get hunting => _hunting;
  set hunting (bool hunting){
    _hunting = hunting;
    notifyListeners();
  }

  bool get racing => _racing;
  set racing (bool racing){
    _racing = racing;
    notifyListeners();
  }

  bool get dancing => _dancing;
  set dancing (bool dancing){
    _dancing = dancing;
    notifyListeners();
  }

  bool get origami => _origami;
  set origami (bool origami){
    _origami = origami;
    notifyListeners();
  }

  bool get singing => _singing;
  set singing (bool singing){
    _singing = singing;
    notifyListeners();
  }

  bool get cooking => _cooking;
  set cooking (bool cooking){
    _cooking = cooking;
    notifyListeners();
  }

  bool get soccer => _soccer;
  set soccer (bool soccer){
    _soccer = soccer;
    notifyListeners();
  }

  bool get modelling => _modelling;
  set modelling (bool modelling){
    _modelling = modelling;
    notifyListeners();
  }

  bool get meditation => _meditation;
  set meditation (bool meditation){
    _meditation = meditation;
    notifyListeners();
  }

  List get hobbies => _hobbies;
  set hobbies (List hobbies){
    _hobbies = hobbies;
    notifyListeners();
  }

}