import 'package:flutter/material.dart';

class FormFieldController<T> {
  /// FormFieldController sınıfı, form bileşenlerinin değerlerini yönetmek için kullanılır.
  /// `T` türünde bir değer alır, bu tür genellikle `List<String>` gibi olabilir.

  T? _value;
  ValueChanged<T?>? _onChanged;

  // Constructor: Başlangıç değeri (_value) ve değişiklik dinleyicisi (_onChanged) alabilir.
  FormFieldController([this._value, this._onChanged]);

  // Değerin getter metodu.
  T? get value => _value;

  // Değerin setter metodu. Değer her değiştirildiğinde, onChanged fonksiyonu çağrılır.
  set value(T? newValue) {
    if (_value != newValue) {
      _value = newValue;
      // Eğer bir değişiklik dinleyici varsa, yeni değeri gönderir.
      if (_onChanged != null) {
        _onChanged!(newValue);
      }
    }
  }

  // Değişiklik dinleyicisini ayarlamak için bir yöntem.
  void setOnChanged(ValueChanged<T?> onChanged) {
    _onChanged = onChanged;
  }

  // Değerin sıfırlanması (varsayılan değere döndürülmesi).
  void reset([T? defaultValue]) {
    _value = defaultValue;
    if (_onChanged != null) {
      _onChanged!(_value);
    }
  }

  // Form alanının geçerli olup olmadığını kontrol etmek için kullanılabilecek bir metot (opsiyonel).
  bool validate(Function(T?)? validator) {
    if (validator != null) {
      return validator(_value) == null;
    }
    return true;
  }
}
