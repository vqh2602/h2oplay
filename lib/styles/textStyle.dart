import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textBody(Color? color){
  return GoogleFonts.notoSans(
    fontSize: 35,
    color: color,
    // fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
}
TextStyle textBodyBold(Color? color){
  return GoogleFonts.notoSans(
    fontSize: 40,
    color: color,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
}
TextStyle textTitle(Color? color){
  return GoogleFonts.notoSans(
    fontSize: 50,
    color: color,
    fontStyle: FontStyle.normal,
  );
}
TextStyle textTitleBold(Color? color){
  return GoogleFonts.notoSans(
    fontSize: 55,
    color: color,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
}
TextStyle textLabel(Color? color){
  return GoogleFonts.notoSans(
    fontSize: 25,
    color: color,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
}