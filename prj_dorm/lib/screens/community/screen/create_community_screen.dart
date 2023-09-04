import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateCommunityScreen extends ConsumerStatefulWidget {
  const CreateCommunityScreen({super.key});

  @override
  ConsumerState<CreateCommunityScreen> createState() =>
      _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends ConsumerState<CreateCommunityScreen> {
  final communityNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    communityNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hello world'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('hi'),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: communityNameController,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('create'))
          ],
        ),
      ),
    );
  }
}
