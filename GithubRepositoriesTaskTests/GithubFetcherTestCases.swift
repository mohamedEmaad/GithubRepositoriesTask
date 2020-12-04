//
//  GithubFetcherTestCases.swift
//  GithubRepositoriesTaskTests
//
//  Created by Mohamed Emad on 12/4/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import XCTest

class GithubFetcherTestCases: XCTestCase {

    private var sut: RequestHandler?

    override func setUp() {
        sut = MockedRequestHandler()
    }

    func testSuccessResponse() {
        MockedRequestHandler.mockedData.data = mockedData
        MockedRequestHandler.mockedData.error = nil
        let expectation = XCTestExpectation(description: "success")
        self.sut?.execute(url: .testURL, requestType: .get, body: nil, completion: { (data, _, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 1.0)
    }

    func testCustomMessageError() {
        let errorMessage: String = "this is the test message"
        MockedRequestHandler.mockedData.data = nil
        MockedRequestHandler.mockedData.error = MainError.responseError(message: "this is the test message")
        let expectation = XCTestExpectation(description: "error")
        self.sut?.execute(url: .testURL, requestType: .get, body: nil, completion: { (data, _, error) in
            XCTAssertNil(data)
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.getErrorMessage(), errorMessage)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 1.0)
    }

}

final class MockedRequestHandler: RequestHandler {

    static var mockedData: (data: Data?, response: URLResponse?, error: Error?)

    func execute(url: URL, requestType: RequstType, body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completion(Self.mockedData.data, Self.mockedData.response, Self.mockedData.error)
    }
    
}
