import '../../../constants/text_strings.dart';
import '../model/profile_model.dart';

class ProfileController {
  final ProfileModel _model = ProfileModel(
    name: tProfileName,
    email: tProfileEmail,
  );

  ProfileModel get profileData => _model;
}
