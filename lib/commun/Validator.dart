class validator{
  static String? nameValidator(String value){
    if (value=="") {
      return 'Please enter valide Name';
    }
    return null;
  }

  static String? emailValidator(String value){
    if (!value.contains("@") || value.isEmpty || !value.contains(".")) {
      return 'Please enter valid E-mail';
    }
    return null;
  }

  static String? passwordlValidator(String value){
    if (value.length < 6) {
      return 'Please enter valid E-mail';
    }
    return null;
  }

  static String? confirm_pass_Validator(String value,String password){
    if (password!=value) {
      return 'Passwords are not much';
    }
    return null;
  }
}




