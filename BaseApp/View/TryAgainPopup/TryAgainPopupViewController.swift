//
//  TryAgainPopupViewController.swift
//  Dilango-Rider
//
//  Created by iMac on 06/04/21.
//  Copyright © 2021 PC. All rights reserved.
//

import UIKit

protocol tryAgainTapProtocol:AnyObject {
    func popupTryAgainClick()
    func closePopupClick()
}

class TryAgainPopupViewController: UIViewController {

    @IBOutlet weak var viewTitle: UIView!
    @IBOutlet weak var viewPopup: UIView!    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnTryAgain: UIButton!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnClose: UIButton!
    var popupTitle: String?
    var message:String?
    weak var delegate:tryAgainTapProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupUI()
        setupData()
    }
    private func setupData() {
        lblTitle.text = popupTitle
        lblMessage.text = message
    }
    private func SetupUI() {
        viewTitle.setGradientBackground(topColor: UIColor.APP_GradiantDarkBlue, bottomColor: UIColor.App_GradientLightBlue)
        lblTitle.font = UIFont.Body_Bold
        lblMessage.font = UIFont.Body_2
        lblTitle.textColor = .white
        lblMessage.textColor = .black
        btnTryAgain.setTitle(ButtonTitle.tryAgain.rawValue, for: .normal)
    }
    override func viewDidAppear(_ animated: Bool) {
        viewPopup.cornerRadius = viewPopup.frame.width * 0.05
        viewPopup.clipsToBounds = true
        btnTryAgain.circleCorner =  true
    }

    @IBAction func btnClickClose(_ sender: UIButton) {
        delegate?.closePopupClick()
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func btnClickTryAgain(_ sender: UIButton) {
        delegate?.popupTryAgainClick()
        dismiss(animated: false, completion: nil)
    }
}
