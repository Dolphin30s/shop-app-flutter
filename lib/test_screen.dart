import 'package:flutter/material.dart';
import 'package:open_cart/providers/_mixins.dart';
import 'package:open_cart/providers/base_provider.dart';
import 'package:provider/provider.dart';
import 'package:open_cart/utils/extensions.dart';

class TestScreen extends StatelessWidget {
  static const String route = "/test_screen";

  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<_ThisProvider>(
            create: (context) => _ThisProvider(),
          ),
        ],
        builder: (context, _) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => _onFabTap(context),
            ),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text(
                    " Test Screren",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ).withProviderProgress<_ThisProvider>(),
            ),
          );
        });
  }

  void _onFabTap(BuildContext context) {
    final provider = context.read<_ThisProvider>();

    provider.isLoading = !provider.isLoading;
  }
}

class _ThisProvider extends BaseProvider with MixinProgressProvider {}
