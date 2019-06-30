import 'package:flutter/material.dart';
import 'package:ium_led/MachineMarchine.dart';
import 'package:ium_led/UserMachine.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     elevation: 1,
    //     title: Text("IMU_LED"),
    //   ),
    //   bottomNavigationBar: BottomNavyBar(),
    // );
    // Widget buildMyRouteContent(BuildContext context) {
    return BottomNavyBar();
  }
}

class BottomNavyBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavyBarState();
  }
}

class _BottomNavyBarState extends State<BottomNavyBar> {
  int selectedIndex = 0;
  Color backgroudColor = Colors.white;

   final _kTabPages = <Widget>[
      UserMachine(),
      MachineMachine(),
      //Info(),

    ];


  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.insert_emoticon), Text("Usuário"), Colors.amber),
    NavigationItem(Icon(Icons.linked_camera), Text('Maquina' ), Colors.purple),
  ];
  

  Widget _buildItem(NavigationItem item, bool isSelected) {
     assert(_kTabPages.length == items.length);

    return AnimatedContainer(
      duration: Duration(milliseconds: 620),
      width: isSelected ? 125 : 50,
      height: double.maxFinite,
      padding: isSelected ?
       EdgeInsets.only(left: 16, right: 16): 
       null,
      decoration: isSelected ? BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        
        ) : null,
          child: ListView(
            scrollDirection: Axis.horizontal,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconTheme(
                data: IconThemeData(
                  size: 24,
                  color: isSelected ? backgroudColor : Colors.black,
                  ),
                child: item.icon,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: isSelected ? 
                   DefaultTextStyle.merge(
                  style: TextStyle(
                    color: backgroudColor
                    ), child: item.title,
                ): Container(),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text("IMU_LED",),
      ),
      body: _kTabPages[selectedIndex],
       bottomNavigationBar: Container(
          height: 56,
          padding: EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
          decoration: BoxDecoration(
            color: backgroudColor,
            boxShadow: [
             BoxShadow( color:Colors.black12,
             blurRadius: 4,
             ) 
            ]

          ),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((item) {
              var itemIndex = items.indexOf(item);
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = itemIndex;
                    });
                  },
                  child: _buildItem(item, selectedIndex == itemIndex));
            }).toList(),
          )),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;
  final Color color;

  NavigationItem(this.icon, this.title, this.color);
}
