//
//  UnityBridge.swift
//  SaveMediaToGallery
//
//  Created by Nonato Sousa on 24/07/23.
//

import Foundation

@_cdecl("saveImage")
public func saveImage(imageNameWithExtension: UnsafePointer<CChar>, albumName: UnsafePointer<CChar>, onSuccessDelegate: @convention(c) @escaping (String) -> Void, onErrorDelegate: @convention(c) @escaping (String) -> Void){
    MediaSaver.shared.saveImageToAlbum(albumName: Helper.getSafeString(albumName), imageNameWithExtension: Helper.getSafeString(imageNameWithExtension))
    MediaSaver.shared.onSuccess = onSuccessDelegate
    MediaSaver.shared.onError = onErrorDelegate
}

@_cdecl("saveVideo")
public func saveVideo(videoNameWithExtension: UnsafePointer<CChar>, albumName: UnsafePointer<CChar>, onSuccessDelegate: @convention(c) @escaping (String) -> Void, onErrorDelegate: @convention(c) @escaping (String) -> Void){
    MediaSaver.shared.saveVideoToAlbum(albumName: Helper.getSafeString(albumName), videoPath: URL(string: Helper.getSavedVideo(videoNameWithExtension: Helper.getSafeString(videoNameWithExtension))!)!)
    MediaSaver.shared.onSuccess = onSuccessDelegate
    MediaSaver.shared.onError = onErrorDelegate
}


