import 'package:flutter/material.dart';

class NetworkRepository {
  static NetworkRepository _networkRepository = NetworkRepository._internal();

  factory NetworkRepository() {
    return _networkRepository;
  }
  NetworkRepository._internal();

  FocusNode searchFocus = new FocusNode();

  // StreamController gameDetailStream = new StreamController
  //     .broadcast(); // for stream builder - to add data in stramCiontroller

//   userLogin(context, authUserData) async {
//     try {
//       Map authUserResponse = await NetworkDioHttp.postDioHttpMethod(
//         context: context,
//         url: '${AppConstants.apiEndPoint}${AppConstants.login}',
//         data: authUserData,
//       );
//       return checkResponseWith500(authUserResponse, context);
//     } catch (e) {}
//   }

//   setSeats(context, seatsData) async {
//     try {
//       Map response = await NetworkDioHttp.putDioHttpMethod(
//         context: context,
//         url: '${AppConstants.apiEndPoint}${AppConstants.setSeats}',
//         data: seatsData,
//       );
//       return checkResponse(response, context);
//     } catch (e) {}
//   }

//   leaveGame(context, gameID) async {
//     try {
//       Map response = await NetworkDioHttp.deleteDioHttpMethod(
//         context: context,
//         url: '${AppConstants.apiEndPoint}${AppConstants.leaveGame}/$gameID',
//       );

//       return checkResponse(response, context);
//     } catch (e) {}
//   }

//   getDashboardNotification({context}) async {
//     try {
//       Map response = await NetworkDioHttp.getDioHttpMethod(
//         context: context,
//         url: '${AppConstants.apiEndPoint}${AppConstants.getDashboard}',
//       );
//       return checkResponse(response, context);
//     } catch (e) {}
//   }

  void checkResponse(dynamic response, BuildContext context) {
    if (response["error_description"] == null) {
      if (response['body']['statusCode'] == 200 ||
          response['body']['statusCode'] == "200") {
        return response['body'];
      } else if (response['body']['StatusCode'] == 500 ||
          response['body']['StatusCode'] == "500") {
        showErrorDialog(context);
      } else {
        showErrorDialog(context);
      }
    } else {
      showErrorDialog(context);
    }
  }

  void checkResponseWith500(var response, BuildContext context) {
    print(" 500 $response");
    if (response["error_description"] == null ||
        response["error_description"] == 'null') {
      if (response['body']['statusCode'] == 200 ||
          response['body']['statusCode'] == "200") {
        return response['body'];
      } else if (response['body']['StatusCode'] == 500 ||
          response['body']['StatusCode'] == "500") {
        return response['body'];
      } else {
        showErrorDialog(context);
      }
    } else {
      showErrorDialog(context);
    }
  }

  void showErrorDialog(BuildContext context) {
    print("Set error dialog");
    // showDialog(
    //   context: context,
    //   builder: (context) => GlobalErrorPopup(),
    // );
  }
}
