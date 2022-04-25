

class validator{
  String? nameValidator(String value){
    if (value=="") {
      return 'Please enter valide Name';
    }
    return null;
  }

  String? emailValidator(String value){
    if (!value.contains("@") || value.isEmpty || !value.contains(".")) {
      return 'Please enter valid E-mail';
    }
    return null;
  }

  String? passwordlValidator(String value){
    if (!value.contains("@") || value.isEmpty || !value.contains(".")) {
      return 'Please enter valid E-mail';
    }
    return null;
  }

  String? confirm_pass_Validator(String value,String password){
    if (password!=value) {
      return 'Passwords are not much';
    }
    return null;
  }
}