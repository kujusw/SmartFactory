import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dependencies/dependencies.dart';

part 'language_notifier.g.dart';

@riverpod
class LanguageNotifier extends _$LanguageNotifier {
  @override
  FutureOr<Locale?> build() async {
    final language = await ref.read(languageRepositoryProvider).getLanguage();
    if (language != null) return Locale(language);
    return null;
  }

  Future<void> getLanguage() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final language = await ref.read(languageRepositoryProvider).getLanguage();
      return language != null ? Locale(language) : null;
    });
  }

  Future<void> setLanguage(String language) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(languageRepositoryProvider).setLanguage(language);
      return Locale(language);
    });
  }
}
