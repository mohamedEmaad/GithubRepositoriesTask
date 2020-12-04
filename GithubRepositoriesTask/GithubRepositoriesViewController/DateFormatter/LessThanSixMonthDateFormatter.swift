//
//  LessThanSixMonthDateFormatter.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/4/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

final class LessThanSixMonthDateFormatter: GithubRepoDateFormatter {

    static func formatedData(date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }

}
