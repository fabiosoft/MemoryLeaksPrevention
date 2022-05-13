//
//  MemoryLeaksPreventionTests.swift
//  MemoryLeaksPreventionTests
//
//  Created by Fabio Nisci on 13/05/22.
//

import XCTest
@testable import MemoryLeaksPrevention

class MemoryLeaksPreventionTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    /// These tests will pass as the classes correctly dealloc and no leaks
    func test_assert_dealloc() {
        assertDeallocation {
            return ClassUnLeaked()
        }
    }
    
    func test_viewcontroller_dealloc(){
        assertDeallocation {
            return ViewControllerUnleaked()
        }
    }
    
    /// These tests will not pass, indeed the objects don't deallocate (as my intention!)
    /// and the test catchs the memoty leak
    /// XCTAssertTrue failed - Timed out waiting for condition to be true: "The object should be deallocated since no strong reference points to it."
    func test_assert_leak(){
        assertDeallocation {
            return ClassLeaked()
        }
    }
    
    func test_viewcontroller_leak(){
        assertDeallocation {
            return ViewControllerLeaked()
        }
    }
}
