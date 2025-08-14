/// 检查邮箱格式
bool kjIsEmail(String? input) {
  if (input == null || input.isEmpty) return false;
  // 邮箱正则
  String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  return RegExp(regexEmail).hasMatch(input);
}

/// 检查字符长度
bool kjCheckStringLength(String? input, int length) {
  if (input == null || input.isEmpty) return false;
  return input.length >= length;
}

double stringToDouble(String str) {
  try {
    double result = double.parse(str); // 尝试将字符串解析为double
    result = double.parse(result.toStringAsFixed(2)); // 将double四舍五入到小数点后两位
    return result;
  } catch (e) {
    print("Error: $e"); // 打印异常信息
    return 0.00; // 返回null表示转换失败
  }
}
