//
//  MediaSaver.swift
//  SaveMediaToGallery
//
//  Created by Nonato Sousa on 26/07/23.
//
import Photos
import UIKit

class MediaSaver: NSObject {
    
    static let shared = MediaSaver()
    
    private var assetCollection: PHAssetCollection!
    
    public var onSuccess: ((String) -> Void)?
    public var onError: ((String) -> Void)?
    
    private func checkAuthorizationWithHandler(albumName: String, completion: @escaping ((_ success: Bool) -> Void)) {
        if PHPhotoLibrary.authorizationStatus() == .notDetermined {
            PHPhotoLibrary.requestAuthorization({ (status) in
                self.checkAuthorizationWithHandler(albumName: albumName, completion: completion)
            })
        }
        else if PHPhotoLibrary.authorizationStatus() == .authorized {
            self.getOrCreateAlbum(albumName: albumName) { (success) in
                if success {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
        else {
            completion(false)
        }
    }
    
    private func getOrCreateAlbum(albumName: String, completion: @escaping ((_ success: Bool) -> Void)) {
        
        if let assetCollection = findAlbum(albumName: albumName) {
            // Album already exists
            self.assetCollection = assetCollection
            completion(true)
        } else {
            PHPhotoLibrary.shared().performChanges({
                PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: albumName)   // create an asset collection with the album name
            }) { success, error in
                if success {
                    self.assetCollection = self.findAlbum(albumName: albumName)
                    completion(true)
                } else {
                    // Unable to create album
                    completion(false)
                }
            }
        }
    }
    
    private func findAlbum(albumName: String) -> PHAssetCollection? {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", albumName)
        let collection = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
        
        if let _: AnyObject = collection.firstObject {
            return collection.firstObject
        }
        return nil
    }
    
    func saveImageToAlbum(albumName: String, imageNameWithExtension: String) {
        self.checkAuthorizationWithHandler(albumName: albumName) { (success) in
            if success, self.assetCollection != nil {
                
                guard let image = Helper.getSavedImage(imageNameWithExtension: imageNameWithExtension) else {
                    print("[NATIVE] Image \(imageNameWithExtension) not found!")
                    
                    return
                }
                
                PHPhotoLibrary.shared().performChanges({
                    let assetChangeRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
                    let assetPlaceHolder = assetChangeRequest.placeholderForCreatedAsset
                    if let albumChangeRequest = PHAssetCollectionChangeRequest(for: self.assetCollection) {
                        let enumeration: NSArray = [assetPlaceHolder!]
                        albumChangeRequest.addAssets(enumeration)
                    }
                    
                }, completionHandler: { (success, error) in
                    if success {
                        self.onSuccess?("[NATIVE] Image successfully saved to album \(albumName).");
                        print("[NATIVE] Image successfully saved to album \(albumName).")
                    } else {
                        self.onError?("[NATIVE] Error saving image to album \(albumName): \(error!.localizedDescription)");
                        print("[NATIVE] Error saving image to album \(albumName): \(error!.localizedDescription)")
                    }
                })
                
            }
        }
    }
    
    func saveVideoToAlbum(albumName: String, videoPath: URL) {
        
        self.checkAuthorizationWithHandler(albumName: albumName) { (success) in
            if success, self.assetCollection != nil {
                
                PHPhotoLibrary.shared().performChanges({
                    
                    if let assetChangeRequest = PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: videoPath) {
                        let assetPlaceHolder = assetChangeRequest.placeholderForCreatedAsset
                        if let albumChangeRequest = PHAssetCollectionChangeRequest(for: self.assetCollection) {
                            let enumeration: NSArray = [assetPlaceHolder!]
                            albumChangeRequest.addAssets(enumeration)
                        }
                    }
                }, completionHandler:  { (success, error) in
                    if success {
                        self.onSuccess?("[NATIVE] Video successfully saved to album \(albumName).")
                        print("[NATIVE] Video successfully saved to album \(albumName).")
                    } else {
                        self.onError?("Error saving video to album \(albumName): \(error!.localizedDescription)")
                        print("Error saving video to album \(albumName): \(error!.localizedDescription)")
                    }
                })
            }
        }
    }
}
