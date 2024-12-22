// import 'package:amwal/core/utils/appcolors.dart';
// import 'package:amwal/generated/l10n.dart';
// import 'package:amwal/welcome/controller/enter_bloc.dart';
// import 'package:amwal/widgets/black16text.dart';
// import 'package:amwal/widgets/black18text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SelectCity extends StatelessWidget {
//   const SelectCity({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return BlocBuilder<EnterBloc, EnterState>(
//       builder: (context, state) {
//         // List<DropdownMenuItem<City>> saudidropdownlist = [];
//         // for (var i = 0; i < state.soudicitys.length; i++) {
//         //   saudidropdownlist.add(
//         //     DropdownMenuItem(
//         //       value: state.soudicitys[i],
//         //       child: Black16text(text: state.soudicitys[i].name),
//         //     ),
//         //   );
//         // }
//         // List<DropdownMenuItem<City>> uaedropdownlist = [];
//         // for (var i = 0; i < state.uaecitys.length; i++) {
//         //   uaedropdownlist.add(
//         //     DropdownMenuItem(
//         //       value: state.uaecitys[i],
//         //       child: Black16text(text: state.uaecitys[i].name),
//         //     ),
//         //   );
//         // }
//         return SizedBox(
//           width: size.width,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Black18text(text: S.of(context).city),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Center(
//                 child: SizedBox(
//                   height: size.height / 15,
//                   width: size.width / 1.5,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: AppColor.whiteColor,
//                       borderRadius: BorderRadius.circular(20.r),
//                       boxShadow: [
//                         BoxShadow(
//                           blurRadius: 3.r,
//                           color: AppColor.black,
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
//                       child: DropdownButton<City>(
//                         underline: const SizedBox.shrink(),
//                         icon: const Icon(Icons.keyboard_arrow_down),
//                         alignment: AlignmentDirectional.topCenter,
//                         iconSize: 30.r,
//                         isExpanded: true,
//                         dropdownColor: AppColor.whiteColor,
//                         borderRadius: BorderRadius.circular(20.r),
//                         hint: Black16text(text: S.of(context).city),
//                         items: (state.selectedcoutry.id == 1)
//                             ? saudidropdownlist
//                             : uaedropdownlist,
//                         value:
//                             (state.selectedcity == const City(id: 0, name: ''))
//                                 ? null
//                                 : state.selectedcity,
//                         onChanged: (value) {
//                           context.read<EnterBloc>().add(
//                                 CityChanged(
//                                   city: value,
//                                 ),
//                               );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
