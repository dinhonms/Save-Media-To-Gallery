# Save-Media-To-Gallery
iOS Swift Unity plugin to save media into the photo library, at a specific folder

#Specs
Xcode 14.0
Swift 5.7

#How to
Extract and play the content of the latest release into Unity Plugins/iOS folder.

Call the following in any script you want:
SaveImage(string imageNameWithExtension, string albumName, OnSuccess onSuccess, OnError onError)

Example:
SaveMedia.SaveImage(imageNameWithExtension: _imageName, _albumName, onSuccess: OnImageSavedSuccess, onError: OnImageSaveError);

If you have any doubt, refer to this sample project: https://github.com/dinhonms/Lab-Unity-App
#Reference
The plugin is a result of some questions from https://stackoverflow.com/questions/28708846/how-to-save-image-to-custom-album, especially this one https://stackoverflow.com/revisions/49843358/1

#Troubleshooting 
Disable bitcode and make a new build in order to sove this problem: 

error build: '.../Save Media Plugin/Frameworks/Plugins/iOS/SaveMediaToGallery.framework/SaveMediaToGallery' does not contain bitcode. You must rebuild it with bitcode enabled (Xcode setting ENABLE_BITCODE), obtain an updated library from the vendor, or disable bitcode for this target. file '.../Save Media Plugin/Frameworks/Plugins/iOS/SaveMediaToGallery.framework/SaveMediaToGallery' for architecture arm64

![Screen Shot 2023-07-27 at 15 06 24](https://github.com/dinhonms/Save-Media-To-Gallery/assets/25248564/cba333c4-b8ec-4cc3-b629-69f38f860724)
