import 'package:flutter/material.dart';
import 'package:flutter_food/pages/food/food_page.dart';
import 'package:flutter_food/pages/food/order_page.dart';
import 'package:flutter_food/pages/login/login_page.dart';
import 'package:flutter_food/pages/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;

  var _activeColor = Colors.blue;
  var _inActiveColor = Colors.black;
  List<Color> _itemsColor = [Colors.blue, Colors.black];
  var _subPage = FoodPage();

  int getSubPageIndex(){
    return _subPageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildHeader(),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  //พื้นหลังแบบ gradient
                  // ไล่เฉดจากมุมบนซ้ายไปมุมล่างขวาของ Container
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  // ไล่เฉดจากสีแดงไปสีน้ำเงิน
                  colors: [
                    Colors.deepPurpleAccent,
                    Colors.blueAccent,
                  ],
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Container(
                        width: 75.0,
                        height: 75.0,
                        child: Image.asset(
                          'assets/images/profile.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sittidet Pawutinan',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            'pawutinan_s@silpakorn.edu',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.fastfood, color: _itemsColor[0],), Text('Food', style: TextStyle(color: _itemsColor[0]),)),
              onTap: () => _showSubPage(0),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.person, color: _itemsColor[1],), Text('Profile', style: TextStyle(color: _itemsColor[1]),)),
              onTap: () => _showSubPage(1),
            ),
          ],
        ),
      ),
      body: Container(
        child: _buildSubPage(),
      ),
    );
  }

  Text _buildHeader() {
    switch (_subPageIndex) {
      case 0:
        return Text('FOOD');
      case 1:
        return Text('Profile');
      default:
        return Text('FLUTTER FOOD');
    }
  }

  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
      _itemsColor[index] = _activeColor;
      _setInActiveItemColor(index);
    });
    Navigator.of(context).pop();
  }

  _setInActiveItemColor(int index){
    for(int i = 0; i < _itemsColor.length; ++i){
      if(i != index)
        _itemsColor[i] = _inActiveColor;
    }
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0: // home page
        return FoodPage();
      case 1:
        return ProfilePage();
      default:
        return SizedBox.shrink();
    }
  }

  Row _buildDrawerItem(Widget icon, Widget title,) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 8.0,
        ),
        title,
      ],
    );
  }
}
