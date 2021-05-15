# flutter_app

A new Flutter application.

## Demo 9



The objective of this demo is to:
- Create a login screen
- Once logged in, show catalog having list of novels.
- Cart icon is there on app bar to navigate to my cart
- Add button is there to add a novel to purchase
- Once redirected to cart, show list of novels added in cart
- Click remove icon to remove novel from cart.
- Removed novel should be reflected in catalog page, again having add button

**ChangeNotifer** corresponds to Observer, which notifies the listner on change.
**ChangeNotifierProvider** provides instance of ChangeNotifier to its decendents. Placed above widget that needs to access it.
**Consumer** helps in start using the object provided via ChangeNotifier to the Provider down to widget.



#### App design ####
![picture alt](https://raw.githubusercontent.com/HimanshuSharma13/Flutter/feature_d9_provider_package/screens/welcome.png "App design screens")
![picture alt](https://raw.githubusercontent.com/HimanshuSharma13/Flutter/feature_d9_provider_package/screens/catalog.png "App design screens")
![picture alt](https://raw.githubusercontent.com/HimanshuSharma13/Flutter/feature_d9_provider_package/screens/cart.png "App design screens")


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view 
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

- [Icons made by Freepik](https://www.freepik.com)
 -[from www.flaticon.com](https://www.flaticon.com/)
