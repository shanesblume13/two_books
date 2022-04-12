# two_books

A books app with a Collection page (index) and Details page using https://thomaxxl.pythonanywhere.com API. Built with Flutter.
## Main Concepts

The api follows the Json:API standard. The https://pub.dev/packages/japx package is used to flatten complex json objects and relationships into simple Map<String, dynamic> objects. The api respository methods that fetch data will pass query params to include relationships and use Japx.decode to flattern those relationships before passing them into the fromJson model methods. This will help the responsibility of formatting the json into the repository/respositories.

Dio

Hero Animation

Scroll To Top

## Future Considerations

Comments
Clean up scroll to top
Pagination / Infinite Scroll w/ Api Calls
Search/Filter
About Dialog
Style Collection Page
Style Details Page
Add pull to refresh
Splash Screen
Loading animation
Error handling
Data Sources - Repository wrapper and subclasses for api/db/etc.
Person Super Class
Sorting
    Most Popular (readers)
    Recently Reviewed
    Date Published
    Title*
UI/UX/Branding
-Create books states class
-Dependency Injection
-Testing
-Environments
Dio and request logging and interceptors
