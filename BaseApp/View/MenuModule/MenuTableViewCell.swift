//
//  MenuTableViewCell.swift
//  DilanGoRider
//
//  Created by iMac on 12/01/21.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
//    var menuitem:MenuModel? {
//        didSet {
//            lblTitle.text = menuitem?.Title.rawValue ?? ""
//            img.image = menuitem?.Title.Itemimage() ?? UIImage()
//        }
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        lblTitle.font = UIFont.H6_Head
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
