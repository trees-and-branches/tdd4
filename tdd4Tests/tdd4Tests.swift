//
//  tdd4Tests.swift
//  tdd4Tests
//
//  Created by shark boy on 1/31/24.
//

import XCTest
@testable import tdd4

final class tdd4Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFake() throws {
        let fakeDataService = FakeDataService()
        let fakeFile = File(title: "cool")
        
        fakeDataService.saveData() { file in
        }
    }
    
    //r
    func testMock() throws {
        let mockDataService = MockDataService()
        
        mockDataService.saveData() { _ in
            XCTAssertTrue(mockDataService.isDataSaved)
        }
        
    }
    
    func testStub() throws {
        let stubDataService = StubDataService()
        
        stubDataService.saveData() { file in
            
            XCTAssertNotNil(file)
            
        }
    }
    
}


class File {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}

class FakeDataService: DataService {
    func saveData(completion: (File?) -> Void) {
        print(thisIsAFunction())
        completion(nil)
    }
     
    func thisIsAFunction() {
        print("hello")
    }
    
}

class MockDataService: DataService {
    
    var isDataSaved = false
    
    func saveData(completion: (File?) -> Void) {
        isDataSaved = true
    }
    
    
}

class StubDataService: DataService {
    func saveData(completion: (File?) -> Void) {
        let file = File(title: "stinky")
        
        completion(file)
    }
    
    
}


protocol DataService {
    func saveData(completion: (File?) -> Void)
}
