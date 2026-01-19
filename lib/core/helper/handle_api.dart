class HandleApi {
  static bool isSuccess(dynamic response) {
    return response != null &&
        response.statusCode != null &&
        response.statusCode == 200;
  }

  static String parseErrors(
    dynamic responseData, {
    String defaultMessage = "خطأ",
  }) {
    if (responseData != null && responseData['errors'] != null) {
      final Map<String, dynamic> errors =
          responseData['errors'] as Map<String, dynamic>;
      final List<String> messages = [];

      errors.forEach((key, value) {
        if (value is List) {
          for (var msg in value) {
            messages.add(msg.toString());
          }
        }
      });

      if (messages.isNotEmpty) {
        return messages.join("\n");
      }
    }
    return defaultMessage;
  }
}
