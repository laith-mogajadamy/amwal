part of 'enter_bloc.dart';

class EnterState extends Equatable {
  final String islogedin;

  final FormSubmissionStatus logoutStatus;
  final String language;

  //
  final User user;
  final int id;
  final String token;

  final String name;
  bool get isValidName => email.length >= 1;
  final String email;
  bool get isValidEmail => email.length >= 1;
  final String password;
  final String retypePassword;
  bool get isValidPassword => password.length >= 1;
  final String phone;
  bool get isValidnumber => phone.length >= 1;

  final String city;
  final String location;

//

  final FormSubmissionStatus formStatus;
  final String message;
//
  final String companyname;
  final String currentFiscalYearCode;

//
  final List<Currency> currencys;
  final Currency selectedcurrency;

  const EnterState({
    // this.user = const User(
    //     token: "", email: "", name: "", number: "", type: "", password: ""),
    this.islogedin = '',
    this.logoutStatus = const InitialFormStatus(),
    this.language = 'en',

    //
    this.user = const User(
      guid: '',
      name: "",
      code: "",
      number: "",
      isAdmin: false,
    ),
    this.token = '',
    this.id = 0,
    this.email = '',
    this.password = '',
    this.retypePassword = '',
    this.name = '',
    this.phone = '',
    this.city = '',
    this.location = '',

    //

    this.message = '',
    this.formStatus = const InitialFormStatus(),
    //
    this.companyname = '',
    this.currentFiscalYearCode = '',
    //
    this.currencys = const [],
    this.selectedcurrency = const Currency(guid: '', code: '', iddefault: ''),
  });

  EnterState copyWith({
    String? islogedin,
    FormSubmissionStatus? logoutStatus,
    String? language,

    //
    User? user,
    String? token,
    int? id,
    String? email,
    String? image,
    String? password,
    String? retypePassword,
    String? name,
    String? phone,
    String? city,
    String? location,

    //

    String? message,
    FormSubmissionStatus? formStatus,

    //
    String? companyname,
    String? currentFiscalYearCode,
    //
    List<Currency>? currencys,
    Currency? selectedcurrency,
  }) {
    return EnterState(
      islogedin: islogedin ?? this.islogedin,

      logoutStatus: logoutStatus ?? this.logoutStatus,
      language: language ?? this.language,

      //
      user: user ?? this.user,
      token: token ?? this.token,
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      retypePassword: retypePassword ?? this.retypePassword,
      name: name ?? this.name,
      phone: phone ?? this.phone,

      city: city ?? this.city,
      location: location ?? this.location,

      //

      message: message ?? this.message,
      formStatus: formStatus ?? this.formStatus,
      //
      companyname: companyname ?? this.companyname,
      currentFiscalYearCode:
          currentFiscalYearCode ?? this.currentFiscalYearCode,
      //
      currencys: currencys ?? this.currencys,
      selectedcurrency: selectedcurrency ?? this.selectedcurrency,
    );
  }

  @override
  List<Object?> get props => [
        islogedin,
        logoutStatus,
        language,
        //
        user,
        token,
        id,
        email,
        password,
        retypePassword,
        name,
        phone,

        city,
        location,

        message,
        formStatus,
        //
        companyname,
        currentFiscalYearCode,
        //
        currencys,
        selectedcurrency,
      ];
}
