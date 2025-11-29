import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lắng nghe trạng thái theme
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    // Lấy màu sắc từ Theme hiện tại để đảm bảo giao diện thích ứng
    final Color cardColor = Theme.of(context).cardTheme.color!;
    final Color textColor = Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black87;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ứng Dụng Chuyển Đổi Theme'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Thiết kế Card kiểu Portfolio/Profile
              Card(
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.person_pin,
                        size: 80,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Nguyễn Văn A',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Lập Trình Viên Flutter & Thiết Kế UI/UX',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.7)),
                      ),
                      const SizedBox(height: 24),
                      
                      // Khu vực Switch Theme
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface, // Màu nền cho khu vực switch
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              themeProvider.isDark ? Icons.brightness_3 : Icons.wb_sunny,
                              color: themeProvider.isDark ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 10),
                            // ĐÃ SỬA: Bọc Text widget trong Expanded để ngăn tràn
                            Expanded( 
                              child: Text(
                                themeProvider.isDark ? 'Giao Diện Tối (Dark Mode)' : 'Giao Diện Sáng (Light Mode)',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
                                overflow: TextOverflow.ellipsis, // Tùy chọn: Thêm dấu ... nếu văn bản quá dài
                              ),
                            ),
                            const Spacer(),
                            Switch(
                              value: themeProvider.isDark,
                              onChanged: (value) {
                                // Gọi phương thức toggleTheme của Provider để chuyển đổi và lưu theme
                                themeProvider.toggleTheme(value);
                              },
                              activeColor: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              
              // Nút minh họa
              ElevatedButton(
                onPressed: () {
                  // Hiển thị một SnackBar để minh họa
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Theme hiện tại đã được lưu trữ!'),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                  );
                },
                child: const Text('Lưu & Áp Dụng'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}