// 用于String替换掉Html元素的分类
extension EmailExtension on String {
  bool isValidEmail() {
    // 正则表达式用于匹配电子邮件地址
    final RegExp emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    return emailRegExp.hasMatch(this);
  }
}

extension PasswordExtension on String {
  bool isPasswordValid(String password) {
    // 检查密码长度是否至少为8个字符
    if (password.length < 8) {
      return false;
    }

    // 定义正则表达式来检查密码中是否包含大写字母、小写字母、数字和特殊字符
    RegExp upperCaseRegex = RegExp(r'[A-Z]');
    RegExp lowerCaseRegex = RegExp(r'[a-z]');
    RegExp digitRegex = RegExp(r'[0-9]');
    RegExp specialCharRegex = RegExp(r'[!@#\$%^&*()]');

    // 使用正则表达式检查密码
    if (!upperCaseRegex.hasMatch(password) ||
        !lowerCaseRegex.hasMatch(password) ||
        !digitRegex.hasMatch(password) ||
        !specialCharRegex.hasMatch(password)) {
      return false;
    }

    // 如果所有条件都符合，则返回true
    return true;
  }
}
