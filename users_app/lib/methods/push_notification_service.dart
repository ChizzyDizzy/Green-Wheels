import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;
import 'package:provider/provider.dart';
import '../appInfo/app_info.dart';
import '../global/global_var.dart';

///Updated in June 2024
///This PushNotificationService only you have to update with below code for new FCM Cloud Messaging V1 API
class PushNotificationService
{
  static Future<String> getAccessToken() async
  {
    final serviceAccountJson =
    {

        "type": "service_account",
        "project_id": "green-wheels-97a8a",
        "private_key_id": "3564f715b335d0df4f8203238a2375aa81ee387c",
        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCzz8HRPOZqCUTU\nZy2K2m6jiBZEn5DJiTqwJmZYEZLI6Dc+p2EQSchX/hivZmZTesxaM2QjL6P/Qzr2\nPnZYFCmfKxS/HtGqDqdx/6B2Pc2t/xfWTsAXuqY26ONWCoS4FjbH8E8TYjp8GpbI\nx+w4BWikE8VrnNAWOZc5V5zhq+gayQFD2ui/g7uP2wc/yBVdf4umH7O/KtJ/uikU\nwFkoo508a1FCVZDtxQM2rSJsinut/Gu3cpMu71f8WTFltOixM0JKFaHDyUIRYsBo\nJLU58jCH6JvQE3ii299DVRT7hSOJvoGTD4rrs7cT5v4TctR+gLa8wbaNMy1FXfev\noJh++ZJ1AgMBAAECggEAEWsMNuUj2ty3/q1aA4viUNQTeCVO5L724O5vVpOpOO4J\nv/d91xKWpjN2l7MfMXIBTrGQvznTtJwCH61wUFrvpzwIn/Tv0X3m6YueMyYMgRDn\ncbqiMApEJKiNsR2GusBoIRkdx95plPEMbzmyn8CiYNaLdr+zhpugkwzyJQg+jS2G\nxbf2DrrcSMwm9g77PkpcXnk5Ts1yc/txzEDYyE1NqoQx+L9G+xbWQuKGsvtNbFXe\nbljsX5kgZES/JAgh6lQDB4mnCvuFu3ZltzGikiu82WJQ5PAIN5ijPUPQnxRnz7X/\nt53gjutM0wqvksmGkFOHgPei6uQ8xN8h+B98CYrnQQKBgQDq1TUnS7vJUrsKroQa\nbDOkiN8B8CyFZPZ0sQUw0ucFlFSLElJpE8GdtvIuRx5Kp4FqLhqHggJHygaGAEzs\ntP5PxT8gYL3Z+v7EytPd3x+vL8L6ydycdorHqnRdfrbKauDKLcYNmc2TAFLAXney\nm9Po2kaZfEmrTpyM46LJEb2R1QKBgQDEBO1r2xh+a6RNC+9Y3hPiub+QcGHAUIBA\nKpsJpFiHSsigNEbUxLWJMoR40Dyxbt5qT5rqNI60UktvV3u0gvlk0RBjUc2e7ety\nH99RLtDZ5Fk7rbmlcpaJnlwYFs3eXj5giDRKvbZTkJ/4iAkM4eKLIKz/4+Iz1K9w\nWe99FT+uIQKBgQCsO/H/P0Gc2CvNGtBTHNcHr0d5AXF16OYGEiuPcq/0XKVhVu/Q\nl6fjB+I6ZPjnolF90hCtIIKRqq/8Kk5BMkJvuWiiU7ILJVckeOrJiTOQ5sPn8pP2\nwc7pwLAWPrDMZ3U1dDsVkJ/BWHRZGTBLdJUI7MbpHcpedYrGntKvDG7wfQKBgQCg\nHBI+BgEUyiGzGSuQoB0IFYbmmRUPO/H195cZohb5s1j6mpi8lExf21afRCA/Ifsk\nRQ+ZfAKQQaQCNygBQvYopifHqHrW9Sla17PWIPJQ+Bb3CyjXfih+Ek7REldn6fzz\nZm2oGxvBWCGCpMMXta4QzEji3yXWBkSi9aMLvX59YQKBgQCjBoVpZsxC7vH5ET6k\nc2ZRoN0mVpDzhXA2IXfR4pPlOkJRtvx3qgLSaALSjvjQqDG6LP99T5mLt3Kg+QRL\nMjpu/9LFmyOSW5XYc+MItOjl9wcXBDET66kgYh+4zNKtJNdrGl50PLUf3L5YXMmM\nMfuHV+duKGUUiIue2bql7BnyNg==\n-----END PRIVATE KEY-----\n",
        "client_email": "green-wheels-2024@green-wheels-97a8a.iam.gserviceaccount.com",
        "client_id": "113856047793050385773",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/green-wheels-2024%40green-wheels-97a8a.iam.gserviceaccount.com",
        "universe_domain": "googleapis.com"


    };

    List<String> scopes =
    [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    //get the access token
    auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
        client
    );

    client.close();

    return credentials.accessToken.data;
  }

  static sendNotificationToSelectedDriver(String deviceToken, BuildContext context, String tripID) async
  {
    String dropOffDestinationAddress = Provider.of<AppInfo>(context, listen: false).dropOffLocation!.placeName.toString();
    String pickUpAddress = Provider.of<AppInfo>(context, listen: false).pickUpLocation!.placeName.toString();

    final String serverAccessTokenKey = await getAccessToken() ; // Your FCM server access token key
    String endpointFirebaseCloudMessaging = 'https://fcm.googleapis.com/v1/projects/green-wheels-97a8a/messages:send';

    final Map<String, dynamic> message = {
      'message': {
        'token': deviceToken, // Token of the device you want to send the message/notification to
        'notification': {
          "title": "NET TRIP REQUEST from $userName",
          "body": "PickUp Location: $pickUpAddress \nDropOff Location: $dropOffDestinationAddress",
        },
        'data': {
          "tripID": tripID,
        },
      }
    };

    final http.Response response = await http.post(
      Uri.parse(endpointFirebaseCloudMessaging),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverAccessTokenKey',
      },
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      print('FCM message sent successfully');
    } else {
      print('Failed to send FCM message: ${response.statusCode}');
    }
  }
}