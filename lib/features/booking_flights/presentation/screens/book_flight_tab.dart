import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lion_air/features/booking_flights/presentation/screens/one_way.dart';
import 'package:lion_air/features/booking_flights/presentation/screens/return.dart';

class BookFlightTab extends StatefulWidget {
  const BookFlightTab({super.key});

  @override
  State<BookFlightTab> createState() => _BookFlightTabState();
}

class _BookFlightTabState extends State<BookFlightTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFFAB3130),
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_circle_left_rounded,
            size: 23.w,
            color: Colors.white,
          ),
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Booking Flights',
            style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22.r),
                child: Container(
                  height: 47.h,
                  width: 322.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      color: Colors.white),
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.r),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFAB3130), Color(0xFF68191F)])),
                      labelColor: Colors.white,
                      unselectedLabelColor: Color(0xFFAB3130),
                      tabs: [
                        Tab(
                          child: Text(
                            'One Way',
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Return',
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ]),
                ),
              )),
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height - 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r)),
              color: Colors.white,
            ),
            child: Expanded(
                child: TabBarView(children: [OneWayScreen(), ReturnScreen()])),
          ),
        ),
      ),
    );
  }
}
