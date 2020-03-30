import 'package:Sufi_Circles/src/models/form_errors/FormErrorState.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'AuthFormModel.g.dart';

class AuthModel = _AuthModel with _$AuthModel;

abstract class _AuthModel with Store {
  final FormErrorState error = FormErrorState();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  bool userLoggedIn = false;

  @action
  void setEmail(String email) => this.email = email;

  @action
  void setPassword(String password) => this.password = password;

  @action
  void setConfirmPassword(String password) => this.confirmPassword = password;

  @action
  void setLoginStatus(bool loggedIn) => this.userLoggedIn = loggedIn;

  @computed
  bool get canLogin => !error.hasErrors;

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

  @action
  void validatePassword(String value) {
    error.password = isNull(value) || value.isEmpty ? 'Cannot be blank' : null;
  }

  @action
  void validateEmail(String value) {
    error.email = isEmail(value) ? null : 'Not a valid email';
  }

  @override
  void dispose() {
    for (final d in _disposers) d();
  }

  void validateAll() {
    validateEmail(this.email);
    validatePassword(this.password);
  }

  @computed
  Map<String, String> get authDetails => {"email": email, "password": password};

  @computed
  bool doesPasswordMatch() {
    return this.confirmPassword == this.password;
  }
}
