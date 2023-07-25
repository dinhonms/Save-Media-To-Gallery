//
//  ImageSaver.swift
//  SaveMediaToGallery
//
//  Created by Nonato Sousa on 24/07/23.
//

import UIKit

class ImageSaver: NSObject{
    
    public func saveToPhotoAlbum(imageName: String){
        guard let image = getSavedImage(imageName: imageName) else {
            print("Image \(imageName) not found!")
            
            return
        }
        
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ iamge: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
        print("Saved successfully!")
    }
    
    func getImageFromPath(imagePath: String) -> UIImage{
        var path = "file://" + imagePath
        print("Image Path: \(path)")
        
        if FileManager.default.fileExists(atPath: imagePath) {
            let url = NSURL(string: path)
            
            let data = NSData(contentsOf: url! as URL)
            return UIImage(data: data! as Data)!
        }
        
        else{
            print("File doesn't exist!")
        }
            
        
        return UIImage()
    }
    
    func saveImageToDocuments(imageName: String, image: UIImage) -> Bool {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("\(imageName).png")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func getSavedImage(imageName: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(imageName).path)
        }
        return nil
    }
}
