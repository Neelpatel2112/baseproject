//
//  AppImagePciker.swift
//  DilanGoDriver
//
//  Created by iMac on 28/01/21.
//

import Foundation
import UIKit
import Photos
public protocol imagepickerDelegate: class {
    func didselect(imageName:String?,image:UIImage?)
}

class AppImagePicker:NSObject {
    
    private let pickercontroller            : UIImagePickerController
    private weak var presentViewcontroller  : UIViewController?
    private weak var delegate               : imagepickerDelegate?
     
    public init(presentViewcontroller:UIViewController,delegate:imagepickerDelegate){
        self.pickercontroller = UIImagePickerController()
        super.init()
        self.presentViewcontroller = presentViewcontroller
        self.delegate = delegate
        self.pickercontroller.delegate = self
        self.pickercontroller.allowsEditing = true
        
    }
    
    public func action(type:UIImagePickerController.SourceType,title:String)-> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }
        return UIAlertAction(title: title, style: .default) { (_) in
            self.pickercontroller.sourceType = type
            self.presentViewcontroller?.present(self.pickercontroller, animated: true, completion: nil)
        }
    }
    public func present(souceView:UIView) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if let action = self.action(type: .camera, title: "Take photo") {
            alertController.addAction(action)
        }
        
        if let action = self.action(type: .photoLibrary, title: "Photo library") {
            alertController.addAction(action)
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.presentViewcontroller?.present(alertController, animated: true, completion: nil)
    }
    private func PickerController(controller:UIImagePickerController,didselec image: UIImage?,imageName:String?) {
        controller.dismiss(animated:true, completion: nil)
       
        self.delegate?.didselect(imageName: imageName, image: image)
    }
}
extension AppImagePicker : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //self.PickerController(controller: picker, didselec: nil, imageName: nil)
        picker.dismiss(animated: true, completion: nil)
    }
    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return 
        }
        guard let fileUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL else {
            return self.PickerController(controller: picker, didselec: image, imageName: nil)
            
        }
        self.PickerController(controller: picker, didselec: image, imageName: fileUrl.lastPathComponent)
    }
}
