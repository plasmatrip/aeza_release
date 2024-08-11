import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 0)
class Settings extends HiveObject {
  @HiveField(0)
  bool showOnboarding;

  @HiveField(1)
  String termsOfUseUri;

  @HiveField(2)
  String privacyPolicyUri;

  @HiveField(3)
  String applicationInformationUri;

  @HiveField(4)
  String appDir;

  Settings({
    required this.showOnboarding,
    required this.termsOfUseUri,
    required this.privacyPolicyUri,
    required this.applicationInformationUri,
    required this.appDir,
  });
}
