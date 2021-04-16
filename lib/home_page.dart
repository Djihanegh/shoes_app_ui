import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  int selectedIndex = 0;
  int navBarIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      length: 3,
      initialIndex: selectedIndex,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
        initialIndex: selectedIndex,
        length: 3,
        child: Scaffold(
            bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child:
                    Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF111015),
                    ),
                    height: 40,
                    child:
                    Row(
                  children: [
                    buildNavBarItem(Icons.home, 0),
                    buildNavBarItem(Icons.search, 1),
                    buildNavBarItem(Icons.add, 2),
                    buildNavBarItem(Icons.home, 3),
                    buildNavBarItem(Icons.person, 4),
                  ],
                ))),
            appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 150),
              child: AppBar(
                  // flexibleSpace: Image.asset("name"),
                  toolbarHeight: 100,
                  title: Column(children: [
                    Text("Athletic Shoes",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 2),
                    Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Text(
                        "Collection",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ]),
                  backgroundColor: Color(0xFF111015),
                  bottom: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: Color(0xFF797A82),
                    indicatorColor: Colors.transparent,
                    tabs: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                            _tabController.animateTo(0);
                          });
                        },
                        child: Container(
                            width: 70,
                            child: Tab(
                              text: "Men Shoes",
                            )),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                              _tabController.animateTo(1);
                            });
                          },
                          child: Container(
                            width: 120,
                            child: Tab(
                              text: "Women Shoes",
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                              _tabController.animateTo(2);
                            });
                          },
                          child: Container(
                            width: 80,
                            child: Tab(
                              text: "Kids Shoes",
                            ),
                          ))
                    ],
                  )),
            ),
            body: TabBarView(controller: _tabController, children: [
              SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: 350,
                    child: _productList(),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: 23, right: 10, top: 10, bottom: 20),
                          child: Text(
                            "Latest Shoes",
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          )),
                      Row(
                        children: [
                          Text("Show all",
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )),
                          SizedBox(width: 2),
                          Icon(Icons.arrow_right)
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 100,
                    child: _showAll(),
                  ),
                ]),
              ),
              Center(
                child: Text('Hello ${selectedIndex}'),
              ),
              Center(
                child: Text('Hello ${selectedIndex}'),
              )
            ])));
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            navBarIndex = index;
          });
        },
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width / 5.3,
          decoration: index == navBarIndex
              ? BoxDecoration(
                  // borderRadius: BorderRadius.all(Radius.circular(10)),
              //    borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF111015),
                  gradient: LinearGradient(
                      colors: [Color(0xFF797A82), Color(0xFF111015)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter))
              : BoxDecoration(
                  color: Color(0xFF111015),
                  //borderRadius: BorderRadius.circular(10),
                ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ));
  }
}

Widget _productList() {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.only(left: 23, right: 10, top: 10, bottom: 20),
            child: Material(
                elevation: 3.5,
                shadowColor: Color(0xFF797A82),
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
                child: InkWell(
                    highlightColor: Colors.white,
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 5.0,
                      runSpacing: 10.0,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                                height: 500,
                                width: 200,
                                child: Column(
                                  children: [
                                    Container(
                                        height: 20,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.black,
                                          ),
                                        )),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 160,
                                      width: 200,
                                      child: Image.asset(
                                        "assets/shoes/shoes_1.jpg",
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 100),
                                      child: Text("NDM R1",
                                          style: GoogleFonts.lato(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          )),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                        padding: EdgeInsets.only(right: 125),
                                        child: Text("Shoes",
                                            style: GoogleFonts.lato(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                            ))),
                                    SizedBox(height: 2),
                                    Padding(
                                        padding: EdgeInsets.only(right: 120),
                                        child: Text("Men's runnig",
                                            style: GoogleFonts.lato(
                                              color: Color(0xFF797A82),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ))),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            "180.00 \$",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Colors",
                                              style: TextStyle(
                                                  color: Color(0xFF797A82),
                                                  fontSize: 10),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                                height: 15,
                                                width: 15,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            Color(0xFF797A82),
                                                        width: 1.0,
                                                        style:
                                                            BorderStyle.solid),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            70)),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(70)),
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: null,
                                                    ),
                                                  ),
                                                )),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                                height: 15,
                                                width: 15,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            Color(0xFF797A82),
                                                        width: 1.0,
                                                        style:
                                                            BorderStyle.solid),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            70)),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(70)),
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: null,
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )))
                      ],
                    ))));
      });
}

Widget _showAll() {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.only(left: 23, right: 10, top: 10, bottom: 20),
            child: Material(
                elevation: 3.5,
                shadowColor: Color(0xFF797A82),
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
                child: InkWell(
                    highlightColor: Colors.white,
                    child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 5.0,
                        runSpacing: 10.0,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                  height: 80,
                                  width: 80,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 200,
                                        child: Image.asset(
                                          "assets/shoes/shoes_1.jpg",
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    ],
                                  )))
                        ]))));
        // ],
        // ))));
      });
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.25 //0.9167

        );
    path.quadraticBezierTo(
        size.width * 0.45,
        size.height * 0.4, //0.875
        size.width * 0.68,
        size.height * 0.26);
    path.quadraticBezierTo(size.width * 0.68, size.height * 0.2,
        size.width * 1.0, size.height * 0.35);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
