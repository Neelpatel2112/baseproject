//
//  CustomBannerView.swift
//  DilanGoRider
//
//  Created by iMac on 25/02/21.
//

import UIKit
import AAViewAnimator
class CustomBannerView: UIView {

    @IBOutlet weak var ViewBanner: UIView!
    @IBOutlet weak var ViewTopContraint: NSLayoutConstraint!
    @IBOutlet weak var ViewBg: UIView!
    @IBOutlet weak var lblErrorMessage: UILabel!
   
    // MARK: - View Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeSetup()
    }
    
    // MARK: - Methods
    private func initializeSetup() {
        ViewTopContraint.constant =  UIDevice.current.hasTopNotch ? 0 : 25
        lblErrorMessage.font = UIFont.Body_1
    }
    
    //MARK:-Functions
    func showView(toastMessage: String,isError:Bool = true)  {
        
        lblErrorMessage.text = toastMessage
        ViewBg.aa_animate(duration: 0.4, animation: .fromTop)
        ViewBanner.backgroundColor = isError ? UIColor.App_Banner_Error : UIColor.App_Banner_success
        ViewBg.backgroundColor = isError ? UIColor.App_Banner_Error : UIColor.App_Banner_success
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.removeView()
        }
    }
    
    func removeView() {
        
        ViewBg.aa_animate(duration: 1.6, animation: .toTop)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            self.ViewBg.removeFromSuperview()
            self.removeFromSuperview()
            self.ViewBg.removeAllAnimations()
        }
    }
}
extension UIView{
    
     func fromNib<T: UIView>() -> T {
        let nib = UINib(nibName: String(describing: T.self), bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil)[0] as! T
    }
    
    func addSubViewWithAutolayout(subView: UIView) {
        self.addSubview(subView)
        
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        subView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        subView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        subView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        subView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        subView.layoutIfNeeded()
        self.layoutIfNeeded()
    }
}
