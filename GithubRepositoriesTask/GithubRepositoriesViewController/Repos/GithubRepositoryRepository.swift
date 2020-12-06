//
//  GithubRepositoryRepoImp.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

final class GithubRepositoryRepository: GithubRepositoryReposioryInterface {

    private let requestHandler: RequestHandler
    private let responseDecoder: ResponseDecoder

    init(requestHandler: RequestHandler, responseDecoder: ResponseDecoder) {
        self.requestHandler = requestHandler
        self.responseDecoder = responseDecoder
    }

    func find(url: URL, with criteria: [String: Any?]?, completion: @escaping (Result<[Repository]?>) -> Void) {
        requestHandler.execute(url: url, requestType: .get, body: nil) { (data, _, error) in

            if let error = error {
                DispatchQueue.main.async {
                    completion(.error(errorMessage: error.getErrorMessage()))
                }

                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.error(errorMessage: "ReturnedData:Nil".localized))
                }

                return
            }

            var repositories: [Repository]? = self.responseDecoder.decode(of: [Repository].self, data: data)
            if let keyword = criteria?["keyword"] as? String {
                repositories = self.filterByKeyword(repositories: repositories, keyword: keyword)
            }

            repositories = self.appendDate(repositories: repositories)

            DispatchQueue.main.async {
                completion((repositories?.isEmpty ?? true) ? .error(errorMessage: "FilterRepositories:ErrorMessage".localized) : .success(repositories))
            }

        }
    }

    private func filterByKeyword(repositories: [Repository]?, keyword: String) -> [Repository]? {
        return repositories?.filter({ $0.name?.contains(keyword) ?? false })
    }

    private func appendDate(repositories: [Repository]?) -> [Repository]? {
        repositories?.forEach({
            let formattedData: String = self.convertDateFormater(
                date: Date.randomDate(daysBack: 2000)?.toString() ?? ""
            )
                $0.date = formattedData
        })

        return repositories
    }

    private func convertDateFormater(date: String) -> String {
        guard let filteredDate = date.toDate else {
            return date
        }

        let diffComponents: DateComponents = Calendar.current.dateComponents(
            [.month],
            from: filteredDate,
            to: Date()
        )

        if diffComponents.month ?? 0 > 6 {
            return MoreThanSixMonthDateFormatter.formatedData(date: filteredDate)
        }

        return LessThanSixMonthDateFormatter.formatedData(date: filteredDate)
    }

}
