import 'package:amwal/core/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Black12text extends StatelessWidget {
  final String text;
  const Black12text({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: GoogleFonts.cairo(
        fontSize: 12.sp,
        color: AppColor.apptitle,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
