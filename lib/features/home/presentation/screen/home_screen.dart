import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lion_air/features/booking_flights/presentation/screens/book_flight_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> adList = [
    "assets/img/home/ad_slider_1.png",
    "assets/img/home/ad_slider_1.png",
    "assets/img/home/ad_slider_1.png",
    "assets/img/home/ad_slider_1.png"
  ];
  final List<Map<String, String>> popularDestination = [
    {
      'image': 'assets/img/home/popular_desination1.jpeg',
      'country': 'South Korea',
      'airport': 'Incheon International Airport',
    },
    {
      'image': 'assets/img/home/popular_desination2.jpeg',
      'country': 'Japan',
      'airport': 'Narita International Airport',
    },
    {
      'image': 'assets/img/home/popular_desination3.jpeg',
      'country': 'France',
      'airport': 'Charles de Gaulle Airport',
    },
  ];

  late List<Widget> _pages;
  int _activePage = 0;
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.page == adList.length - 1) {
        _pageController.animateToPage(0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }
    });
  }

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _pages = List.generate(
        adList.length,
        (index) => ImagePlaceholder(
              imagePath: adList[index],
            ));
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 368.h),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35.r),
                bottomRight: Radius.circular(35.r)),
            child: AppBar(
              backgroundColor: Color(0xFFAB3130),
              title: Image.asset(
                'assets/img/home/lion_air_logo.png',
                width: 120.w,
                height: 32.h,
                color: Colors.white,
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        size: 20.w,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(
                        Icons.menu,
                        size: 20.w,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
              flexibleSpace: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/img/home/lion_air_plane.png')),
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: SizedBox(
                  width: 330.w,
                  height: 130.h,
                  child: Column(
                    children: [
                      Container(
                        width: 320.w,
                        height: 113.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: PageView.builder(
                            controller: _pageController,
                            itemCount: adList.length,
                            onPageChanged: (value) {
                              setState(() {
                                _activePage = value;
                              });
                            },
                            itemBuilder: (context, index) {
                              return _pages[index];
                            }),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(
                              _pages.length,
                              (index) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.w),
                                    child: InkWell(
                                      onTap: () {
                                        _pageController.animateToPage(index,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeIn);
                                      },
                                      child: CircleAvatar(
                                        radius: 4.r,
                                        backgroundColor: _activePage == index
                                            ? Color(0xFFAB3130)
                                            : Colors.grey,
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookFlightTab()));
                      },
                      child: featureBox(
                          'assets/img/home/book_flight.svg', 'Book Flights')),
                  featureBox(
                      'assets/img/home/booking_list.svg', 'Booking List'),
                  featureBox('assets/img/home/check_in.svg', 'Check-In'),
                  featureBox(
                      'assets/img/home/flight_status.svg', 'Flight Status'),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  'Popular Destination',
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 150.h,
                // Centering the ListView horizontally
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 330.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularDestination.length,
                      itemBuilder: (context, index) {
                        return popularDestinationBox(
                            popularDestination[index]['image']!,
                            popularDestination[index]['country']!,
                            popularDestination[index]['airport']!);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget popularDestinationBox(String image, String country, String airport) {
    return Padding(
      padding: EdgeInsets.only(right: 6.w),
      child: Container(
        width: 101.w,
        height: 143.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7),
              BlendMode.softLight,
            ),
            fit: BoxFit.fill,
            image: AssetImage(
              image,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 18.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: Icon(
                      Icons.arrow_outward_sharp,
                      size: 9.w,
                      color: Color(0xFFAB3130),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    country,
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    airport,
                    style: GoogleFonts.poppins(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget featureBox(String imagePath, String title) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: SizedBox(
        width: 75.w,
        child: Column(
          children: [
            Container(
              width: 49.w,
              height: 49.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFAB3130)),
              child: Center(
                child: SvgPicture.asset(
                  imagePath,
                  width: 21.w,
                  height: 16.h,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceholder({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: Image.asset(
        imagePath!,
        fit: BoxFit.cover,
      ),
    );
  }
}
