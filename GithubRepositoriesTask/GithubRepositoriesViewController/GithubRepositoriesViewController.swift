//
//  GithubRepositoriesViewController.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import UIKit

class GithubRepositoriesViewController: UIViewController {

    @IBOutlet private weak var githubRepositoriesTableView: UITableView!
    private var githubRepositoryTableViewCellHeight: CGFloat = 69

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.addSearchBarToNavigationControllerBar()
    }

    private func setupTableView() {
        self.githubRepositoriesTableView.dataSource = self
        self.githubRepositoriesTableView.delegate = self
        self.githubRepositoriesTableView.tableFooterView = UIView() // this to hide tableview seperators if it is empty.
        self.githubRepositoriesTableView.register(GithubRepositoryTableViewCell.nib, forCellReuseIdentifier: GithubRepositoryTableViewCell.identifier)
    }

    private func addSearchBarToNavigationControllerBar() {
        let searchBar: UISearchBar = self.searchBar()
        self.navigationItem.titleView = searchBar
    }

    private func searchBar() -> UISearchBar {
        let searchBar:UISearchBar = UISearchBar()
        searchBar.placeholder = "Enter your search"
        searchBar.searchTextField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        searchBar.searchTextField.textColor = UIColor.gray
        searchBar.searchTextField.clearButtonMode = .whileEditing
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        return searchBar
    }

}

extension GithubRepositoriesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let githubRepositoryTableViewCell: GithubRepositoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: GithubRepositoryTableViewCell.identifier, for: indexPath) as? GithubRepositoryTableViewCell else {
            return UITableViewCell()
        }
        return githubRepositoryTableViewCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: Handle the action of tableview item select.
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.githubRepositoryTableViewCellHeight
    }

}

extension GithubRepositoriesViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //TODO: Handle the clicking on search button.
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //TODO: Handle the clicking on cancel button.
    }

}
