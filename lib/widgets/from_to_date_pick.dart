import 'package:amwal/core/utils/appcolors.dart';
import 'package:amwal/generated/l10n.dart';
import 'package:amwal/screens/customers/controller/customers_bloc.dart';
import 'package:amwal/widgets/font/black14text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FromToDatePick extends StatelessWidget {
  const FromToDatePick({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime? fromselectedDate; // To store the selected date
    DateTime? toselectedDate; // To store the selected date

    Future<void> pickDate(BuildContext context, String w) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppColor.appbuleBG,
              colorScheme: ColorScheme.light(
                primary: AppColor.appbuleBG,
                onPrimary: AppColor.whiteColor,
                onSurface: AppColor.appbuleBG,
              ),
              dialogBackgroundColor: AppColor.whiteColor,
            ),
            child: child!,
          );
        },
      );

      if (pickedDate != null && pickedDate != fromselectedDate) {
        if (w == "from") {
          fromselectedDate = pickedDate;
          context.read<CustomersBloc>().add(ChangeFromDate(
              fromdate:
                  '${fromselectedDate!.year.toString()}/${fromselectedDate!.month.toString()}/${fromselectedDate!.day.toString()}'));
        } else {
          toselectedDate = pickedDate;
          context.read<CustomersBloc>().add(ChangeToDate(
              todate:
                  '${toselectedDate!.year.toString()}/${toselectedDate!.month.toString()}/${toselectedDate!.day.toString()}'));
        }
      }
    }

    return BlocBuilder<CustomersBloc, CustomersState>(
      builder: (context, state) {
        return Row(
          children: [
            Row(
              children: [
                Black14text(text: "${S.of(context).from}: "),
                SizedBox(
                  width: 10.w,
                ),
                ElevatedButton(
                  onPressed: () => pickDate(context, 'from'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.whiteColor,
                      padding: const EdgeInsets.all(10),
                      shape: const StadiumBorder()),
                  child: Black14text(
                    text: state.fromdate != ''
                        ? state.fromdate
                        : S.of(context).nodate,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10.w,
            ),
            Row(
              children: [
                Black14text(text: "${S.of(context).to}: "),
                SizedBox(
                  width: 10.w,
                ),
                ElevatedButton(
                  onPressed: () => pickDate(context, 'to'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.whiteColor,
                      padding: const EdgeInsets.all(10),
                      shape: const StadiumBorder()),
                  child: Black14text(
                    text: state.todate != ''
                        ? state.todate
                        : S.of(context).nodate,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
