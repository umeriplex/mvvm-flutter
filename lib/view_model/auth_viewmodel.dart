import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_vidoe_one/modal/user_modal.dart';
import 'package:mvvm_vidoe_one/repo/auth_repo.dart';
import 'package:mvvm_vidoe_one/utils/routes/routes_name.dart';
import 'package:mvvm_vidoe_one/utils/utils/Utils.dart';
import 'package:mvvm_vidoe_one/view_model/user_viewmodel.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {

  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _sLoading = false;
  bool get sLoading => _sLoading;
  setSLoading(bool value) {
    _sLoading = value;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.login(data).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context , listen: false);
      userPreference.saveUser(UserModal(token: value['token'].toString()));
      Utils.flushErrorMsg('Log in Successfully : $value', context);
      Navigator.of(context).pushNamedAndRemoveUntil(RoutesName.home, (Route<dynamic> route) => false);
      if (kDebugMode) {print(value.toString());}
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushErrorMsg(error.toString(), context);
      if (kDebugMode) {print(error.toString());}
    });
  }

  Future<void> register(dynamic data, BuildContext context) async {
    setSLoading(true);
    _myRepo.register(data).then((value) {
      setSLoading(false);
      Utils.flushErrorMsg('Sign Up Successfully : $value', context);
      Navigator.of(context).pushNamedAndRemoveUntil(RoutesName.login, (Route<dynamic> route) => false);
      if (kDebugMode) {print(value.toString());}
    }).onError((error, stackTrace) {
      setSLoading(false);
      Utils.flushErrorMsg(error.toString(), context);
      if (kDebugMode) {print(error.toString());}
    });
  }
}
