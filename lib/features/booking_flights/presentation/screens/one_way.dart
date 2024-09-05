import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lion_air/features/booking_flights/presentation/widgets/book_flight_widget.dart';

class OneWayScreen extends StatefulWidget {
  const OneWayScreen({super.key});

  @override
  State<OneWayScreen> createState() => _OneWayScreenState();
}

class _OneWayScreenState extends State<OneWayScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r), topRight: Radius.circular(32.r)),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        width: 320.w,
                        height: 161.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFAB3130),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BookFlightWidget.fromLocationBox(),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: SvgPicture.asset(
                                  'assets/img/booking_flights/up_down_arrow.svg',
                                  width: 10.w,
                                  height: 10.h,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              BookFlightWidget.destinationLocationBox()
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: 320.w,
                        height: 62.h,
                        decoration: BoxDecoration(
                            color: Color(0xFFE1E3DE),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: departureBox(),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: 320.w,
                        height: 62.h,
                        decoration: BoxDecoration(
                            color: Color(0xFFE1E3DE),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 37.w,
                                height: 37.h,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/img/booking_flights/passengers.svg',
                                    width: 15.w,
                                    height: 15.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Passengers',
                                      style: GoogleFonts.poppins(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFAB3130)),
                                    ),
                                    TextField(
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.zero,
                                          border: InputBorder.none,
                                          hintText: 'Add Passengers',
                                          hintMaxLines: 1,
                                          hintStyle: GoogleFonts.poppins(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFAB3130))),
                                    ),
                                    Container(
                                      width: 237.w,
                                      height: 1.h,
                                      color: Color(0xFFAB3130),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: 320.w,
                        height: 41.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFAB3130),
                                Color(0xFF68191F),
                              ]),
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        child: Center(
                          child: Text(
                            'Search',
                            style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  'Recent Searches',
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ListView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: BookFlightWidget.recentSearchBox(),
                              );
                            })
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget departureBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 37.w,
          height: 37.h,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3), shape: BoxShape.circle),
          child: Center(
            child: SvgPicture.asset(
              'assets/img/booking_flights/departure_date.svg',
              width: 15.w,
              height: 15.h,
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Departure Date',
                style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFAB3130)),
              ),
              TextField(
                maxLines: 1,
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: 'Select Date',
                    hintMaxLines: 1,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFAB3130))),
              ),
              Container(
                width: 237.w,
                height: 1.h,
                color: Color(0xFFAB3130),
              )
            ],
          ),
        ),
      ],
    );
  }
}
