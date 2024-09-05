import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BookFlightWidget{
  
  static Widget recentSearchBox() {
    return Container(
      width: 320.w,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/img/booking_flights/lion_air_logo_search.png',
                  width: 23.w,
                  height: 27.h,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'DPS  ',
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SvgPicture.asset(
                          'assets/img/booking_flights/plane_icon.svg',
                          width: 10.w,
                          height: 10.h,
                        ),
                        Text(
                          '  NRT',
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                          size: 10.w,
                        ),
                        Text(
                          'Mon, 13 Jun 2024   ',
                          style: GoogleFonts.poppins(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        SvgPicture.asset(
                          'assets/img/booking_flights/passengers.svg',
                          width: 10.w,
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          '2 Passengers',
                          style: GoogleFonts.poppins(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Container(
              width: 22.w,
              height: 22.h,
              decoration: BoxDecoration(
                  color: Color(0xFFBA3130), shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  Icons.arrow_forward,
                  size: 11.w,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget fromLocationBox() {
    return SizedBox(
      width: 288.w,
      child: Row(
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
                'assets/img/booking_flights/from_location.svg',
                width: 20.w,
                height: 20.h,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'From',
                  style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      hintText: 'Select Origin',
                      hintMaxLines: 1,
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
                Container(
                  width: 237.w,
                  height: 1.h,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget destinationLocationBox() {
    return SizedBox(
      width: 288.w,
      child: Row(
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
                'assets/img/booking_flights/to_location.svg',
                width: 20.w,
                height: 20.h,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'To',
                  style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      hintText: 'Select Destination',
                      hintMaxLines: 1,
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
                Container(
                  width: 237.w,
                  height: 1.h,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}