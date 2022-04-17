# Two Books

A books app with a Collection page and Details page using https://thomaxxl.pythonanywhere.com API. Built with Flutter.

## API
The api follows the Json:API standard. The Japx package is used to flatten complex json objects and relationships into simple Map objects. The api respository methods that fetch data will pass query params to include relationships and use Japx.decode to flattern those relationships before passing them into the fromJson model methods. For the scope of this project, the repository only manages one data source (the api above). To future-proof is, a reposirory wrapper could be implemented and used from the BLoC classes to get data from different sources.

## Streaming Data 
The application uses the rxdart package to manage streams and behavior subjects. The general workflow creates a BehaviorSubject, a method to update that subject (typicaly from a repository response), handles disposing, and creates a bloc variable outside of the class to expose it to the UI. We can then use initState and refresh actions to load our data and listen for changes in a StreamBuilder, which will update the UI on different response states. 

## UI/UX
The UI uses the Flex Color Scheme package for easy themeing. Style defaults are used in all but a couple places. This also allows the app to easily handle device settings for light/dark mode. The trasition between the Books and Book Details pages is done with a hero widget. More time could be put into animating this transition. A scroll to top FAB apears as the user scrolls down the list of books to allow them to return to the top easier. And an info icon in the AppBar opens an About Dialog links to the GitHub repository and displays package licenses. Both the books page and the book details page allow a user to pull down to refresh the data on the page. There is currently no splash screen.

## Notes on Searching
The search input on the top of the books page filters the list of books displayed. It currently only filters based on Book Title and Author name, as those are the only two fields shown on that screen. This could be extended to other fields in the future but I'd want to add an element to shows matched fields to the user for more clarity. Filtering is done by the UI on the entire books list. The Api did not support advanced filtering options on multiple relationships in a way that I'd expect from a the JSON:API standards (that I could find) that would allow the server to handle it. If the dataset were a lot bigger we could move filtering to the server as needed at the cost of more requests. This is definitely not needed at this point in the project.

## Error Handling
Error handling is currently very basic but works well. It successfully captures an issue returning data to the UI and displays a generic message to the user in a card. We could add Dio interceptors to log specific errors in debug environments, communicate connection vs server issues, etc. Cards could be replaced with snackbars or other widgets based on design choices. But again, it currently gets the job done!

## Configuration
No additional deployment or environment configurations have been created yet. iOS and Android setups have been left at their defaults.
