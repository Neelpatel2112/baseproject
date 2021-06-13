//
//  Enums.swift
//  Dilango-Rider
//
//  Created by PC on 25/02/21.
//  Copyright © 2021 PC. All rights reserved.
//

import Foundation
import UIKit

let APP_DELEGETE: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
var MobileCode = "+94"
var StateID = "16"
let googleMapKey = "AIzaSyBWC2dFnEv7x9PSFjVrCyfOC4pGxQsaov4"
let OSM_APIKEY = "5b3ce3597851110001cf62480e60ab8025da4e95bf58906af79d0ef2"

enum StoryboardIdentifiers:String {
    case Main           = "Main"
    case Authentication = "Authentication"
    case Home           = "Home"
    case Profile        = "Profile"
}
enum vehicleList {
    case open
    case close
}
enum AppFontSize:CGFloat {
    
    case FONT_SIZE5                                 = 5
    case FONT_SIZE8                                 = 8
    case FONTS_SIZE10                               = 10
    case FONTS_SIZE12                               = 12
    case FONTS_SIZE14                               = 14
    case FONTS_SIZE15                               = 15
    case FONTS_SIZE16                               = 16
    case FONTS_SIZE17                               = 17
    case FONTS_SIZE19                               = 19
    case FONTS_SIZE20                               = 20
    case FONTS_SIZE24                               = 24
    case FONTS_SIZE25                               = 25
    case FONTS_SIZE28                               = 28
    case FONTS_SIZE30                               = 30
    case FONT_SIZE50                                = 50
    
}

enum Images {
    case backButton
    case Promotions
    case Settings
    case payment
    case MyRides
    case Help
    case Logout
    case Menu
    case FillStar
    case emptyStar
    case change_password
    case Show_password
    case Add
    case Later
    case Watch
    case Favourites
    case AddWork
    case AddHome
    case LocationPin
    case Car
    case Search
    case Close
    case PromoCode
    case ClosePopup
    case CancelRide
    case Cash_blue
    case Apply_promocode
    case friends
    case arrowRight
    case back_Round
    case loader
    case callDriver
    case Introdction_Slice1
    case Introdction_Slice2
    case Introdction_Slice3
    case currentLocationPin
    case Camera
    case home_Menu
    case pickUpPin
    case DropPin
    case Latebooking
    case Language
    case ContactUs
    case TermsandPrivacyPolicy
    case HelpCenter
    case CreditCard
    case Notification_Promo
    case Notification_Systems
    case SelectedCard
    case ShowPassword_Eye
    case LiveChat
    case TukTukPin
    case BudgetPin
    case EconomyPin
    case ComfortPin
    case CurrentMark
    
    func image() -> UIImage {
        switch self {
        case .backButton :
            return UIImage(named: "ic_ArrowLeft") ?? UIImage()
        case .MyRides:
            return UIImage(named: "ic_my_rides") ?? UIImage()
        case .Promotions:
            return UIImage(named: "ic_promotions") ?? UIImage()
        case .payment:
            return UIImage(named: "ic_payment") ?? UIImage()
        case .Settings:
            return UIImage(named: "ic_settings") ?? UIImage()
        case .Help:
            return UIImage(named: "ic_help") ?? UIImage()
        case .Logout:
            return UIImage(named: "ic_logout") ?? UIImage()
        case .Menu:
            return UIImage(named: "ic_menu") ?? UIImage()
        case .FillStar:
            return UIImage(named: "ic_yellow_star_selected") ?? UIImage()
        case .emptyStar:
            return UIImage(named: "ic_yellow_star") ?? UIImage()
        case .change_password :
            return UIImage(named: "ic_change_password") ?? UIImage()
        case .Show_password :
            return UIImage(named: "ic_Show_password") ?? UIImage()
        case  .Add:
            return UIImage(named: "ic_Add") ?? UIImage()
        case .Later:
            return UIImage(named: "ic_Later") ?? UIImage()
        case .Watch:
            return UIImage(named: "ic_Watch") ?? UIImage()
        case .Favourites:
            return UIImage(named: "ic_Favourites") ?? UIImage()
        case .AddWork:
            return UIImage(named: "ic_AddWork") ?? UIImage()
        case .AddHome:
            return UIImage(named: "ic_AddHome") ?? UIImage()
        case .LocationPin:
            return UIImage(named: "ic_LocationPin") ?? UIImage()
        case .Car :
            return UIImage(named: "ic_car") ?? UIImage()
        case .Search :
            return UIImage(named: "ic_Search") ?? UIImage()
        case .Close :
            return UIImage(named: "ic_Close") ?? UIImage()
        case .PromoCode :
            return UIImage(named: "ic_PromoCode") ?? UIImage()
        case .ClosePopup :
            return UIImage(named: "ic_close_popup") ?? UIImage()
        case .CancelRide :
            return UIImage(named: "img_cancel_ride") ?? UIImage()
        case .Cash_blue:
            return UIImage(named: "ic_Cash_Blue") ?? UIImage()
        case .Apply_promocode:
            return UIImage(named: "ic_applyPromocode") ?? UIImage()
        case .friends:
            return UIImage(named: "ic_group") ?? UIImage()
        case .arrowRight:
            return UIImage(named: "arrow_right") ?? UIImage()
        case .back_Round:
            return UIImage(named: "ic_back_round") ?? UIImage()
        case .loader:
            return UIImage(named: "ic_loader") ?? UIImage()
        case .callDriver:
            return UIImage(named: "ic_driver_call") ?? UIImage()
        case .Introdction_Slice1:
            return UIImage(named: "ic_Slice1") ?? UIImage()
        case .Introdction_Slice2:
            return UIImage(named: "ic_Slice2") ?? UIImage()
        case .Introdction_Slice3:
            return UIImage(named: "ic_Slice3") ?? UIImage()
        case .currentLocationPin :
            return UIImage(named: "ic_currentLocationPin") ?? UIImage()
        case .Camera:
            return UIImage(named: "ic_Camera") ?? UIImage()
        case .home_Menu:
            return UIImage(named: "ic_Home_Menu") ?? UIImage()
        case .pickUpPin:
            return UIImage(named: "ic_pin_pickupLocation") ?? UIImage()
        case .DropPin:
            return UIImage(named: "ic_pin_dropLocation") ?? UIImage()
        case .Latebooking:
            return UIImage(named: "ic_latebooking") ?? UIImage()
        case .Language:
            return UIImage(named: "ic_Language") ?? UIImage()
        case .ContactUs:
            return UIImage(named: "ic_ContactUs") ?? UIImage()
        case .TermsandPrivacyPolicy:
            return UIImage(named: "ic_TermAndPrivacy") ?? UIImage()
        case .HelpCenter:
            return UIImage(named: "ic_HelpCenter") ?? UIImage()
        case .CreditCard:
            return UIImage(named: "ic_CreditCardNumber") ?? UIImage()
        case .Notification_Promo:
            return UIImage(named: "ic_notification_promo") ?? UIImage()
        case .Notification_Systems:
            return UIImage(named: "ic_notification_system") ?? UIImage()
        case .SelectedCard:
            return UIImage(named: "ic_selected_card") ?? UIImage()
        case .ShowPassword_Eye:
            return UIImage(named: "ic_eye_blue") ?? UIImage()
        case .LiveChat:
            return UIImage(named: "ic_livechat") ?? UIImage()
        case .TukTukPin:
            return UIImage(named: "ic_dilango_car1") ?? UIImage()
        case .BudgetPin:
            return UIImage(named: "ic_dilango_car2") ?? UIImage()
        case .EconomyPin:
            return UIImage(named: "ic_dilango_car3") ?? UIImage()
        case .ComfortPin:
            return UIImage(named: "ic_dilango_car4") ?? UIImage()
        case .CurrentMark:
            return UIImage(named: "ic_current_Mark") ?? UIImage()
        }
    }
}
enum cabType : String {
    
    case TukTuk = "1"
    case Budget = "2"
    case Economy = "3"
    case Comfort = "4"
    
    func CabImage() -> UIImage {
        switch self {
        case .TukTuk:
            return Images.TukTukPin.image()
        case .Budget:
            return Images.BudgetPin.image()
        case .Economy:
            return Images.EconomyPin.image()
        case .Comfort:
            return Images.ComfortPin.image()
        }
    }
    
}
enum NavigationControllerIdentifiers:String {
    case AuthenticationNav                          = "AuthenticationNav"
}

enum UserDefaultKey: String {
    case IsLogin                                    = "IsLogin"
    case LoginResponse                              = "LoginResponse"
    case Email                                      = "email"
    case password                                   = "password"
    case UserDetails                                = "UserDetails"
    case Firebase_enable                            = "Firebase_enable"
    case AppConfiguration                           = "AppConfiguration"
    case GeocoderOsm                                = "GeocoderOsm"
    case HomeAddress                                = "HomeAddress"
    case FavoriteAddress                            = "FavoriteAddress"
    case workAddress                                = "workAddress"
    case otherAddress                               = "otherAddress"
    case utc_offset                                 = "utc_offset"
    case oAuth                                      = "oAuth"
    case creditCardName                             = "creditCardName"
    case sessionId                                  = "sessionId"
}


enum NavigationTitle:String {
    
    case MyRides                                    = "My rides"
    case Notification                               = "Notification"
    case Settings                                   = "Settings"
    case Help                                       = "Help"
    case Promotions                                 = "Promotions"
    case Change_Password                            = "Change Password"
    case Edit_Profile                               = "Edit Profile"
    case Profile                                    = "Profile"
    case Payments                                   = "Payments"
    case Receipt                                    = "Receipt"
    case Addcard                                    = "Add Card"
}
enum ViewControllerIdentifiers:String {
    case SplashViewController                       = "SplashViewController"
    case IntroductionViewController                 = "IntroductionViewController"
    case LoginSignupViewController                  = "LoginSignupViewController"
    case RegistrationViewController                 = "RegistrationViewController"
    case OTPVerificationViewController              = "OTPVerificationViewController"
    case CreateAccountViewController                = "CreateAccountViewController"
    case ForgotPasswordViewController               = "ForgotPasswordViewController"
    case HomeViewController                         = "HomeViewController"
    case MenuViewController                         = "MenuViewController"
    case RideDetailsViewController                  = "RideDetailsViewController"
    case ChangePasswordViewController               = "ChangePasswordViewController"
    case PromotionsViewController                   = "PromotionsViewController"
    case SettingsViewController                     = "SettingsViewController"
    case EditProfileViewController                  = "EditProfileViewController"
    case PaymentsViewController                     = "PaymentsViewController"
    case AddCardViewController                      = "AddCardViewController"
    case ResetPasswordViewController                = "ResetPasswordViewController"
    case LoginViewController                        = "LoginViewController"
    case BookRideViewController                     = "BookRideViewController"
    case SelectDropOffViewController                = "SelectDropOffViewController"
    case ScheduleRideViewController                 = "ScheduleRideViewController"
    case ScheduledRideViewController                = "ScheduledRideViewController"
    case MyRidesViewController                      = "MyRidesViewController"
    case SelectLocationFromMapViewController        = "SelectLocationFromMapViewController"
    case SearchLocationViewController               = "SearchLocationViewController"
    case PromoCodeViewController                    = "PromoCodeViewController"
    case ReasonCancelRideViewController             = "ReasonCancelRideViewController"
    case UserReviewViewController                   = "UserReviewViewController"
    case ConfirmBookingViewController               = "ConfirmBookingViewController"
    case BookingForFriendViewController             = "BookingForFriendViewController"
    case SearchingDriversViewController             = "SearchingDriversViewController"
    case RideStartedViewController                  = "RideStartedViewController"
    case ReceiptViewController                      = "ReceiptViewController"
    case NotificationsViewController                = "NotificationsViewController"
    case TryAgainPopupViewController                = "TryAgainPopupViewController"
}

enum AppColorsNames: String {
    case AppGradiantDarkBlue                        = "AppGradiantDarkBlue"
    case AppGradientLightBlue                       = "AppGradientLightBlue"
    case AppOrange                                  = "AppOrange"
    case AppGray                                    = "AppGray"
}

enum AppFontName:String {
    case Regular                                    = "Roboto-Regular"
    case Medium                                     = "Roboto-Medium"
    case Bold                                       = "Roboto-Bold"
    case Thin                                       = "Roboto-Thin"
    case Light                                      = "Roboto-Light"
    case italic                                     = "Roboto-Italic"
    case Bolditalic                                 = "Roboto-BoldItalic"
}

enum LabelTitle:String{
    case or_sign_up_with                            = "or sign up with"
    case Get_Started                                = "Get Started"
    case Please_enter_your_mobilenumber             = "Please enter your mobile number"
    case ForgotPassword                             = "Forgot Password"
    case ByclickingCreateAccountagreed              = "By clicking \"Create Account\" you are agreed to DILAN GO "
    case Pickup                                     = "Pick up"
    case CurrentLocation                            = "Current Location"
    case Dropoff                                    = "Drop off"
    case PromoCode                                  = "Promo Code"
    case Taponareasontocanceltherider               = "Tap on a reason to cancel the rider"
    case HowisYourTrip                              = "How is Your Trip?"
    case PaywithCash                                = "Pay with Cash"
    case Whoareyoubookingfor                        = "Who are you booking for?"
    case SearchingDrivers                           = "Searching Drivers..."
    case Your_ride_will_start_soon                  = "Your ride will start soon"
    case Driver_Arrived                             = "Driver Arrived"
    case Ride_started                               = "Ride started"
    case Distance                                   = "Distance"
    case Travel_Time                                = "Travel Time"
    case Totaltripfare                              = "Total trip fare"
    case Language                                   = "Language"
    case Cash                                       = "Cash"
    case Addpaymentmethod                           = "Add payment method"
    case AmountPayble                               = "Amount Payble"
}

enum ButtonTitle:String{
    case LOGIN                                      = "LOGIN"
    case SIGN_UP                                    = "SIGN UP"
    case Continue                                   = "Continue"
    case Verify                                     = "Verify"
    case ResendCode                                 = "Resend code"
    case CreateAccount                              = "Create Account"
    case Submit                                     = "Submit"
    case ViewProfile                                = "ViewProfile"
    case Save                                       = "Save"
    case Change                                     = "Change"
    case ResetPassword                              = "Reset Password"
    case signin                                     = "Sign In"
    case AreyouNewUser                              = "Are you New? Register"
    case forgotPassword                             = "Forgot Password?"
    case BookARide                                  = "Book A Ride"
    case Later                                      = "Later"
    case Done                                       = "Done"
    case Skip                                       = "Skip"
    case Apply                                      = "Apply"
    case Drivernotmoving                            = "Driver not moving"
    case Delayed                                    = "Delayed"
    case Appissue                                   = "App issue"
    case Changedmymind                              = "Changed my mind"
    case Somethingelse                              = "Something else"
    case Other                                      = "Other"
    case Cancel_Ride                                = "Cancel Ride"
    case Next                                       = "Next"
    case Addtip                                     = "Add tip"
    case Confirm                                    = "Confirm"
    case tryAgain                                   = "Try Again"
    case ShowReceipt                                = "Show Receipt"    
}

enum TextFieldPlaceholder:String {
    case MobileNumber                               = "Mobile Number"
    case FirstName                                  = "First Name"
    case LastName                                   = "Last Name"
    case Email                                      = "Email"
    case Password                                   = "Password"
    case ConfirmPassword                            = "Confirm Password"
    case WhereGoing                                 = "Where are you going?"
    case EnterWorkAddress                           = "Enter Work Address"
    case EnterHomeAddress                           = "Enter Home Address"
    case AddFavourite                               = "Add Favourite"
    case Inputpromocode                             = "Input promo code"
    case EnterReason                                = "Enter Reason"
    case Additionalcomments                         = "Additional comments ..."
    case EnterAddress                               = "ENTER ADDRESS"
    
}
enum TableViewCellIdentifiers :String {
    case MyRidesListTableViewCell                   = "MyRidesListTableViewCell"
    case MenuTableViewCell                          = "MenuTableViewCell"
    case EditProfileTableViewCell                   = "EditProfileTableViewCell"
    case SettingsTableViewCell                      = "SettingsTableViewCell"
    case NotificationTableViewCell                  = "NotificationTableViewCell"
    case PaymentsTableViewCell                      = "PaymentsTableViewCell"
    case PromotionsTableViewCell                    = "PromotionsTableViewCell"
    case DropLocationTableViewCell                  = "DropLocationTableViewCell"
    case PickUpDropLocationTableViewCell            = "PickUpLocationTableViewCell"
    case BookRideTableViewCell                      = "BookRideTableViewCell"
    case SelectLocationTableViewCell                = "SelectLocationTableViewCell"
    case SelectRecentLocationTableViewCell          = "SelectRecentLocationTableViewCell"
    case RecentLocationSearchTableViewCell          = "RecentLocationSearchTableViewCell"
}
enum errorMessage:String {
    case unauthorized                       = "Please do login again."
    case serverErrror                       = "Someting went wrong with server. Please try again later."
    case enterEmailAddress                  = "Please enter a valid email address."
    case EnterPassword                      = "Please enter your password."
    case Nointernetconnection               = "No internet connection."
    case Pleaseverificationcode             = "Please enter your verification code."
    case enterValidMobileNo                 = "Please enter valid mobile number."
    case enterMobileNo                      = "Please enter mobile number."
    case enterFirstName                     = "Please enter your first name."
    case enterLastName                      = "Please enter your last name."
    case selectProvince                     = "Please select Province."
    case upload_Driving_license_photo       = "Please upload a photo of your Driving Front license."
    case enterDriver_License_number         = "Please enter your Driver's License number."
    case enterOldPassword                   = "Please enter in your old password."
    case enterNewPassword                   = "Please enter in your new password."
    case passwordNotMatched                 = "Passwords do not match."
    case enterConfirmPassword               = "Please enter in your Confirm Password"
    case SelectedDropAddress                = "Please enter Drop Address"
    case SelectedPickUpAddress              = "Please enter PickUp Address"
    case selectreasoncancelride             = "Please select a reason to cancel the ride"
    case pleaseEnterCacnelReason            = "Please enter a reason"
    case DriverCancelRide                   = "Sorry, your booking has been cancelled by the driver."
    case Drivers_are_busy                   = "Drivers around you are busy at this time. Please try again."
    case EnterFriendName                    = "Please enter a Friend Name."
    case EnterFriendEmail                   = "Please enter a Friend Email."
    case EnterFriendPhone                   = "Please enter a Friend phone Number."
    
}
enum OTPType:String {
    case register = "V"
    case Forget = "F"
}
enum userCurrentState {
    case Home
    case SelectLocation
    case BookedRide
    case SearchingDriver
    case BookforFirend
    case ScheduleRider
    case ScheduledRider
    case RideAccepted
    case RideStated
    case RiderEnd
    case ReviewDriver
}
//MARK:- LocationSelecttion
enum enumLocationSelecttion: Int,CaseIterable {
    case pickup, DropOff, SelectLocation, RecentLocation
    
    func title() -> String {
        switch self {
        case .pickup:
            return "Pick Up"
        case .DropOff:
            return "Drop Off"
        case .SelectLocation:
            return "Select Location"
        case .RecentLocation:
            return "Recent Location"
        }
    }
}
enum SaveAddressType:Int {
    case home = 1
    case work = 2
    case favoritePlace = 3
    case drop = 4
    case Pickup = 5
    case other = 6
}
enum CancelRideReason:String {
    case Driver_not_moving  = "Driver not moving"
    case Delayed            = "Delayed"
    case App_issue          = "App issue"
    case Changed_my_mind    = "Changed my mind"
    case Something_else     = "Something else"
}
enum Urls:String {
    case HelpCenter           = "https://dilango.lk/help"
    case TermAndAgreement     = "https://dilango.lk/help/rider-service-agreement?app=1"    
}
