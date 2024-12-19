// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:amwal/core/services/auth.dart';
import 'package:amwal/core/utils/formstatus.dart';
import 'package:amwal/core/utils/prefrences.dart';
import 'package:amwal/model/user.dart';
import 'package:amwal/model/usermodel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'enter_event.dart';
part 'enter_state.dart';

class EnterBloc extends Bloc<EnterEvent, EnterState> {
  EnterBloc() : super(const EnterState()) {
    on<Getuser>((event, emit) async {
      String? api = Preferences.getAPI();
      if (api!.isEmpty) {
        emit(
          state.copyWith(
              message: "login failed",
              formStatus: SubmissionFailed("login failed"),
              islogedin: "false"),
        );
        print(state.formStatus);
      } else {
        print("getuser");
        String? useremail = Preferences.getemail();
        String? userpassword = Preferences.getpassword();
        print("-------------------");
        print(useremail);
        print(userpassword);
        print("-------------------");
        emit(state.copyWith(
          formStatus: FormSubmitting(),
        ));

        http.Response response = await Auth.login(useremail!, userpassword!);
        var responsemap = await jsonDecode(response.body);
        print("message==${state.message}");
        print("*********");
        print(responsemap);
        print("statusCode==${response.statusCode}");
        print("*********");
        if (response.statusCode == 200) {
          emit(
            state.copyWith(
              user: UserModel.fromJson(responsemap['data']?['user']),
              companyname: responsemap['data']?['company_name'],
              currentFiscalYearCode: responsemap['data']
                  ?['CurrentFiscalYearCode'],
              token: responsemap['data']?['token'],
              message: responsemap['message'],
              formStatus: SubmissionSuccess(),
              islogedin: "true",
            ),
          );
          Preferences.savetoken(responsemap['data']?['token']);
          print("token:${responsemap['data']?['token']}");
          print("user:${state.user}");

          Preferences.saveemail(state.email);
          Preferences.savepassword(state.password);

          print(state.formStatus);
        } else {
          emit(
            state.copyWith(
                formStatus: SubmissionFailed(state.message),
                message: responsemap['message'],
                islogedin: "false"),
          );
          print(state.formStatus);
        }
        print("state.user");
        print(state.user);
      }
    });
    //

    //
    on<LanguageChanged>((event, emit) async {
      emit(
        state.copyWith(
          language: event.language,
        ),
      );
    });
    //

    on<Bottomshow>((event, emit) async {
      emit(
        state.copyWith(
          bottom: event.bottom,
        ),
      );
    });
    //
    on<RegisterBottomshow>((event, emit) async {
      print(" RegisterBottomshow${event.bottom}");

      emit(
        state.copyWith(
          registerbottom: event.bottom,
        ),
      );
    });
    //

    on<LoginEmailChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        email: event.email,
      ));
    });
    on<LoginPasswordChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        password: event.password,
      ));
    });
    on<LoginReTypePasswordChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        retypePassword: event.retypePassword,
      ));
    });
    on<LoginNameChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        name: event.name,
      ));
    });
    on<LoginNumberChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        phone: event.number,
      ));
    });

    on<CityChanged>((event, emit) async {
      emit(state.copyWith(
        city: event.city,
      ));
    });

    //
    on<LoginSubmitted>((event, emit) async {
      emit(
        state.copyWith(
            formStatus: FormSubmitting(),
            email: state.email,
            password: state.password),
      );
      print("========");
      print(state.email);
      print(state.password);
      String? api = Preferences.getAPI();
      if (api!.isEmpty) {
        emit(
          state.copyWith(
              message: "login failed",
              formStatus: SubmissionFailed(state.message),
              islogedin: "false"),
        );
        print(state.formStatus);
      } else {
        print('Auth.login');
        http.Response response = await Auth.login(state.email, state.password);
        var responsemap = await jsonDecode(response.body);
        print("message==${state.message}");
        print("*********");
        print(responsemap);
        print("statusCode==${response.statusCode}");
        print("*********");
        if (response.statusCode == 200) {
          emit(
            state.copyWith(
              user: UserModel.fromJson(responsemap['data']?['user']),
              companyname: responsemap['data']?['company_name'],
              currentFiscalYearCode: responsemap['data']
                  ?['CurrentFiscalYearCode'],
              token: responsemap['data']?['token'],
              message: responsemap['message'],
              formStatus: SubmissionSuccess(),
              islogedin: "true",
            ),
          );
          Preferences.savetoken(responsemap['data']?['token']);
          print("token:${responsemap['data']?['token']}");
          print("user:${state.user}");

          Preferences.saveemail(state.email);
          Preferences.savepassword(state.password);

          print(state.formStatus);
        } else {
          emit(
            state.copyWith(
                formStatus: SubmissionFailed(state.message),
                message: responsemap['message'],
                islogedin: "false"),
          );
          print(state.formStatus);
        }
      }
    });

    on<Logout>((event, emit) async {
      emit(
        state.copyWith(
          logoutStatus: FormSubmitting(),
        ),
      );
      http.Response response = await Auth.logout(state.token);
      Map responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        Preferences.clear();
        emit(
          state.copyWith(
              user: const User(
                guid: '',
                name: "",
                code: "",
                number: "",
                isAdmin: false,
              ),
              logoutStatus: SubmissionSuccess(),
              message: responsemap["message"],
              email: "",
              password: "",
              token: "",
              islogedin: "false"),
        );
      } else {
        emit(
          state.copyWith(
              message: responsemap["message"],
              logoutStatus: SubmissionFailed(state.message),
              islogedin: "false"),
        );
        print(state.logoutStatus);
      }
    });
  }
}
