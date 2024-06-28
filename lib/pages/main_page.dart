import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trexplore/components/my_drawer.dart';
import 'package:trexplore/pages/home_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ExplorePage(),
    FriendsPage(),
    ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          'Trexplore',
          style: GoogleFonts.vollkorn(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 255, 0, 85),
                Color.fromARGB(0, 255, 255, 255),
              ],
            ),
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: _pages[_currentIndex],
     bottomNavigationBar: BottomNavigationBar(
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  backgroundColor: Colors.transparent,
  elevation: 0,
  selectedItemColor: Color.fromARGB(255, 255, 0, 85),
  unselectedItemColor: Colors.grey,
  selectedFontSize: 14,
  unselectedFontSize: 14,
  selectedLabelStyle: GoogleFonts.notoSansLaoLooped(
    fontWeight: FontWeight.bold,
  ),
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.explore_outlined),
      label: 'Explore',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people_alt_outlined),
      label: 'Friends',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble_outline),
      label: 'Chat',
    ),
  ],
),

    );
  }
}

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Background image with text overlay
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150, // Adjust height as per your design
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://wallpaperswide.com/download/travel_illustrations_28-wallpaper-1280x800.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Explore the,\n',
                                style: GoogleFonts.notoSansLaoLooped(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'Beautiful World!',
                                style: GoogleFonts.notoSansLaoLooped(
                                  color: Color.fromARGB(255, 255, 0, 85),
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                // Text(
                //   'Search',
                //   style: GoogleFonts.raleway(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                SizedBox(height: 8),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        
                        hintText: 'Search...',
                        icon: Padding(
                          padding: const EdgeInsets.fromLTRB(14,  0, 0, 0),
                          child: Icon(Icons.search, color: Colors.black,),
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Categories',
                  style: GoogleFonts.raleway(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 2),
                    children: [
                      CategoryCard(title: 'Deserts'),
                      CategoryCard(title: 'Beaches'),
                      CategoryCard(title: 'Mountains'),
                      CategoryCard(title: 'Cities'),
                      CategoryCard(title: 'Historical'),
                      CategoryCard(title: 'Adventure'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 0, 10),
                  child: Text(
                    "Most Popular Places",
                    style: GoogleFonts.notoSansLaoLooped(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 2),
                    scrollDirection: Axis.horizontal,
                    children: [
                      PlaceCard(
                        imageUrl:
                            'https://cdn.britannica.com/37/189837-050-F0AF383E/New-Delhi-India-War-Memorial-arch-Sir.jpg',
                        placeName: 'Delhi',
                      ),
                      PlaceCard(
                        imageUrl:
                            'https://upload.wikimedia.org/wikipedia/commons/7/70/Neeulm_Valley_AJK_%28Arang_Kel%29.jpg',
                        placeName: 'Kashmir',
                      ),
                      PlaceCard(
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5fQMq5l92YM92NHILUOEm0rafFQQieBbxOA&s',
                        placeName: 'Nainital',
                      ),
                      PlaceCard(
                        imageUrl:
                            'https://cdn.britannica.com/26/84526-050-45452C37/Gateway-monument-India-entrance-Mumbai-Harbour-coast.jpg',
                        placeName: 'Mumbai',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 0, 10),
                  child: Text(
                    "Recommended",
                    style: GoogleFonts.notoSansLaoLooped(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 2),
                    scrollDirection: Axis.horizontal,
                    children: [
                      PlaceCard(
                        imageUrl:
                            'https://cdn.britannica.com/37/189837-050-F0AF383E/New-Delhi-India-War-Memorial-arch-Sir.jpg',
                        placeName: 'Delhi',
                      ),
                      PlaceCard(
                        imageUrl:
                            'https://upload.wikimedia.org/wikipedia/commons/7/70/Neeulm_Valley_AJK_%28Arang_Kel%29.jpg',
                        placeName: 'Kashmir',
                      ),
                      PlaceCard(
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5fQMq5l92YM92NHILUOEm0rafFQQieBbxOA&s',
                        placeName: 'Nainital',
                      ),
                      PlaceCard(
                        imageUrl:
                            'https://cdn.britannica.com/26/84526-050-45452C37/Gateway-monument-India-entrance-Mumbai-Harbour-coast.jpg',
                        placeName: 'Mumbai',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class PlaceCard extends StatelessWidget {
  final String imageUrl;
  final String placeName;

  PlaceCard({required this.imageUrl, required this.placeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              padding: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  placeName,
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;

  CategoryCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 247, 58, 121),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.raleway(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255)
          ),
        ),
      ),
    );
  }
}

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Friends Page',
        style: GoogleFonts.raleway(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

