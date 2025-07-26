abstract final class Validations {
  static String? requiredField(String? value) {
    return (value ?? '').isEmpty ? 'Required' : null;
  }
}
