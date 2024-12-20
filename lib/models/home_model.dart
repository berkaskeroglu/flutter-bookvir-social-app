import 'package:bookvir/controller/form_field_controller.dart';
import 'package:flutter/material.dart';

class HomePageModel extends ChangeNotifier {
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  FormFieldValidator<String>? textControllerValidator;

  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) => choiceChipsValueController?.value =
      val != null ? [val] : []; // bunlar dreamee'den alıntıdır.

  HomePageModel() {
    // Validator fonksiyonu başlatılıyor
    textControllerValidator = (value) {
      if (value == null || value.isEmpty) {
        return 'This field cannot be empty';
      }
      return null;
    };
  }

  List<String> homeTagChipsValue = [];

  String? get homeTagChipsValueFirst =>
      homeTagChipsValue.isNotEmpty ? homeTagChipsValue.first : null;

  set homeTagChipsValueFirst(String? val) {
    if (val != null) {
      homeTagChipsValue = [val];
    } else {
      homeTagChipsValue = [];
    }
    notifyListeners();
  }

  // Initialization
  void initState() {
    textFieldFocusNode = FocusNode();
    textController = TextEditingController();
  }

  // Dispose
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
    super.dispose();
  }
}
