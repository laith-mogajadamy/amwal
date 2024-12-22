part of 'customers_bloc.dart';

abstract class CustomersEvent extends Equatable {}

class GetCustomers extends CustomersEvent {
  GetCustomers();

  @override
  List<Object?> get props => [];
}

class ShowFilter extends CustomersEvent {
  final bool? filter;

  ShowFilter({
    this.filter,
  });

  @override
  List<Object?> get props => [
        filter,
      ];
}
