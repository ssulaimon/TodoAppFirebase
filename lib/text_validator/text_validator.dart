// validating email

String? textValidatoraEmail(String? value) {
  if (value == null) {
    return 'Email cannot be empty';
  } else if (value.isEmpty) {
    return 'Email cannot be empty';
  } else {
    return null;
  }
}
// validating password

String? textValidatorPassword(String? value) {
  if (value == null) {
    return 'Password cannot be empty';
  } else if (value.length < 5) {
    return 'Password lengt too short';
  } else if (value.isEmpty) {
  } else {
    return null;
  }
}

// validating name
String? textValidatorName(String? value) {
  if (value == null) {
    return 'Name cannot be empty';
  } else if (value.length < 3) {
    return 'Name lengt too short';
  } else if (value.isEmpty) {
  } else {
    return null;
  }
}
