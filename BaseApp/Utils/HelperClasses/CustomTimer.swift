//
//  CustomTimer.swift
//  DilanGoDriver
//
//  Created by iMac on 19/02/21.
//

import Foundation
import UIKit

class CustomTimer {

    static var sharedTimers: [Timer] = []

    static func invalidateAllTimers() {
        for timer in CustomTimer.sharedTimers {
            timer.invalidate()
        }
    }
}
