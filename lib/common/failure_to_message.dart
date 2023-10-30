import 'package:bbt_kirov_app/core/error/failure.dart';

const serverFailureMessage = 'Server Failure';
const internetConnectionFailureMessage = 'Internet Connection Failure';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailureMessage;
    case InternetConnectionFailure:
      return internetConnectionFailureMessage;
    default:
      return 'Unexpected Error';
  }
}
