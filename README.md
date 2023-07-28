# Unity iOS Save Media Plugin

>iOS Swift Unity plugin to save media into the photo library, at a specific Album.

### Motivation

I was looking for an up to date plugin based in Swift/Swift UI, but I did not found it, so that I decided to create one. I hope this can help other people.

### Reference

This plugin is a result of some questions from [this stackoverflow thread](https://stackoverflow.com/questions/28708846/how-to-save-image-to-custom-album), especially [this answer](https://stackoverflow.com/revisions/49843358/1)

### Specs

* Xcode 14.0
* Swift 5.7

## 💻 Supported platform

This plugin is available only for Unity iOS and Swift UI. If you can help developing an Android version, it will be appreciated.

## 🚀 Ho to install

Extract and place the content of the latest release into Unity Plugins/iOS folder.

Plugins folder:
```
Assets/Plugins/iOS
```

## ☕ How to use

Call the following code in any script you want.

To save an image:
```
SaveImage(string imageNameWithExtension, string albumName, OnSuccess onSuccess, OnError onError)
```

To save a video:
```
SaveVideo(string videoNameWithExtension, string albumName, OnSuccess onSuccess, OnError onError)
```
If you have any doubt, refer to this [sample project](https://github.com/dinhonms/Lab-Unity-App)

### Troubleshooting

Disable bitcode and make a new build in order to sove this problem: 
```
error build: '.../Save Media Plugin/Frameworks/Plugins/iOS/SaveMediaToGallery.framework/SaveMediaToGallery' does not contain bitcode. You must rebuild it with bitcode enabled (Xcode setting ENABLE_BITCODE), obtain an updated library from the vendor, or disable bitcode for this target. file '.../Save Media Plugin/Frameworks/Plugins/iOS/SaveMediaToGallery.framework/SaveMediaToGallery' for architecture arm64
```

<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/25248564/256626217-cba333c4-b8ec-4cc3-b629-69f38f860724.png.png" alt="Troubleshooting">

## 📫 Contrubuting with an Android version

If you are interested in contributing to this project, follow the steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <branch_name>`.
3. Commit your changes: `git commit -m '<commit_message>'`
4. Push them: `git push origin <project_name> / <local>`
5. Criate a pull request.

Check out the GitHub Pull Request at [how to create a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

## 🤝 Contributors


## 📝 License

This project is licensed under: you can do whatever you want.
