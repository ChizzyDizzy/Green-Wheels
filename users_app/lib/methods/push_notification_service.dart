import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;
import 'package:provider/provider.dart';
import '../appInfo/app_info.dart';
import '../global/global_var.dart';


///This PushNotificationService only you have to update with below code for new FCM Cloud Messaging V1 API
class PushNotificationService
{
  static Future<String> getAccessToken() async
  {
    final serviceAccountJson =
    {
      "type": "service_account",
      "project_id": "green-wheels-2aab0",
      "private_key_id": "1b706e6efa6ff29d5d7d2465ebdb3716e7a7fa31",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDaVwwnyuOs/dvp\nAxdXPt14Ul/SqOxHkZXgJ+NRBZT3Upvj2UABMC4l1C5x/LJeiir2ftyixJ5XC3/5\ntCAeQ/eSilAF4ox5p6WPiPJHdY+W5E+QkSzOYDdY6jrAKg9OUPkH7sDX0VvcCjYg\nDlwEH0wgFn/dw3850aZek4hTQlljM2NWmVKB3s6UboUaEC88LrlWjySLkp0F42Pk\n6CREs+OL9OQKEgwhngjNAz0BFR2vc+HRBSzWQfDwXUyunfZhxdkEwbhAe2+ZIw2f\nt+kcV6SjGw8YQbdC6dXXxdjwiqvFceEGXdxJna8j+meRlvakh2fu70vywh2VhqM+\n81u8O+Q9AgMBAAECggEAD2AXdIrESPizN6/LHHxcm8mUFSqK09+r5nGYpCpYrV9k\nOjiOWhTIbEtl51QDQ9jrIgdPavF5enK8FQAfly1z9udO+OMemuLUK+h+aO/5DIgZ\nzEMLwXz+6xIUGg5Od8QIH7DPrYwln4E+lTgGymBhjgygtKPPECDGbq9EjCNGVk/Q\nkq6yxq2OtwTt4uaj9eLF88xdPDi6NiZXQJC50RWlzBqS60nBZp/tVWJYGjmC9aBa\n2YTE2yGQoS3+86es8vc4lFkq9V6rINFhyogmcpsiFXfKjzUZ7kqdI7ab0PavtOP2\n5ZHU5iyRgiwHxrId36yV1LSH+FWRxRf118GxT2fCRwKBgQDxdKZJ+09fS8rQnEYs\nhzRfclQA3NbcuxH+/9GQvAVZStz7FuQiAiW26z+slD5UdFAsoIFj+amBgyqCV5n8\nl3FRm38tTc7XoRbyz0roTqbY2bUYVAnnvMP/jTdQ7mob4eswOGQOwGeBlcjDnW9/\nXXwy+Dn0jhyn4AqhWOlxREFEewKBgQDnffHj+ju5UA14+yOPNktVxlrBc5iYMqpk\nV2buiCMR9u6/585gRQt/Ql4iHUrDt0fdKrw9m9WKkdl2vNMOk3Tfph35ha8As6rj\nAwCSS89emXV+f6zlp50iT6h9Y79A5w0IMkT+qaPOHPf7V7/U2A2+Df1lSsBXYZ7C\nW2iCU08opwKBgQCghQ0758/nqaqGry3T0nrV7Vq9TBOnoNIg9Y8rqmPf7e4lGx3F\nIipShejJ4a/iU4UtdfMvNL4ktL+g8X4Ut9WFDFwrESwunBB2karZ79fqGCnVp6EC\nJ7MhhI8+xZFTQgkqAIM8b1sggiR7L4H9aXf1JqLY21VfoYlPpJ1lSJwfWwKBgQC5\niLnMTIx9k+mYY0A20f9DOf0XOzy8Dy99yIdY+oeRKGZmLLW9dtkmH90uXmfDwSu5\n2TyR7EoUC51Niz1lW026ynsPt9NxLo7x70AQAO6tFTWUM2QxlEteapXSGZX5wLUz\nMocVzITa92DRc5zuTFOHVdMX0feikT0a7QQwH/E71QKBgQCydwEXYJ/q9R+BLUN/\nMPmr+Z8i07CC3Q+RCjiBRAAKhyPQYOsKIy5W8Rm5Seq4mEtRajI3Pm/LAuanyRZ5\nqLoSp/L1M8LONHlFh7K2IaX6AGq5ePiOFL3ozG3pareT9P3fh8siYZEL8WoukyLf\ngKfX7yPLRWBH2ydRTW654eWkig==\n-----END PRIVATE KEY-----\n",
      "client_email": "green-wheels-2024@green-wheels-2aab0.iam.gserviceaccount.com",
      "client_id": "106630944460431349784",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/green-wheels-2024%40green-wheels-2aab0.iam.gserviceaccount.com",
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
    String endpointFirebaseCloudMessaging = 'https://fcm.googleapis.com/v1/projects/green-wheels-2aab0/messages:send';

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