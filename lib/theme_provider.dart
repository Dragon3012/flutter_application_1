import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Key dùng để lưu trữ theme trong SharedPreferences
const String THEME_KEY = "isDarkTheme";

class ThemeProvider with ChangeNotifier {
  // Mặc định là theme sáng
  bool _isDark;
  
  // Getter công khai
  bool get isDark => _isDark;
  
  // Getter cho ThemeMode hiện tại để sử dụng trong MaterialApp
  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  // Constructor mới: nhận giá trị đã tải từ bên ngoài
  ThemeProvider(this._isDark);

  // Phương thức tĩnh để TẢI theme từ SharedPreferences TRƯỚC khi khởi tạo Provider
  static Future<bool> loadInitialTheme() async {
    final prefs = await SharedPreferences.getInstance();
    // Lấy giá trị đã lưu, nếu không có thì mặc định là false (Light Mode)
    return prefs.getBool(THEME_KEY) ?? false;
  }

  // Phương thức chuyển đổi theme
  void toggleTheme(bool isOn) {
    _isDark = isOn;
    _saveTheme(_isDark); // Lưu lựa chọn mới
    notifyListeners(); // Thông báo cho widget biết để cập nhật giao diện
  }

  // Phương thức lưu theme vào SharedPreferences
  void _saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(THEME_KEY, isDark);
  }
}