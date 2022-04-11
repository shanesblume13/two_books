# two_books

A books app with a Collection page (index) and Details page using https://thomaxxl.pythonanywhere.com API. Built with Flutter.
## Main Concepts

The api follows the Json:API standard. The https://pub.dev/packages/japx package is used to flatten complex json objects and relationships into simple Map<String, dynamic> objects. The api respository methods that fetch data will pass query params to include relationships and use Japx.decode to flattern those relationships before passing them into the fromJson model methods. This will help the responsibility of formatting the json into the repository/respositories.

Dio

## Future Considerations

UI/UX/Branding
Navigation in app bar
About Dialog
Style Collection Page
Add Details Page
Add Search function
Add pull to refresh
Splash Screen
Dependency Injection
Testing
Environments
Data Sources - Repository wrapper and subclasses for api/db/etc.
Dio and request logging and interceptors
Logging for debug environements