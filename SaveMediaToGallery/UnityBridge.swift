//
//  UnityBridge.swift
//  SaveMediaToGallery
//
//  Created by Nonato Sousa on 24/07/23.
//

import Foundation

var imageSaver = ImageSaver()

@_cdecl("saveImage")
public func saveImage(imageName: UnsafePointer<CChar>){
    imageSaver.saveToPhotoAlbum(imageName: getSafeString(imageName))
}

func getSafeString(_ value: UnsafePointer<CChar>) -> String{
    var tempString: String = "Empty Title"
    
    if let cTitle = String(validatingUTF8: value){
        tempString = cTitle
    }
    
    return tempString
}

