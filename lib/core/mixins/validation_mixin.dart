mixin ValidationMixin {
  String? validateNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? validateZipCode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Zip code is required';
    }
    if (value.length < 5) {
      return 'Zip code must be at least 5 digits';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    if (value.length < 10) {
      return 'Phone number must be at least 10 digits';
    }
    return null;
  }
}
