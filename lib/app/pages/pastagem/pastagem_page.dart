import 'package:abc_monitor/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const kUrl = "https://atlasdaspastagens.ufg.br/map";

class PastagemPage extends StatefulWidget {
  const PastagemPage({super.key});

  @override
  State<PastagemPage> createState() => _PastagemPageState();
}

class _PastagemPageState extends State<PastagemPage> {
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(),
      )
      ..loadRequest(Uri.parse(kUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        title: const Text("Mapa"),
      ),
      bottomNavigationBar: const BottomBar(
        page: BottomBarPage.pastagem,
      ),
      body: SafeArea(child: WebViewWidget(controller: controller)),
    );
  }
}
