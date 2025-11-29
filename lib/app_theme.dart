import 'package:flutter/material.dart';

// Định nghĩa các hằng số màu sắc và giao diện
class AppTheme {
  // Màu sắc chung
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color accentColor = Color(0xFF03DAC6);

  // Khai báo một Border Shape cố định (Đã sửa từ const thành final)adsadad hehe
  static final RoundedRectangleBorder _cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  );

  // Tách biệt định nghĩa CardTheme cho Light Mode
  // SỬA: Thay CardTheme bằng CardThemeData
  static final CardThemeData _lightCardTheme = CardThemeData( 
    color: Colors.white,
    elevation: 4,
    shape: _cardShape,
  );

  // Tách biệt định nghĩa CardTheme cho Dark Mode
  // SỬA: Thay CardTheme bằng CardThemeData
  static final CardThemeData _darkCardTheme = CardThemeData(
    color: const Color(0xFF1E1E1E),
    elevation: 8,
    shape: _cardShape,
  );

  // 1. LIGHT THEME (Giao diện Sáng)
  static final ThemeData lightTheme = ThemeData(
    // Thiết lập độ sáng chính
    brightness: Brightness.light,
    
    // Màu sắc được định nghĩa đầy đủ trong colorScheme
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
      background: Color(0xFFF5F5F5), // Nền sáng nhẹ
      surface: Colors.white,         // Bề mặt thẻ, dialog
    ),
    
    // Màu nền Scaffold (Nền màn hình)
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    
    // Theme cho AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    
    // Gán CardTheme đã được định nghĩa rõ ràng (SỬ DỤNG CardThemeData)
    cardTheme: _lightCardTheme,

    // Theme cho nút
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: accentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    
    // Theme cho Icon
    iconTheme: const IconThemeData(color: primaryColor),
  );

  // 2. DARK THEME (Giao diện Tối)
  static final ThemeData darkTheme = ThemeData(
    // Thiết lập độ sáng chính
    brightness: Brightness.dark,
    
    // Màu sắc được định nghĩa đầy đủ trong colorScheme
    colorScheme: const ColorScheme.dark(
      primary: accentColor,
      secondary: primaryColor,
      background: Color(0xFF121212), // Nền tối sâu
      surface: Color(0xFF1E1E1E),     // Bề mặt thẻ, dialog tối
    ),
    
    // Màu nền Scaffold (Nền màn hình)
    scaffoldBackgroundColor: const Color(0xFF121212),
    
    // Theme cho AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    
    // Gán CardTheme đã được định nghĩa rõ ràng (SỬ DỤNG CardThemeData)
    cardTheme: _darkCardTheme,
    
    // Theme cho nút
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, // Chữ đen trên nền sáng
        backgroundColor: accentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    
    // Theme cho Icon
    iconTheme: const IconThemeData(color: accentColor),
  );
}