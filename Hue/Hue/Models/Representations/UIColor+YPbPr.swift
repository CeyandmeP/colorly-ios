//
//  UIColor+YPbPr.swift
//  Hue
//
//  Created by Adam Graham on 3/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to provide conversion to and from YPbPr colors.
public extension UIColor {

    /// The YPbPr components of a color - luminance (Y) and chrominance (Pb,Pr).
    struct YPbPr {

        /// The luminance component of the color, in the range [0, 1] (black to white).
        public var Y: CGFloat
        /// The blue-difference chrominance component of the color, in the range [-0.5, 0.5].
        public var Pb: CGFloat
        /// The red-difference chrominance component of the color, in the range [-0.5, 0.5].
        public var Pr: CGFloat

    }

    /// The YPbPr components of the color using standard-definition encoding.
    var yPbPr: YPbPr {
        return yPbPr(.standard)
    }

    /// The YPbPr components of the color using a given encoding.
    func yPbPr(_ encoding: SignalEncoding) -> YPbPr {
        var (r, g, b) = (CGFloat(), CGFloat(), CGFloat())
        getRed(&r, green: &g, blue: &b, alpha: nil)

        let kR: CGFloat
        let kG: CGFloat
        let kB: CGFloat

        switch encoding {
        case .standard:
            kR = 0.299
            kG = 0.587
            kB = 0.114
        case .hdtv:
            kR = 0.2126
            kG = 0.7152
            kB = 0.0722
        }

        let Y = (r * kR) + (g * kG) + (b * kB)
        let Pb = 0.5 * ((b - Y) / (1.0 - kB))
        let Pr = 0.5 * ((r - Y) / (1.0 - kR))

        return YPbPr(Y: Y, Pb: Pb, Pr: Pr)
    }

    /// Initializes a color from YPbPr components.
    /// - parameter yPbPr: The components used to initialize the color.
    /// - parameter encoding: The signal encoding with which the components were derived.
    /// - parameter alpha: The alpha value of the color.
    convenience init(yPbPr: YPbPr,
                     encoding: SignalEncoding,
                     alpha: CGFloat = 1.0) {

        let r: CGFloat
        let g: CGFloat
        let b: CGFloat

        switch encoding {
        case .standard:
            r = yPbPr.Y + (1.402 * yPbPr.Pr)
            g = yPbPr.Y - (0.344 * yPbPr.Pb) - (0.714 * yPbPr.Pr)
            b = yPbPr.Y + (1.772 * yPbPr.Pb)
        case .hdtv:
            r = yPbPr.Y + (1.575 * yPbPr.Pr)
            g = yPbPr.Y - (0.187 * yPbPr.Pb) - (0.468 * yPbPr.Pr)
            b = yPbPr.Y + (1.856 * yPbPr.Pb)
        }

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

}
