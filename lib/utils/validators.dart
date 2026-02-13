class Validators {
  Validators._(); // prevents instantiation

  /// Email Validator
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  /// Password Validator
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    // if (!RegExp(r'[A-Z]').hasMatch(value)) {
    //   return 'Password must contain at least one uppercase letter';
    // }

    // if (!RegExp(r'[a-z]').hasMatch(value)) {
    //   return 'Password must contain at least one lowercase letter';
    // }

    // if (!RegExp(r'\d').hasMatch(value)) {
    //   return 'Password must contain at least one number';
    // }

    // if (!RegExp(r'[!@#\$&*~%^()_\-+=<>?]').hasMatch(value)) {
    //   return 'Password must contain at least one special character';
    // }

    return null;
  }
}
