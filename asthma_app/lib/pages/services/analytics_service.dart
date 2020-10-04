import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();
  FirebaseAnalyticsObserver getAnalyticsObserver() => FirebaseAnalyticsObserver(analytics: _analytics);

  Future setUserProperties({@required String user_email}) async {
    await _analytics.setUserProperty(name: "email", value: user_email);

  }

  Future setUserPropertiesTreatment({String treatment}) async {
    await _analytics.setUserProperty(name: "Treatment", value: treatment);
  }

  Future<void> logForm1Event({String name,String q1, String q2, String q3, String q4}) async {
    await _analytics.logEvent(
      name: 'form1_submission',
      parameters: <String, dynamic>{
        'name:' :name,
        'Short_of_breath':  q1,
        'Dust': q2,
        'Frustration': q3,
        'Coughing': q4,
      },
    );
    print("set event form submitted");
  }
  Future<void> logForm2Event({String name, String q1, String q2, String q3, String q4}) async {
    await _analytics.logEvent(
      name: 'form2_submission',
      parameters: <String, dynamic>{
        'Name': name,
        'Stomach_pains':  q1,
        'Phlegm_production': q2,
        'Tired': q3,
        'Control': q4,
      },
    );
    print("set event form 2 submitted");
  }
  Future<void> logForm3Event({String name,String q1, String q2, String q3, String q4}) async {
    await _analytics.logEvent(
      name: 'form3_submission',
      parameters: <String, dynamic>{
        'name': name,
        'Stomach_pains':  q1,
        'Phlegm_production': q2,
        'Tired': q3,
        'Control': q4,
      },
    );
    print("set event form 2 submitted");
  }


}

