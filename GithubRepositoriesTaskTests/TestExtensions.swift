//
//  TestExtensions.swift
//  GithubRepositoriesTaskTests
//
//  Created by Mohamed Emad on 12/4/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import XCTest

extension URL {

    @inlinable static var testURL: URL {
        URL(string: .baseUrl)!
    }
    
}


extension XCTestCase {

    var mockedData: Data? {
        let testBundle = Bundle(for: type(of: self))
        let filepath = testBundle.path(forResource: "LocalRepositories", ofType: "txt")!
        let url = URL(fileURLWithPath: filepath)
        let mockedData = try? Data(contentsOf: url)
        return mockedData
    }
    
}
