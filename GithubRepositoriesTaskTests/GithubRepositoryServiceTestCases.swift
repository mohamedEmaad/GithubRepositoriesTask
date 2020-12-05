//
//  GithubRepositoryServiceTestCases.swift
//  GithubRepositoriesTaskTests
//
//  Created by Mohamed Emad on 12/4/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import XCTest

class GithubRepositoryServiceTestCases: XCTestCase {

    private var sut: GithubRepositoryService!

    override func setUp() {
        let requestHandler: RequestHandler = MockedRequestHandler()
        let responseDecoder: ResponseDecoder = GithubRepositoriesDecoder()
        let requestFilterer: RequestFilterer = GithubRepositoryRequestFilterer()
        let githubRepositoryRepo: GithubRepositoryRepo = GithubRepositoryRepoImp(requestHandler: requestHandler, responseDecoder: responseDecoder, requestFilterer: requestFilterer)
        self.sut = GithubRepositoryServiceImp(githubRepositoryRepo: githubRepositoryRepo)
    }

    func testSuccessReturnedData() {
        MockedRequestHandler.mockedData.data = mockedData
        MockedRequestHandler.mockedData.error = nil
        let expectation = XCTestExpectation(description: "success")
        sut.find(criteria: nil) { (result) in
            guard case let Result.success(repositories) = result else {
                XCTAssertThrowsError("Unexpected type")
                return
            }
            XCTAssertNotNil(repositories)
            XCTAssertTrue(!(repositories?.isEmpty ?? true))
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }

    func testCustomErrorMessage() {
        let customErrorMessage: String = "Testing the error"
        MockedRequestHandler.mockedData.data = nil
        MockedRequestHandler.mockedData.error = MainError.responseError(message: customErrorMessage)
        let expectation = XCTestExpectation(description: "success")
        sut.find(criteria: nil) { (result) in
            guard case let Result.error(errorMessage) = result else {
                XCTAssertThrowsError("Unexpected type")
                return
            }
            XCTAssertNotNil(errorMessage)
            XCTAssertEqual(errorMessage, customErrorMessage)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }

}
