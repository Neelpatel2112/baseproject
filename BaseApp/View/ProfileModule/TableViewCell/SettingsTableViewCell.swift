//
//  SettingsTableViewCell.swift
//  DilanGoDriver
//
//  Created by iMac on 16/01/21.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var ViewBg: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        lblTitle.font = UIFont.Body_Bold
        ViewBg.borderWidth = 1
        ViewBg.borderColor = UIColor.APP_GradiantDarkBlue
        self.selectionStyle = .none
    }
    override func draw(_ rect: CGRect) {
        ViewBg.circleCorner = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
