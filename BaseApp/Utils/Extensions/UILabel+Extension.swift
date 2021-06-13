//
//  UILabel+Extension.swift
//  Dilango-Rider
//
//  Created by PC on 02/03/21.
//  Copyright © 2021 PC. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func indexOfAttributedTextCharacterAtPoint(point: CGPoint) -> Int {
      assert(self.attributedText != nil, "This method is developed for attributed string")
      let textStorage = NSTextStorage(attributedString: self.attributedText!)
      let layoutManager = NSLayoutManager()
      textStorage.addLayoutManager(layoutManager)
      let textContainer = NSTextContainer(size: self.frame.size)
      textContainer.lineFragmentPadding = 0
      textContainer.maximumNumberOfLines = self.numberOfLines
      textContainer.lineBreakMode = self.lineBreakMode
      layoutManager.addTextContainer(textContainer)
      
      let index = layoutManager.characterIndex(for: point, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
      return index
    }
    
}
