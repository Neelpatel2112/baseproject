//
//  AppTextField.swift
//  DilanGoRider
//
//  Created by iMac on 09/01/21.
//

import UIKit

class AppTextField: UIView {

    @IBOutlet weak var ViewText: UIView!
    @IBOutlet weak var ActionButton: UIButton!
    @IBOutlet weak var lblPlaceHolder: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setup()
    }
    private func setup() {
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        textField.font = UIFont.Body_1
        self.ViewText.layer.borderWidth = 1
        self.ViewText.layer.borderColor = UIColor.APP_GradiantDarkBlue.cgColor
        lblPlaceHolder.font = UIFont.Body_Bold
        lblPlaceHolder.textColor = UIColor.APP_GradiantDarkBlue
        ActionButton.addTarget(self, action: #selector(actionbuttonTap), for: .touchUpInside)
    }
    override func draw(_ rect: CGRect) {
        ViewText.layer.cornerRadius = ViewText.frame.height / 2
        self.ActionButton.layer.cornerRadius = ActionButton.frame.height / 2
    }
    private func commonInit() {
        let bundle = Bundle.main
        let nib = UINib(nibName: "AppTextField", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        view?.frame = self.bounds
        view?.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.addSubview(view ?? UIView())
    }
    @objc func actionbuttonTap() {
        textField.becomeFirstResponder()
    }
    
    @IBInspectable var placeHolderTextColor: UIColor? {
        didSet{
            lblPlaceHolder.textColor = placeHolderTextColor
        }
    }
    @IBInspectable var ButtonImage: UIImage? {
        didSet{
            self.ActionButton.setImage(ButtonImage ?? UIImage(), for: .normal)
        }
    }
    
    @IBInspectable var placeHolderString: String? {
        didSet{
            if let text = placeHolderString{
                lblPlaceHolder.text = "     " + " \(text) "
                lblPlaceHolder.isHidden = false
            }else{
                lblPlaceHolder.text = nil
                lblPlaceHolder.isHidden = true
            }
        }
    }
    
    @IBInspectable var textFieldplaceHolder: String? {
        didSet{
            if let text = textFieldplaceHolder{
                textField.placeholder = " \(text) "
            }else{
                textField.placeholder = nil
            }
        }
    }
    
  
    @IBInspectable var Bordercolor: UIColor?{
        didSet{
            if let color = Bordercolor {
                self.lblPlaceHolder.textColor = color
                self.textField.layer.borderColor = color.cgColor
            }else{
                self.lblPlaceHolder.textColor = UIColor.lightGray
                self.textField.layer.borderColor = UIColor.lightGray.cgColor
            }
        }
    }
    
    
    
    var placeHolderAttributedString: NSAttributedString?{
        didSet{
            if let attributedText = placeHolderAttributedString{
                lblPlaceHolder.attributedText = attributedText
            }
        }
    }
    
    
    @IBInspectable var placeHolderBackGroundColor: UIColor? {
        didSet{
            lblPlaceHolder.backgroundColor = placeHolderBackGroundColor
        }
    }
}
