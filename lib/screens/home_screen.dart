import 'package:demo1/components/video_category.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final orientation = media.orientation;
    final size = media.size;

    // ✅ Detect tablet or large screen
    bool isTablet = size.width > 900;

    // ✅ Layout rules:
    // Phones → 2 cols portrait, 1 row landscape
    // Tablets → 4 cols always
    int crossAxisCount;
    int totalRows;
    if (isTablet) {
      crossAxisCount = 4;
      totalRows = 2;
    } else if (orientation == Orientation.portrait) {
      crossAxisCount = 2;
      totalRows = 2;
    } else {
      crossAxisCount = 4;
      totalRows = 1; // ✅ 1 row in mobile landscape
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double availableHeight = constraints.maxHeight - 20;
            double itemHeight =
                (availableHeight - (totalRows - 1) * 10) / totalRows;
            double itemWidth = constraints.maxWidth / crossAxisCount;

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: itemWidth / itemHeight,
                children: [
                  _scaledCard(
                    _buildCategoryCard(
                      color: Colors.red,
                      icon: Icons.live_tv,
                      title: "LiveTV",
                      count: 1234,
                    ),
                  ),
                  _scaledCard(
                    _buildCategoryCard(
                      color: Colors.green,
                      icon: Icons.movie,
                      title: "Movies",
                      count: 1234,
                    ),
                  ),
                  _scaledCard(
                    _buildCategoryCard(
                      color: Colors.blue,
                      icon: Icons.tv,
                      title: "Series",
                      count: 1234,
                    ),
                  ),
                  _scaledCard(_buildMenuCard()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ✅ Wraps each card in a FittedBox to scale contents safely
  Widget _scaledCard(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: SizedBox(
          width: 200,
          height: 200,
          child: child,
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required Color color,
    required IconData icon,
    required String title,
    required int count,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black, width: 2.0),
      ),
      child: VideoCategoryCard(
        icon: icon,
        categoryName: title,
        videoCount: count,
      ),
    );
  }

  Widget _buildMenuCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black, width: 2.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _menuItem(Icons.playlist_add, 'Playlist'),
          _menuItem(Icons.settings, 'Settings'),
          _menuItem(Icons.home, 'Home'),
          _menuItem(Icons.video_library, 'Library'),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
