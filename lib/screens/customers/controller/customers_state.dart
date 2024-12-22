part of 'customers_bloc.dart';

class CustomersState extends Equatable {
  final String token;
  //
  final List<Customer> customers;
  final RequestState customerState;
  final String customerMessage;
  //
  final bool filter;
  const CustomersState({
    this.token = '',
    //
    this.customers = const [],
    this.customerState = RequestState.loading,
    this.customerMessage = '',

    //
    this.filter = false,
  });

  CustomersState copyWith({
    String? token,
    //
    List<Customer>? customers,
    RequestState? customerState,
    String? customerMessage,

    //
    bool? filter,
  }) {
    return CustomersState(
      token: token ?? this.token,

      //
      customers: customers ?? this.customers,
      customerState: customerState ?? this.customerState,
      customerMessage: customerMessage ?? this.customerMessage,

      //
      filter: filter ?? this.filter,
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
      ];
}
