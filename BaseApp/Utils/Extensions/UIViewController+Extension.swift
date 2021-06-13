//
//  UIViewController+Extension.swift
//  Dilango-Rider
//
//  Created by PC on 26/02/21.
//  Copyright © 2021 PC. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController:UIGestureRecognizerDelegate{
    
    func addBackButton(isRounded:Bool = false) {
        let btnLeftMenu: UIButton = UIButton()
        if isRounded {
            btnLeftMenu.frame = CGRect(x: 0, y: 0, width: (10*UIScreen.main.bounds.height)/812, height: (10*UIScreen.main.bounds.height)/812)
        }
       
        let image = isRounded ? Images.back_Round.image() : Images.backButton.image()
        btnLeftMenu.setImage(image, for: .normal)
        btnLeftMenu.tintColor = .black
        btnLeftMenu.sizeToFit()
        btnLeftMenu.addTarget(self, action: #selector (backButtonClick(sender:)), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        if self.navigationController?.viewControllers.count ?? 0 > 1 {
            self.navigationItem.leftBarButtonItem = barButton
            self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        }
    }
    func addMenuButton() {
        let btnLeftMenu: UIButton = UIButton()
        let image = Images.Menu.image()
        btnLeftMenu.setImage(image, for: .normal)
        btnLeftMenu.tintColor = .black
        btnLeftMenu.sizeToFit()
        btnLeftMenu.addTarget(self, action: #selector (MenuButtonClick(sender:)), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.leftBarButtonItem = barButton
    }
    @objc func MenuButtonClick(sender : UIButton) {
        //APP_DELEGETE?.centerController?.showLeftViewAnimated(false)
    }
    
    @objc func backButtonClick(sender : UIButton) {
        self.navigationController?.popViewController(animated: false);
    }
    func setLeftAlignedNavigationItemTitle(text: String){
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = text
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.H6_Head
        navigationItem.titleView = titleLabel
    }
    func pushToViewController(viewControllerIdentifire:ViewControllerIdentifiers,storyBoardIdentifire:StoryboardIdentifiers)  {
        let storyborad: UIStoryboard = UIStoryboard(name: storyBoardIdentifire.rawValue, bundle: nil)
        let loginSignupViewController = storyborad.instantiateViewController(withIdentifier: viewControllerIdentifire.rawValue)
        self.navigationController?.pushViewController(loginSignupViewController, animated: true)
    }
    
    func checkRange(_ range: NSRange, contain index: Int) -> Bool {
        return index > range.location && index < range.location + range.length
    }
    
    func ShowAlert(message: String,isError:Bool = true){
        let BannerView: CustomBannerView = UIView.fromNib()
        APP_DELEGETE?.window?.addSubViewWithAutolayout(subView: BannerView)
        BannerView.showView(toastMessage: message,isError: isError)
    }
    
    
    
    func loadViewController(Storyboard:StoryboardIdentifiers,ViewController:ViewControllerIdentifiers) -> UIViewController {
        let storyBoard = UIStoryboard(name: Storyboard.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: ViewController.rawValue)
        return vc
    }
    func presentsheetAnimation(){
        let oldframe = self.view.frame
        self.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: oldframe.width, height: oldframe.height)
        UIView.animate(withDuration: 0.4) { [weak self] in
            self?.view.frame = oldframe
        }
    }
    func hidesheetAnimation(){
        let oldframe = self.view.frame
        
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: oldframe.width, height: oldframe.height)
        }
    }
    func removeTopChildViewController(removeAll:Bool? = false){
        
        if removeAll ?? false {
            self.children.forEach {
                  $0.willMove(toParent: nil)
                  $0.view.removeFromSuperview()
                  $0.removeFromParent()
                }
        }else {
            let viewControllers:[UIViewController] = self.children
            viewControllers.last?.willMove(toParent: nil)
            viewControllers.last?.removeFromParent()
            viewControllers.last?.view.removeFromSuperview()
        }
    }
}
extension UIViewController {
   
   func add(_ controller: UIViewController) {
    view.addSubview(controller.view)
    addChild(controller)
      
      
//      controller.view.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//         controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//         controller.view.topAnchor.constraint(equalTo: view.topAnchor),
//         controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//         controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//      ])
//      
//      controller.didMove(toParent: self)
   }
   
   func remove() {
      guard parent != nil else {
         return
      }

      willMove(toParent: nil)
      view.removeFromSuperview()
      removeFromParent()
   }
   
}
