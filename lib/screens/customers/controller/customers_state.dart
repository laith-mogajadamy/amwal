part of 'customers_bloc.dart';

class CustomersState extends Equatable {
  final String token;
  //
  final List<Customer> customers;
  final RequestState customerState;
  final String customerMessage;
  //
  final bool filter;
  //
  final String fromdate;
  final String todate;
  final String totalfiter;

  const CustomersState({
    this.token = '',
    //
    this.customers = const [],
    this.customerState = RequestState.loading,
    this.customerMessage = '',

    //
    this.filter = false,
    //
    this.fromdate = '',
    this.todate = '',
    this.totalfiter = '',
  });

  CustomersState copyWith({
    String? token,
    //
    List<Customer>? customers,
    RequestState? customerState,
    String? customerMessage,

    //
    bool? filter,
    //
    String? fromdate,
    String? todate,
    String? totalfiter,
  }) {
    return CustomersState(
      token: token ?? this.token,

      //
      customers: customers ?? this.customers,
      customerState: customerState ?? this.customerState,
      customerMessage: customerMessage ?? this.customerMessage,

      //
      filter: filter ?? this.filter,
      //
      fromdate: fromdate ?? this.fromdate,
      todate: todate ?? this.todate,
      totalfiter: totalfiter ?? this.totalfiter,
    );
  }

  @override
  List<Object?> get props => [
        token,
        //
        customers,
        customerState,
        customerMessage,
        //
        filter,
        //
        fromdate,
        todate,
        totalfiter,
      ];
}
