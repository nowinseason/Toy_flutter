import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:prj_dorm/screens/community/controller/community_controller.dart";
import "package:prj_dorm/util/error_text.dart";
import "package:prj_dorm/util/loader.dart";

class CommunityScreen extends ConsumerWidget {
  final String name;
  const CommunityScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //print(ref.read(getCommunityByNameProvider(name)));
    return Scaffold(
      body: ref.watch(getCommunityByNameProvider(name)).when(
            data: (community) => NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 50,
                    floating: true,
                    snap: true,
                    flexibleSpace: Stack(
                      children: [
                        Positioned.fill(
                            child: Image.network(
                          community.banner,
                          fit: BoxFit.cover,
                        ))
                      ],
                    ),
                  )
                ];
              },
              body: const Text('name'),
            ),
            error: (error, StackTrace) => ErrorText(error: error.toString()),
            loading: () => const Loader(),
          ),
    );
  }
}
