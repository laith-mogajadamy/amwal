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

class ChangeFromDate extends CustomersEvent {
  final String? fromdate;

  ChangeFromDate({
    this.fromdate,
  });

  @override
  List<Object?> get props => [
        fromdate,
      ];
}

class ChangeToDate extends CustomersEvent {
  final String? todate;

  ChangeToDate({
    this.todate,
  });

  @override
  List<Object?> get props => [
        todate,
      ];
}

class ChangeTotalFilter extends CustomersEvent {
  final String? totalfilter;

  ChangeTotalFilter({
    this.totalfilter,
  });

  @override
  List<Object?> get props => [
        totalfilter,
      ];
}
