//
//  MoreThanSixMonthDateFormatter.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/4/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

final class MoreThanSixMonthDateFormatter: GithubRepoDateFormatter {

    static func formatedData(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        return formatter.string(from: date)
    }

}
