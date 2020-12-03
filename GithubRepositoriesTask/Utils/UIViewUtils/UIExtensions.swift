//
//  UIExtensions.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {

    static var nib: UINib {
        return UINib(nibName: Self.identifier, bundle: nil)
    }

    static var identifier : String {
        return String(describing: self)
    }
    
}
