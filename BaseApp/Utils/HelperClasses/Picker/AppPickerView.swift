//
//  AppPickerView.swift
//  DilanGoDriver
//
//  Created by iMac on 28/01/21.
//

import Foundation
import UIKit
protocol ToolbarPickerViewDelegate: class {
    func didTapDone(selectedItem:String,row:Int)
    func didTapCancel()
}
class AppPickerView: NSObject {
    

        // MARK: - Properties
        static let shared = AppPickerView()
        private var objPickerView : UIPickerView?
        private var pickerDataSource : [String]?
        private var objPickerBlock : ((_ selectedIndex:Int, _ selectedData: String) ->Void)?
        private var selectedIndex :Int = 0
        private var objViewController = UIViewController()
        
        private let toolbarBtnFont = UIFont.boldSystemFont(ofSize: 17.0)
        private let toolbarColor = UIColor.APP_GradiantDarkBlue
        private let toolbarBtnColor = UIColor.white
        
        // MARK: -
        
        /// Use this method to display **Picker View** on any textfield
        ///
        /// - Parameters:
        ///   - textField: Object of textfield on which you need to an display Picker View.
        ///   - controller: Object of controller on which you need to an display Picker View.
        ///   - pickerArray: Pass your array of string for picker data
        ///   - completionBlock: You will get the call back here when user selected the data.
        
        func addPickerView(textField:UITextField,
                           controller:UIViewController,
                           pickerArray:[String],
                           completionBlock:@escaping ((_ selectedIndex:Int,_ selectedData: String) -> Void)) {
            
            objViewController = controller
            objPickerView = UIPickerView()
            objPickerView?.backgroundColor = UIColor.white
            objPickerView?.delegate = self
            objPickerView?.dataSource = self
            pickerDataSource = pickerArray
            objPickerView?.selectRow(0, inComponent: 0, animated: true)
            textField.tintColor = UIColor.clear
            
            let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: controller.view.bounds.size.width, height: 44))
            toolBar.barTintColor = toolbarColor
            toolBar.tintColor =  toolbarBtnColor
            toolBar.roundCorners([.topLeft,.topRight], radius: toolBar.frame.width * 0.05)
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
            let done = UIBarButtonItem.init(title:"Done", style: .done, target: self, action:  #selector(doneClick))
            done.setTitleTextAttributes([NSAttributedString.Key.font: toolbarBtnFont], for: .normal)
            done.setTitleTextAttributes([NSAttributedString.Key.font: toolbarBtnFont], for: .selected)
            
            let cancel = UIBarButtonItem(title:"Cancel", style: .done, target: self, action:  #selector(cancelClick))
            cancel.setTitleTextAttributes([NSAttributedString.Key.font: toolbarBtnFont], for: .normal)
            cancel.setTitleTextAttributes([NSAttributedString.Key.font: toolbarBtnFont], for: .selected)
            
            toolBar.setItems([cancel,flexSpace,done], animated: true)
            textField.inputAccessoryView = toolBar
            
            if let index = pickerArray.index(of: textField.text!) {
                objPickerView!.selectRow(index, inComponent: 0, animated: true)
            }
            textField.inputView = objPickerView
            objPickerBlock = completionBlock
        }
        
        // MARK: - Button Click Event
        
        @objc func doneClick() {
            objPickerBlock!(selectedIndex, (pickerDataSource?[selectedIndex] ?? ""))
            objViewController.view.endEditing(true)
        }
        
        @objc func cancelClick() {
            objViewController.view.endEditing(true)
        }
}

// MARK: - UIPickerViewDataSource
extension AppPickerView : UIPickerViewDataSource{
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return (pickerDataSource?.count ?? 0)
        }
        
}
// MARK: - UIPickerViewDelegate
extension AppPickerView : UIPickerViewDelegate{
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return pickerDataSource?[row]
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
            selectedIndex = row
            
        }
    }

