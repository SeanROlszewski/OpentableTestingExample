
import Foundation

func sum(_ x: Int, _ y: Int) -> Int {
    return x + y
}


import XCTest

class TestRunner: XCTestCase {
    func testSumAddsNumbers() {
        let expected = 10

        let actual = sum(5, 5)

        XCTAssertEqual(expected, actual)
    }
}

TestRunner.defaultTestSuite.run()
