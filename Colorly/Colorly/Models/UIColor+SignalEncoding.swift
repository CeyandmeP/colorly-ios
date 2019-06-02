//
//  UIColor+SignalEncoding.swift
//  Colorly
//
//  Created by Adam Graham on 5/24/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to describe ITU-R Recommendation signal encodings.
public extension UIColor {

    /// A standard ITU-R Recommendation signal encoding.
    ///
    /// ITU-R Recommendations are the names given to the set of international technical
    /// standards developed by the Radiocommunication Sector of the International
    /// Telecommunication Union (ITU).
    enum SignalEncoding {

        /// ITU-R BT.601 (standard-definition television)
        case rec601
        /// ITU-R BT.709 (high-definition television)
        case rec709

        /// The RGB coefficients used to calculate luminance/luma.
        internal var coefficients: (r: CGFloat, g: CGFloat, b: CGFloat) {
            switch self {
            case .rec601:
                return (0.299, 0.587, 0.114)
            case .rec709:
                return (0.2126, 0.7152, 0.0722)
            }
        }

    }

}
