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

extension UIActivityIndicatorView {

    func show() {
        self.isHidden = false
        self.startAnimating()
    }

    func hide() {
        self.isHidden = true
        self.stopAnimating()
    }
    
}

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                if response?.url == url {
                    self?.image = image
                }
            }
        }.resume()
    }

    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }

}
