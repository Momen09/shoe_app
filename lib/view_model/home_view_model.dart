import 'package:flutter/cupertino.dart';
import 'package:shoe_app/consts/enums.dart';
import '../consts/list.dart';

class HomeViewModel extends ChangeNotifier {
  final ViewState _viewState = ViewState.loading;

  ViewState get viewState => _viewState;

  late String _selectedBrand;
  late bool selectedFavorite = false;
  List<Map<String, dynamic>> _currentBrandDetails = [];

  List<Map<String, dynamic>> get currentBrandDetails => _currentBrandDetails;

  String get selectedBrand => _selectedBrand;

  Future<void> updateBrandDetails() async {
    if (_selectedBrand == 'All shoes') {
      _currentBrandDetails = [
        ...Lists().AdidasDetails,
        ...Lists().PumaDetails,
        ...Lists().NikeDetails,

      ];
    }
    if (_selectedBrand == 'NIKE') {
      _currentBrandDetails = Lists().NikeDetails;
    }
    if (_selectedBrand == 'ADIDAS') {
      _currentBrandDetails = Lists().AdidasDetails;
    }
    if (selectedBrand == 'PUMA') {
      _currentBrandDetails = Lists().PumaDetails;
    }
    notifyListeners();
  }

  set currentBrandDetails(List<Map<String, dynamic>> value) {
    _currentBrandDetails = value;
    notifyListeners();
  }

  set selectedBrand(String value) {
    _selectedBrand = value;
    notifyListeners();
  }
}
