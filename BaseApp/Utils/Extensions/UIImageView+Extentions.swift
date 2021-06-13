//
//  UIImageView+Extentions.swift
//  DilanGoDriver
//
//  Created by iMac on 12/03/21.
//

import Foundation
import SDWebImage
extension UIImageView {
    func getImage(url: String, placeholderImage:  UIImage?) {
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: URL(string: url), placeholderImage:  placeholderImage, options: SDWebImageOptions(rawValue: 0), completed: { image, error, cacheType, imageURL in
            if error == nil {
                self.image = image
                self.sd_imageIndicator = nil
            }else {
                self.sd_imageIndicator = nil
            }
        })
    }
}
extension UIImage {

    public static func loadFrom(url: URL, completion: @escaping (_ image: UIImage?) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

}
