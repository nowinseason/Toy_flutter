import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:prj_dorm/models/community_model.dart";
import "package:prj_dorm/screens/community/controller/community_controller.dart";
import "package:prj_dorm/util/error_text.dart";
import "package:prj_dorm/util/loader.dart";
import "package:routemaster/routemaster.dart";

class CommunityListDrawer extends ConsumerWidget {
  const CommunityListDrawer({super.key});

  void navigateToCreateCommunity(BuildContext context) {
    Routemaster.of(context).push('/create-community');
  }

  void navigateToCommunity(BuildContext context, Community community) {
    Routemaster.of(context).push('/communities/${community.name}');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(''),
              leading: Icon(Icons.add),
              onTap: () => navigateToCreateCommunity(context),
            ),
            ref.watch(userCommunitiesProvider).when(
                data: (communities) => Expanded(
                      child: ListView.builder(
                        itemCount: communities.length,
                        itemBuilder: (BuildContext context, int index) {
                          final community = communities[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Color.fromRGBO(12, 20, 31, 0),
                            ),
                            title: Text('${community.name}'),
                            onTap: () {
                              navigateToCommunity(context, community);
                            },
                          );
                        },
                      ),
                    ),
                error: (error, stackTrace) => ErrorText(
                      error: error.toString(),
                    ),
                loading: () => const Loader())
          ],
        ),
      ),
    );
  }
}
