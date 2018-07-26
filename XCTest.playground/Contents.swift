
import Foundation

func sum(_ x: Int, _ y: Int) -> Int {
    return x + y
}

import XCTest

class TestRunner: XCTestCase {
    func test_sumAddsTwoNumbers() {
        let expected = 10

        let actual = sum(5, 5)

        XCTAssertEqual(expected, actual)
    }

    func test_sumCanAddNegatives() {
        let expected = -1

        let actual: Int = sum(10, -11)

        XCTAssertEqual(expected, actual)
    }
}

TestRunner.defaultTestSuite.run()
