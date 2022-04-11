# two_books

A books app with a Collection page (index) and Details page using https://thomaxxl.pythonanywhere.com API. Built with Flutter.
## Packages

The api follows the Json:API standard. The https://pub.dev/packages/japx package is used to flatten complex json objects and relationships into simple Map<String, dynamic> objects. The api respository methods that fetch data will include relationships and use Japx.decode to flattern those relationships before passing them into 
the fromJson model methods.

Dio


## Structure


## Future Considerations

Testing
Environments
Data Sources - Repository wrapper and subclasses for api/db/etc.
Dio and request logging and interceptors
UI/UX/Branding
Logging for debug environements
Navigation in app bar
About Dialog
Collection Page
Details Page
Search function
Theme
Splash Screen
Dependency Injection
Add pull to refresh