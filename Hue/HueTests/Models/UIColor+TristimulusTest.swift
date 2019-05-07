//
//  UIColor+TristimulusTest.swift
//  HueTests
//
//  Created by Adam Graham on 5/6/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import Hue

class UIColor_TristimulusTest: XCTestCase {

    func test() {
        let values: UIColor.Tristimulus = (1.0, 2.0, 3.0)
        XCTAssertEqual(values.x, 1.0)
        XCTAssertEqual(values.y, 2.0)
        XCTAssertEqual(values.z, 3.0)
    }

}
