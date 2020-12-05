//
//  GithubRepositoryRepoImp.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

final class GithubRepositoryRepoImp: GithubRepositoryRepo {

    private let requestHandler: RequestHandler
    private let responseDecoder: ResponseDecoder
    private let requestFilterer: RequestFilterer

    init(requestHandler: RequestHandler, responseDecoder: ResponseDecoder, requestFilterer: RequestFilterer) {
        self.requestHandler = requestHandler
        self.responseDecoder = responseDecoder
        self.requestFilterer = requestFilterer
    }

    func find(url: URL, with criteria: [String: Any?]?, completion: @escaping (Result<[Repository]?>) -> Void) {
        requestHandler.execute(url: url, requestType: .get, body: nil) { (data, response, error) in
            var result: Result<[Repository]?>
            if let error = error {
                result = .error(errorMessage: error.getErrorMessage())
            } else if let data = data {
                let allRepositories: [Repository]? = self.responseDecoder.decode(of: [Repository].self, data: data)
                let _repositories: [Repository]? = self.requestFilterer.filter(list: allRepositories, with: criteria)
                _repositories?.forEach({
                    let formattedData: String = self.convertDateFormater(date: Date.randomDate(daysBack: 2000)?.toString() ?? "")
                    $0.date = formattedData
                })
                result = (_repositories?.isEmpty ?? true) ? .error(errorMessage: "Sorry, No result for your search") : .success(_repositories)
            } else {
                result = .error(errorMessage: "Something went wrong please try again later")
            }
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }

    private func convertDateFormater(date: String) -> String {
        guard let filteredDate = date.toDate else {
            return date
        }
        let diffComponents: DateComponents = Calendar.current.dateComponents([.month], from: filteredDate, to: Date())
        if diffComponents.month ?? 0 > 6 {
            return MoreThanSixMonthDateFormatter.formatedData(date: filteredDate)
        } else {
            return LessThanSixMonthDateFormatter.formatedData(date: filteredDate)
        }
    }

}
