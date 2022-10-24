import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textBody(Color? color){
  return GoogleFonts.notoSans(
    fontSize: 30,
    color: color,
    // fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
}
TextStyle textBodyBold(Color? color){
  return GoogleFonts.notoSans(
    fontSize: 48,
    color: color,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
}
TextStyle textTitle(Color? color){
  return GoogleFonts.notoSans(
    fontSize: 48,
    color: color,
    fontStyle: FontStyle.normal,
  );
}
TextStyle textTitleBold(Color? color){
  return GoogleFonts.notoSans(
    fontSize: 60,
    color: color,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
}