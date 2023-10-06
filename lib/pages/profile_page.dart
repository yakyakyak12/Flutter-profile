import 'package:flutter/material.dart';
import 'package:profile_app/components/profile_buttons.dart';
import 'package:profile_app/components/profile_count_info.dart';
import 'package:profile_app/components/profile_drawer.dart';

import '../components/profile_header.dart';
import '../components/profile_tab.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ProfileDrawer(),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverList(
                // 스크롤이 없는 경우
                delegate: SliverChildListDelegate([
              ProfileHeader(),
              ProfileCountInfo(),
              ProfileButtons(),
            ]))
          ];
        },
        body: Expanded(child: ProfileTab()), // 스크롤이 있는 경우
      ),
    );
  }
}
