//
//  AppDatePickerView.swift
//  DilanGoDriver
//
//  Created by iMac on 29/01/21.
//

import Foundation
import UIKit
class AppDatePickerView: NSObject {
    
    static let shared = AppPickerView()
    private var DatePickerView : UIDatePicker?
    private let toolbarBtnFont = UIFont.boldSystemFont(ofSize: 17.0)
    private let toolbarColor = UIColor.APP_GradiantDarkBlue
    private let toolbarBtnColor = UIColor.white
    private var objPickerBlock : ((_ SelectDate:String) ->Void)?
    private var objViewController = UIViewController()
    private var DateFormate:String?
    func addPickerView(textField:UITextField,
                       controller:UIViewController,
                       dateFormate:String,
                       maximunDate:Date?,
                       minimumDate:Date,completionBlock:@escaping ((_ SelectDate:String) ->Void)) {
        
        self.DateFormate = dateFormate
        objViewController = controller
        DatePickerView = UIDatePicker()
        DatePickerView?.backgroundColor = .white
        DatePickerView?.locale = .current
        if #available(iOS 13.4, *) {
            DatePickerView?.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        DatePickerView?.minimumDate = minimumDate
        if maximunDate != nil {
            DatePickerView?.maximumDate = maximunDate!
        }
        
        //DatePickerView.date = selectedPickupDate
        DatePickerView?.datePickerMode = UIDatePicker.Mode.date
        textField.inputView = DatePickerView
        DatePickerView?.addTarget(self, action:
                                    #selector(datePickerValueChanged), for:
                                        UIControl.Event.valueChanged)
        objPickerBlock = completionBlock
        self.addToolBar(picker: DatePickerView!, textField: textField,viewcontroller: controller)
    }
    
    
    func addToolBar(picker: UIDatePicker, textField: UITextField,viewcontroller:UIViewController)
    {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: viewcontroller.view.bounds.size.width, height: 44))
        toolBar.barTintColor = toolbarColor
        toolBar.tintColor =  toolbarBtnColor
        toolBar.sizeToFit()
        toolBar.roundCorners([.topLeft,.topRight], radius: toolBar.frame.width * 0.05)
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem.init(title:"Done", style: .done, target: self, action:  #selector(doneClick))
        done.setTitleTextAttributes([NSAttributedString.Key.font: toolbarBtnFont], for: .normal)
        done.setTitleTextAttributes([NSAttributedString.Key.font: toolbarBtnFont], for: .selected)
        
        let cancel = UIBarButtonItem(title:"Cancel", style: .done, target: self, action:  #selector(cancelClick))
        cancel.setTitleTextAttributes([NSAttributedString.Key.font: toolbarBtnFont], for: .normal)
        cancel.setTitleTextAttributes([NSAttributedString.Key.font: toolbarBtnFont], for: .selected)
        
        toolBar.setItems([cancel,flexSpace,done], animated: true)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker)
    {
        self.setPickupDate(date: sender.date)
    }
    func setPickupDate(date: Date)
    {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormate ?? "dd MMMM yyyy"
        let selectedDate = dateFormatter.string(from: date)
        objPickerBlock!(selectedDate)
    }
    @objc func doneClick(sender: UIButton)
    {
       self.setPickupDate(date: DatePickerView?.date ?? Date())
       objViewController.view.endEditing(true)
    }
    @objc func cancelClick(sender: UIButton)
    {
        objViewController.view.endEditing(true)
    }
}
