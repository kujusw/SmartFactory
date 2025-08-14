import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dependencies/dependencies.dart';

class LanguageNotifier extends AutoDisposeAsyncNotifier<Locale?> {
  @override
  FutureOr<Locale?> build() => null;

  Future<void> getLanguage() async {
    final language = await ref.read(languageRepositoryProvider).getLanguage();
    if (language != null) state = AsyncValue.data(Locale(language));
  }

  Future<void> setLanguage(String language) async {
    state = await AsyncValue.guard(() async {
      await ref.read(languageRepositoryProvider).setLanguage(language);
      return Locale(language);
    });
  }
}

final languageNotifierProvider = AsyncNotifierProvider.autoDispose<LanguageNotifier, Locale?>(
  LanguageNotifier.new,
);
