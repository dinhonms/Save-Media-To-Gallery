//
//  UnityBridge.swift
//  SaveMediaToGallery
//
//  Created by Nonato Sousa on 24/07/23.
//

import Foundation

@_cdecl("saveImage")
public func saveImage(imageNameWithExtension: UnsafePointer<CChar>, albumName: UnsafePointer<CChar>){
    MediaSaver.shared.saveImageToAlbum(albumName: Helper.getSafeString(albumName), imageNameWithExtension: Helper.getSafeString(imageNameWithExtension))
}

@_cdecl("asdf")
public func saveVideo(videoNameWithExtension: UnsafePointer<CChar>, albumName: UnsafePointer<CChar>){
    MediaSaver.shared.saveVideoToAlbum(albumName: Helper.getSafeString(albumName), videoPath: URL(string: Helper.getSavedVideo(videoNameWithExtension: Helper.getSafeString(videoNameWithExtension))!)!)
}
