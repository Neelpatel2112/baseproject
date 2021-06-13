//
//  MyRideDetailsHeaderView.swift
//  DilanGoDriver
//
//  Created by iMac on 13/01/21.
//

import UIKit

class MyRideDetailsHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var imgProfile: UIImageView!    
    @IBOutlet weak var ViewStatus: UIView!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func draw(_ rect: CGRect) {
        imgProfile.circleCorner = true
        ViewStatus.circleCorner =  true
        lblName.font = UIFont.Body_Bold
        lblStatus.font = UIFont(name: AppFontName.Regular.rawValue, size: Global.shared.setCustomFontSize(size: 10))
    }
    
}
