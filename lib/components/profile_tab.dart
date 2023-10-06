import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.directions_car),
            ),
            Tab(
              icon: Icon(Icons.directions_transit),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController, // 초기화해준다.
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 한줄당 몇개씩
                ),
                itemCount: 50, // 아이템 갯수
                itemBuilder: (context, index) =>
                    Image.network("https://picsum.photos/id/${index}/200/200"),
              ),
              Container(color: Colors.green),
            ],
          ),
        )
      ],
    );
  }

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
}
