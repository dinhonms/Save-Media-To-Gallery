//
//  Helper.swift
//  SaveMediaToGallery
//
//  Created by Nonato Sousa on 26/07/23.
//

import Foundation
import UIKit

class Helper{
    
    static let fileManager = FileManager.default
    
    public static func getSavedImage(imageNameWithExtension: String) -> UIImage? {
        return UIImage(contentsOfFile: URL(fileURLWithPath: tryGetDocumentsDirectory().absoluteString).appendingPathComponent(imageNameWithExtension).path)
    }
    
    public static func getSavedVideo(videoNameWithExtension: String) -> String? {
        return URL(fileURLWithPath: tryGetDocumentsDirectory().absoluteString).appendingPathComponent(videoNameWithExtension).path
    }
    
    public static func getSafeString(_ value: UnsafePointer<CChar>) -> String{
        var tempString: String = "Empty Title"
        
        if let cTitle = String(validatingUTF8: value){
            tempString = cTitle
        }
        
        return tempString
    }
    
    private static func tryGetDocumentsDirectory() -> URL {
        if let documents = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return documents
        }
        
        return URL(string: "")!
    }
    
}
