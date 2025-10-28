// L2: Flutter Basic GUI
// lib/main.dart
//
// Created by Michael Qiu on 2025/10/28.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '视频下载器',
      theme: ThemeData(useMaterial3: true),
      home: VideoDownloaderPage(),
    );
  }
}

class VideoDownloaderPage extends StatefulWidget {
  @override
  _VideoDownloaderPageState createState() => _VideoDownloaderPageState();
}

class _VideoDownloaderPageState extends State<VideoDownloaderPage> {
  String _status = "请输入视频链接";
  final TextEditingController _urlController = TextEditingController();

  void _download() {
    String url = _urlController.text.trim();
    if (url.isEmpty) {
      setState(() => _status = "链接不能为空！");
      return;
    }
    setState(() => _status = "正在下载...");
    
    // 模拟异步下载，2秒
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) { // 防止页面销毁后 setState
        setState(() => _status = "下载完成！");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("视频下载器")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: "视频链接",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _download,
              child: Text("开始下载"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _status,
              style: TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}