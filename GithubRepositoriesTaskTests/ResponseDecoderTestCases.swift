//
//  ResponseDecoderTestCases.swift
//  GithubRepositoriesTaskTests
//
//  Created by Mohamed Emad on 12/4/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import XCTest

class ResponseDecoderTestCases: XCTestCase {

    private var sut: ResponseDecoder!

    override func setUp() {
        self.sut = GithubRepositoriesDecoder()
    }

    func testValidDecoding() {
        guard let mockedData = mockedData else {
            return
        }
        let mockedDecodedData: Decodable? = sut.decode(of: [Repository].self, data: mockedData)
        XCTAssertTrue(mockedDecodedData is [Repository])
    }

    func testInvalidDecoding() {
        guard let mockedData = mockedData else {
            return
        }
        let mockedDecodedData: Decodable? = sut.decode(of: [String].self, data: mockedData)
        XCTAssertNil(mockedDecodedData)
    }

}
