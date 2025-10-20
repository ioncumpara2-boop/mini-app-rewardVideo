import 'dart:js' as js;
import 'dart:html' as html;

class TelegramService {
  static final TelegramService _instance = TelegramService._internal();
  factory TelegramService() => _instance;
  TelegramService._internal();

  bool get isAvailable => _isTelegramWebAppAvailable();
  
  bool _isTelegramWebAppAvailable() {
    try {
      return js.context.hasProperty('Telegram') &&
          js.context['Telegram'].hasProperty('WebApp');
    } catch (e) {
      return false;
    }
  }

  void ready() {
    if (isAvailable) {
      try {
        js.context.callMethod('eval', ['Telegram.WebApp.ready();']);
      } catch (e) {
        print('Error calling Telegram.WebApp.ready(): $e');
      }
    }
  }

  void expand() {
    if (isAvailable) {
      try {
        js.context.callMethod('eval', ['Telegram.WebApp.expand();']);
      } catch (e) {
        print('Error expanding Telegram WebApp: $e');
      }
    }
  }

  void enableClosingConfirmation() {
    if (isAvailable) {
      try {
        js.context.callMethod('eval', ['Telegram.WebApp.enableClosingConfirmation();']);
      } catch (e) {
        print('Error enabling closing confirmation: $e');
      }
    }
  }

  String? getUserId() {
    if (!isAvailable) return null;
    try {
      var user = js.context.callMethod('eval', ['Telegram.WebApp.initDataUnsafe.user']);
      if (user != null) {
        return user['id']?.toString();
      }
    } catch (e) {
      print('Error getting user ID: $e');
    }
    return null;
  }

  String? getUsername() {
    if (!isAvailable) return null;
    try {
      var user = js.context.callMethod('eval', ['Telegram.WebApp.initDataUnsafe.user']);
      if (user != null) {
        return user['username']?.toString() ?? user['first_name']?.toString();
      }
    } catch (e) {
      print('Error getting username: $e');
    }
    return null;
  }

  String? getFirstName() {
    if (!isAvailable) return null;
    try {
      var user = js.context.callMethod('eval', ['Telegram.WebApp.initDataUnsafe.user']);
      if (user != null) {
        return user['first_name']?.toString();
      }
    } catch (e) {
      print('Error getting first name: $e');
    }
    return null;
  }

  void setBackgroundColor(String color) {
    if (isAvailable) {
      try {
        js.context.callMethod('eval', ['Telegram.WebApp.setBackgroundColor("$color");']);
      } catch (e) {
        print('Error setting background color: $e');
      }
    }
  }

  void setHeaderColor(String color) {
    if (isAvailable) {
      try {
        js.context.callMethod('eval', ['Telegram.WebApp.setHeaderColor("$color");']);
      } catch (e) {
        print('Error setting header color: $e');
      }
    }
  }

  void showAlert(String message) {
    if (isAvailable) {
      try {
        js.context.callMethod('eval', ['Telegram.WebApp.showAlert("$message");']);
      } catch (e) {
        print('Error showing alert: $e');
      }
    }
  }

  void hapticFeedback({String type = 'medium'}) {
    if (isAvailable) {
      try {
        js.context.callMethod('eval', ['Telegram.WebApp.HapticFeedback.impactOccurred("$type");']);
      } catch (e) {
        print('Error triggering haptic feedback: $e');
      }
    }
  }

  void close() {
    if (isAvailable) {
      try {
        js.context.callMethod('eval', ['Telegram.WebApp.close();']);
      } catch (e) {
        print('Error closing Telegram WebApp: $e');
      }
    }
  }

  Map<String, dynamic> getThemeParams() {
    if (!isAvailable) return {};
    try {
      var themeParams = js.context.callMethod('eval', ['Telegram.WebApp.themeParams']);
      return {
        'bg_color': themeParams['bg_color'] ?? '#1a1a2e',
        'text_color': themeParams['text_color'] ?? '#ffffff',
        'hint_color': themeParams['hint_color'] ?? '#aaaaaa',
        'link_color': themeParams['link_color'] ?? '#8774e1',
        'button_color': themeParams['button_color'] ?? '#8774e1',
        'button_text_color': themeParams['button_text_color'] ?? '#ffffff',
      };
    } catch (e) {
      print('Error getting theme params: $e');
      return {};
    }
  }
}

