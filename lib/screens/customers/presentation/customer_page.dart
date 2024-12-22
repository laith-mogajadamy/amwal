import 'package:amwal/core/utils/appcolors.dart';
import 'package:amwal/generated/l10n.dart';
import 'package:amwal/screens/customers/controller/customers_bloc.dart';
import 'package:amwal/screens/customers/presentation/customer_component.dart';
import 'package:amwal/widgets/customers_filter.dart';
import 'package:amwal/widgets/search_text_field.dart';
import 'package:amwal/widgets/white16text.dart';
import 'package:amwal/widgets/white18text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CustomerPage extends StatelessWidget {
  CustomerPage({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.whiteColorBG,
      appBar: AppBar(
        backgroundColor: AppColor.appbuleBG,
        title: White18text(
          text: S.of(context).customers,
        ),
      ),
      bottomSheet: BlocBuilder<CustomersBloc, CustomersState>(
        builder: (context, state) {
          return (state.filter)
              ? CustomersFilters(controller: controller)
              : const SizedBox.shrink();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchTextField(controller: controller),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      bool filter = context.read<CustomersBloc>().state.filter;
                      print(filter);
                      context.read<CustomersBloc>().add(
                            ShowFilter(filter: !filter),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width / 2.2, size.height / 18),
                      backgroundColor: AppColor.appblueGray,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: White16text(
                                text: S.of(context).advancedsearch)),
                        SizedBox(
                          width: 10.w,
                        ),
                        SvgPicture.asset("assets/svg/sliders.svg")
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width / 2.2, size.height / 18),
                      backgroundColor: AppColor.apporange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        White16text(text: S.of(context).search),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.search,
                          color: AppColor.whiteColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: CustomerComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
