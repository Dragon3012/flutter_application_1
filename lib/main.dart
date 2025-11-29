import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_theme.dart'; 
import 'home_screen.dart';
import 'theme_provider.dart';

// ĐÃ SỬA: Biến main thành hàm async và chờ load theme
void main() async {
  // Đảm bảo Flutter binding đã được khởi tạo trước khi gọi SharedPreferences
  WidgetsFlutterBinding.ensureInitialized();
  
  // BƯỚC QUAN TRỌNG: Chờ load trạng thái theme ban đầu từ SharedPreferences
  bool initialThemeIsDark = await ThemeProvider.loadInitialTheme();

  // Chạy ứng dụng, bọc với ChangeNotifierProvider
  runApp(
    // Sử dụng ChangeNotifierProvider để cung cấp ThemeProvider cho toàn bộ cây Widget
    ChangeNotifierProvider(
      // Khởi tạo Provider với trạng thái đã được tải
      create: (context) => ThemeProvider(initialThemeIsDark), 
      child: const ThemeApp(),
    ),
  );
}

class ThemeApp extends StatelessWidget {
  const ThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Lắng nghe ThemeProvider để lấy ThemeData hiện tại
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Theme Switching Flutter App',
      debugShowCheckedModeBanner: false,

      // Cung cấp cả Light và Dark Theme cho ứng dụng
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      
      // Sử dụng themeMode để kiểm soát theme đang được áp dụng
      themeMode: themeProvider.themeMode,
      
      home: const HomeScreen(),
    );
  }
}