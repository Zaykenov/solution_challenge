import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge/business_logic/article_service.dart';
import 'package:solution_challenge/business_logic/doctors_service.dart';
import 'package:solution_challenge/models/doctors_data.dart';
import 'package:solution_challenge/presentation_UI/screens/doctor_appointmentPage.dart';
import 'package:solution_challenge/presentation_UI/screens/map_page.dart';
import '../../models/article_data.dart';
import 'package:solution_challenge/presentation_UI/screens/article_page.dart';

class InterestsPage extends StatefulWidget {
  const InterestsPage({Key? key}) : super(key: key);

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  int _currentIndex = 0;
  List<Article> articles = [];
  List<Doctors> doctors = [];
  bool _loading = true;
  int _selectedButtonIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      fetchData();
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Map",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    Container(
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('assets/images/mini_map.png'),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.grey,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MapPage(),
                              ),
                            );

                            // Button's onPressed logic
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E3F51),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            textStyle: const TextStyle(fontSize: 12),
                          ),
                          child: const Row(
                            children: [
                              Text('Search pharmacy'),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward_ios, size: 12),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Call",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30, // Adjust the radius as desired
                        backgroundImage: doctors.isNotEmpty
                            ? CachedNetworkImageProvider(doctors[0].image)
                            : null, // Display the image if doctors list is not empty
                        child: doctors.isEmpty
                            ? Icon(Icons
                                .person) // Display a default icon if doctors list is empty
                            : null,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            doctors.isNotEmpty
                                ? "${doctors[0].name}"
                                : '', // Return an empty string if doctors list is empty
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorAppointmentPage(),
                                ),
                              );
                              // Button's onPressed logic
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                backgroundColor: Color(
                                    0xFF2E3F51) // Customize the button color
                                ),
                            child: Text(
                              'Book Appointment',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    child: const Text(
                      'Show all',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () {},
                  ),
                ),
                const Text(
                  "Blog",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedButtonIndex = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: _selectedButtonIndex == 0
                                ? Color(0xFF2E3F51)
                                : null,
                          ),
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Latest',
                            style: TextStyle(
                              color: _selectedButtonIndex == 0
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Add spacing between buttons
                      ...articles
                          .map((article) => article.categories)
                          .expand((categories) =>
                              categories) // Flatten the nested list of categories
                          .map((category) => category.name)
                          .toSet() // Convert to Set to remove duplicates
                          .toList()
                          .asMap()
                          .entries
                          .map((entry) {
                        final index = entry.key + 1;
                        final categoryName = entry.value;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedButtonIndex = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: _selectedButtonIndex == index
                                  ? Color(0xFF2E3F51)
                                  : null,
                            ),
                            padding: EdgeInsets.all(8),
                            child: Text(
                              categoryName,
                              style: TextStyle(
                                color: _selectedButtonIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: _loading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  height: 90, // Adjust the height as desired
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: ListTile(
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            5), // Adjust the border radius as desired
                                        child: Container(
                                          width: 60,
                                          height:
                                              70, // Adjust the height as desired
                                          child: CachedNetworkImage(
                                            imageUrl: articles[index].image,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                      title: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            articles[index]
                                                .categories
                                                .map(
                                                    (category) => category.name)
                                                .join(', '),
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${articles[index].time_to_read} min reads",
                                            style: TextStyle(fontSize: 11),
                                          ),
                                        ],
                                      ),
                                      subtitle: Text(
                                        articles[index].header,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Gilroy',
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ArticlePage(
                                                article: articles[index]),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                              ],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: RoundedBottomNavigationBar(),
    );
  }

  void fetchData() async {
    try {
      List<Article> data = await ArticleService.fetchData();
      List<Doctors> doctorData = await DoctorsService.fetchData();

      setState(() {
        articles = data;
        doctors = doctorData;
        _loading = false;
      });
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        articles = [];
        _loading = false;
      });
    }
  }
}
