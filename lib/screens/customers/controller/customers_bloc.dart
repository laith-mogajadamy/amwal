import 'dart:convert';

import 'package:amwal/core/utils/enums.dart';
import 'package:amwal/core/utils/prefrences.dart';
import 'package:amwal/model/customer.dart';
import 'package:amwal/model/customer_model.dart';
import 'package:amwal/screens/customers/data/customersrqwest.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'customers_event.dart';
part 'customers_state.dart';

class CustomersBloc extends Bloc<CustomersEvent, CustomersState> {
  CustomersBloc() : super(const CustomersState()) {
    on<GetCustomers>((event, emit) async {
      print("GetCustomers");
      String? ptoken = Preferences.getToken();
      print("state.token");
      print(state.token);
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          customerState: RequestState.loading,
          token: ptoken,
        ));
        http.Response response =
            await CustomersReqwest.getcustomers(state.token);
        var responsemap = jsonDecode(response.body);
        print("responsemap=");
        print(responsemap);
        if (response.statusCode == 200) {
          emit(state.copyWith(
            customers: List<CustomerModel>.from(
              (responsemap['data'] as List).map(
                (e) => CustomerModel.fromJson(e),
              ),
            ),
            customerState: RequestState.loaded,
            customerMessage: responsemap['message'] ?? '',
            //
          ));
          print("state.customers=");
          print(state.customers);
        } else {
          emit(state.copyWith(
            customerState: RequestState.error,
            customerMessage: responsemap["message"] ?? '',
          ));
        }
      } else {
        emit(state.copyWith(
          customerState: RequestState.error,
          customerMessage: "Unauthenticated",
        ));
      }
    });
    on<ShowFilter>((event, emit) async {
      emit(
        state.copyWith(
          filter: event.filter,
        ),
      );
    });
    on<ChangeFromDate>((event, emit) async {
      emit(
        state.copyWith(
          fromdate: event.fromdate,
        ),
      );
    });
    on<ChangeToDate>((event, emit) async {
      emit(
        state.copyWith(
          todate: event.todate,
        ),
      );
    });
    on<ChangeTotalFilter>((event, emit) async {
      emit(
        state.copyWith(
          totalfiter: event.totalfilter,
        ),
      );
    });
  }
}
