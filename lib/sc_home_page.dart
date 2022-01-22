import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quick_sort_algoritm/sc_quick_sort_algorithm.dart';
import 'package:quick_sort_algoritm/sc_sum_algorithm.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _ComplexDrawerPageState createState() => _ComplexDrawerPageState();
}

class _ComplexDrawerPageState extends State<HomePageScreen> {


  int pageIndex = 0; // page count
  final SumAlgorithmScreen _sumAlgorithm =
      const SumAlgorithmScreen(); //page screen
  final QuickSortAlgorithmScreen _quickSortAlgorithm =
      const QuickSortAlgorithmScreen(); //page screen
  Widget _showPage = const QuickSortAlgorithmScreen(); //show page screen

  /* ---------------------- select page ----------------------------- */

  _pageChooser(int page) {
    switch (page) {
      case 0:
        return _quickSortAlgorithm;
      case 1:
        return _sumAlgorithm;
    }
  }

  /* ---------------------- select page ----------------------------- */

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: appBar(),
        body: _showPage,
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: const Color(0xFF1A374D),
          items: const [
            Icon(
              Icons.merge_type,
              color: Colors.white,
            ),
            Icon(
              Icons.functions_outlined,
              color: Colors.white,
            )
          ],
          onTap: (int tapped) {
            setState(() {
              _showPage = _pageChooser(tapped);
            });
          },
        ),
        /*bottomNavigationBar: BottomNavyBar(
          onItemSelected: (index) {
            setState(() {
              pageIndex = index;
              _showPage = _pageChooser(index);
            });
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                icon: const Icon(
                  Icons.merge_type,
                ),
                title: const Text(
                  "مرتب سازی سریع",
                  style: TextStyle(fontSize: 10),
                ),
                activeColor: Colors.green,
                inactiveColor: Colors.black45),
            BottomNavyBarItem(
                icon: const Icon(Icons.functions_outlined),
                title: const Text(
                  "جمع عناصر آرایه",
                  style: TextStyle(fontSize: 10),
                ),
                activeColor: Colors.blue,
                inactiveColor: Colors.black45),
          ],
          selectedIndex: pageIndex,
        ),*/
        drawerScrimColor: Colors.transparent,
        backgroundColor: const Color(0xffe3e9f7),
      ),
    );
  }
}
