//
//  UIDevice.swift
//  UIKitLessons
//
//  Created by Prince Avecillas on 6/8/24.
//

import Foundation
import UIKit

class UIDeviceUIKit {
    
    static func printDetails() {
        print(UIDevice.current)
        print(UIDevice().name)
        print(UIDevice().model)
        print(UIDevice().orientation)
    }
}
