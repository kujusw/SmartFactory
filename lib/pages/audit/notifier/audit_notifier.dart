import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../http/audit.dart';
import '../../../models/audit_manager_model.dart';
import '../../login/notifier/login_notifier.dart';

final getAuditsPageProvider = StateProvider.autoDispose<int>((ref) {
  return 1;
});
final getAuditsPageTotalProvider = StateProvider.autoDispose<int>((ref) {
  return 1;
});
final getAuditsPageNumProvider = StateProvider.autoDispose<int>((ref) {
  return 30;
});

final getAuditsSortProvider = StateProvider.autoDispose<String>((ref) {
  return "desc";
});

final itemsAuditModelProvider = StateProvider.autoDispose<List<Audit>>((ref) {
  return [];
});

final getAuditsProvider = FutureProvider<List<Audit>>((ref) async {
  return getAudits(ref);
});

Future<List<Audit>> getAudits(FutureProviderRef<List<Audit>> ref) async {
  var audits = await AuditAPI.getAudits(
    parameter: {"page": ref.read(getAuditsPageProvider), "sort": ref.read(getAuditsSortProvider)},
    token: ref.read(loginProvider).data?.token,
    path: "v1/audit_logs",
  );
  ref.read(itemsAuditModelProvider.notifier).state = audits.data?.logs ?? [];
  ref.read(getAuditsPageTotalProvider.notifier).state = audits.data?.totalPages ?? 1;
  return audits.data?.logs ?? [];
}

//退出登录后 清空数据
void clearAuditProvider(WidgetRef ref) {
  ref.invalidate(itemsAuditModelProvider);
  ref.invalidate(getAuditsPageProvider);
  ref.invalidate(getAuditsPageTotalProvider);
  ref.invalidate(getAuditsPageNumProvider);
  ref.invalidate(getAuditsSortProvider);
}
