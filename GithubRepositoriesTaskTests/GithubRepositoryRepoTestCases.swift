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
        MockedRequestHandler.mockedData.data = self.mockedDataFactory()
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

    private func mockedDataFactory() -> Data? {
        let testBundle = Bundle(for: type(of: self))
        let filepath = testBundle.path(forResource: "LocalRepositories", ofType: "txt")!
        let url = URL(fileURLWithPath: filepath)
        let mockedData = try? Data(contentsOf: url)
        return mockedData
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
