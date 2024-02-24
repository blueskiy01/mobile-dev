# Favorite Images

This project is designed to help me practice building a mobile app that allows users to create a personal gallery where they can upload images from their phone library or take new pictures and immediately add them to their collection.

## Requirements
- Flutter
- Dart
- Android Studio
- Xcode

## Getting Started
1. Clone the repository
2. Open the project in your preferred IDE
3. Run the app on an emulator 

### Features 

#### Image Picker
Appbar with an IconButton. When the user clicks on the button, they should see two options:

- Open the camera.
- Access the gallery.

The app works with iOS and Android devices. 
To achieve this functionality, the `image_picker` package is used.  
Additionally, the app handles cases where no images have been selected by displaying a "No images selected" message.

#### Granting access to the camera and gallery
By adding the necessary keys to the Info.plist file under the iOS folder, it grants access to the camera and gallery. 
Here's an example:

```xml
<key>NSCameraUsageDescription</key>
<string>This app requires access to the camera to take photos.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>This app requires access to the photo library to select photos.</string>
```

#### Image Gallery

- Add the selected image or taken picture to a GridList to display all the images in the user's collection.
- Implement the ability for the user to tap on an image and view the entire picture, providing a better user experience.
- Add the ability for the user to zoom in and out of the image, allowing them to see the image details more clearly.

### Screenshots

#### Credits
- [blueskiy](github.com/blueskiy01)

