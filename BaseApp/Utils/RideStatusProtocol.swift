//
//  RideStatusProtocol.swift
//  Dilango-Rider
//
//  Created by iMac on 02/04/21.
//  Copyright © 2021 PC. All rights reserved.
//

import Foundation
protocol RideStatusprotocol:AnyObject {
    func ScheduleRide(time:String)
    func ScheduledRide(Message:String)
    func RideStated()
    func BoookedRideComplete()
    func ReviewDriver()
    func ReviewComplete()
    func CancelBooking()
    func bookForFriend()
    func FriendDetailedAdded(name:String,phone:String,email:String)
}
