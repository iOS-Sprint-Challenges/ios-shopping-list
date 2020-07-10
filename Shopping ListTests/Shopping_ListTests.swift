//
//  Shopping_ListTests.swift
//  Shopping ListTests
//
//  Created by FGT MAC on 7/10/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Shopping_List

class Shopping_ListTests: XCTestCase {

    func testShoppingItem() {
        let item = ShoppingItem(name: "Apple", image: "Apple")
        
        XCTAssertEqual(item.name, "Apple")
        XCTAssertNotEqual(item.image, "Pear")
        XCTAssertFalse(item.added)
    }
    
    


}
