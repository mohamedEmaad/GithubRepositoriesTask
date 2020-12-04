//
//  GithubRepositoryRepoTestCases.swift
//  GithubRepositoriesTaskTests
//
//  Created by Mohamed Emad on 12/4/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import XCTest

class GithubRepositoryRepoTestCases: XCTestCase {

    private var sut: GithubRepositoryRepo!

    override func setUp() {
        let requestHandler: RequestHandler = MockedRequestHandler()
        let responseDecoder: ResponseDecoder = GithubRepositoriesDecoder()
        let requestFilterer: RequestFilterer = GithubRepositoryRequestFilterer()
        sut = GithubRepositoryRepoImp(requestHandler: requestHandler, responseDecoder: responseDecoder, requestFilterer: requestFilterer)
    }

    func testSuccessfullData() {
        MockedRequestHandler.mockedData.data = mockedData
        MockedRequestHandler.mockedData.error = nil
        let expectation = XCTestExpectation(description: "success")
        sut.find(url: .testURL, with: nil) { (repos, error) in
            XCTAssertNotNil(repos)
            XCTAssertTrue(!(repos?.isEmpty ?? true))
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }

    func testFilteredSuccessfullData() {
        MockedRequestHandler.mockedData.data = mockedData
        MockedRequestHandler.mockedData.error = nil
        let expectation = XCTestExpectation(description: "success")
        let filteredKeyword: String = "gr"
        sut.find(url: .testURL, with: ["keyword": filteredKeyword]) { (repos, error) in
            XCTAssertNotNil(repos)
            XCTAssertTrue(!(repos?.isEmpty ?? true))
            repos?.forEach({ XCTAssertTrue($0.name?.contains(filteredKeyword) ?? false) })
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }

    func testOfflineError() {
        MockedRequestHandler.mockedData.data = nil
        MockedRequestHandler.mockedData.error = MainError.offline
        let expectation = XCTestExpectation(description: "success")
        sut.find(url: .testURL, with: nil) { (repos, error) in
            XCTAssertNil(repos)
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.getErrorMessage(), MainError.offline.getErrorMessage())
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }

}

final class MockedGithubRepositoryRepo: GithubRepositoryRepo {

    func find(url: URL, with criteria: [String : Any?]?, completion: @escaping ([Repository]?, Error?) -> Void) {
    }

}
