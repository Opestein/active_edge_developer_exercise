import 'package:active_edge_developer_exercise/src/helper/form_validators.dart';

class CreateJobValidatorBloc with FormValidators {
  String singleInputValidator(String email) {
    return validateSingleInput(email) ? null : "This field is required";
  }
}

final createJobsValidatorBloc = CreateJobValidatorBloc();
