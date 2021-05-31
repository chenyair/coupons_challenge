import 'package:coupons_challenge/home_screen/widgets/discover_list.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollChanged);
    super.dispose();
  }

  void _scrollChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _TabView(),
            SizedBox(height: size.height * 0.05),
            Expanded(
              child: CustomScrollView(
                controller: _controller,
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: size.height * 0.325,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Opacity(
                            opacity: max(
                              0,
                              1 - _controller.offset / (size.height * 0.325),
                            ),
                            child: DiscoverList(
                              constraints: constraints,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: _MyCouponsDelegate(),
                    pinned: true,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          height: 100,
                          width: double.infinity,
                          color: index % 2 == 0 ? Colors.red : Colors.blue,
                        );
                      },
                      childCount: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.keyboard_arrow_left,
          color: Color(0xFFB9BCCB),
          size: 30,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            print('Search');
          },
          icon: Icon(
            Icons.search,
            size: 30,
            color: Color(0xFFB9BCCB),
          ),
        ),
        IconButton(
          onPressed: () {
            print('Menu');
          },
          icon: Icon(
            Icons.menu,
            size: 30,
            color: Color(0xFFB9BCCB),
          ),
        ),
      ],
    );
  }
}

class _MyCouponsDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'My Coupons',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _TabView extends StatelessWidget {
  const _TabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Loyalty Cards',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black12,
          ),
        ),
        Row(
          children: [
            Text(
              'Coupons',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE7BD6D),
              ),
              child: Center(
                child: Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
