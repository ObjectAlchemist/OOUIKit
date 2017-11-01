//
//  ColorHexSpec.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//  
//

import XCTest
import OOBase
@testable import OOUIKit

final class ColorHexSpec: XCTestCase {

    func testGIVEN_ABrownHexValue_WHEN_GetValue_THEN_ColorIsBrown() {
        // GIVEN
        let color = ColorHex(OOStringFake("#996633"), alpha: OOFloatFake(1))
        // WHEN
        let result = color.value
        // THEN
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        result.getRed(&r, green: &g, blue: &b, alpha: &a)
        // Brown: Rot=60% Grün=40% Blau=20% Alpha=100%
        XCTAssertTrue(Int(r*100)==60 && Int(g*100)==40 && Int(b*100)==20 && Int(a*100)==100)
    }

}
