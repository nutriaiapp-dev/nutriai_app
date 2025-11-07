import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:nutri_app/core/domain/notifiers/register_notifier.dart';

final registerProvider = StateNotifierProvider<RegisterNotifier, String?>((
  ref,
) {
  return RegisterNotifier(ref);
});
