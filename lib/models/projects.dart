import 'package:cloud_firestore/cloud_firestore.dart';

enum AppType {
  app,
  web
}
enum AppTypeTitle {
  mobile,
  web,
  desktop,
  api,
  library,
}


class Project {
  final String title;
  final String description;
 List imageUrls; // List of image URLs
  final String repoUrl;
   String ?hostedAppUrl;
  final DateTime? time;
  final AppType appType;
  final AppTypeTitle applicationTypeTitle;
  Project({
    required this.applicationTypeTitle,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.repoUrl,
    this.hostedAppUrl,
    this.time,
    required this.appType
  });





  // Convert Project object to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrls': imageUrls,
      'repoUrl': repoUrl,
      'hostedAppUrl': hostedAppUrl,
      'appType': getAppTypeAsString(appType),
      'time': DateTime.now(),
      'applicationTypeTitle': getAppTypeTitleAsString(applicationTypeTitle), 
    };
  }

  // Create a Project object from a Firestore document
  factory Project.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Project(
      applicationTypeTitle:
          getAppTypeTitleFromString(data['applicationTypeTitle']),
      appType: getAppTypeFromString(data['appType']),
      hostedAppUrl: data['hostedAppUrl'],
      title: data['title'],
      description: data['description'],
      imageUrls: 
          data['imageUrls'] , // Ensure it's a list of strings
      repoUrl: data['repoUrl'],
      time: (data['time'] as Timestamp?)?.toDate().toLocal(),
    );
  }
}


String getAppTypeAsString(AppType appType) {
  switch (appType) {
    case AppType.app:
      return "App";
    case AppType.web:
      return "Website";
    default:
      return "App";
  }
}

String getAppTypeTitleAsString(AppTypeTitle appType) {
  switch (appType) {
    case AppTypeTitle.mobile:
      return "Mobile Application";
    case AppTypeTitle.web:
      return "Web Application";
    case AppTypeTitle.desktop:
      return "Desktop Application";
    case AppTypeTitle.api:
      return "API";
    case AppTypeTitle.library:
      return "Library";
    default:
      return "Unknown Application Type";
  }
}

// Convert string to AppType enum
AppType getAppTypeFromString(String appType) {
  switch (appType) {
    case "App":
      return AppType.app;
    case "Website":
      return AppType.web;
    default:
      return AppType.app; // Default value
  }
}

// Convert string to AppTypeTitle enum
AppTypeTitle getAppTypeTitleFromString(String appTypeTitle) {
  switch (appTypeTitle) {
    case "Mobile Application":
      return AppTypeTitle.mobile;
    case "Web Application":
      return AppTypeTitle.web;
    case "Desktop Application":
      return AppTypeTitle.desktop;
    case "API":
      return AppTypeTitle.api;
    case "Library":
      return AppTypeTitle.library;
    default:
      return AppTypeTitle.mobile; // Default value
  }
}
