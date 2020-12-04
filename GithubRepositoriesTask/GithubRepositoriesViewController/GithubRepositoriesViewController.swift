//
//  GithubRepositoriesViewController.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import UIKit

final class GithubRepositoriesViewController: UIViewController {

    @IBOutlet private weak var githubRepositoriesTableView: UITableView!
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    private var githubRepositoryTableViewCellHeight: CGFloat = 69
    private let githubRepoService: GithubRepositoryService
    private var respositories: [Repository] = []

    init(githubRepoService: GithubRepositoryService) {
        self.githubRepoService = githubRepoService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.addSearchBarToNavigationControllerBar()
        self.getRepositories()
    }

    private func setupTableView() {
        self.githubRepositoriesTableView.dataSource = self
        self.githubRepositoriesTableView.delegate = self
        self.githubRepositoriesTableView.register(GithubRepositoryTableViewCell.nib, forCellReuseIdentifier: GithubRepositoryTableViewCell.identifier)
    }

    private func addSearchBarToNavigationControllerBar() {
        let searchBar: UISearchBar = self.searchBar()
        self.navigationItem.titleView = searchBar
    }

    private func searchBar() -> UISearchBar {
        let searchBar:UISearchBar = UISearchBar()
        searchBar.placeholder = "Enter your search"
        searchBar.autocapitalizationType = .none
        searchBar.searchTextField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        searchBar.searchTextField.textColor = UIColor.gray
        searchBar.searchTextField.clearButtonMode = .whileEditing
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        return searchBar
    }

    private func getRepositories(with keyword: String? = nil) {
        self.loadingIndicator.show()
        self.githubRepoService.find(criteria: ["keyword": keyword]) { [weak self] (repos, errorMessage) in
            if let repos = repos {
                self?.respositories = repos
                self?.showSuccessView()
            }
        }
    }

    private func showSuccessView() {
        self.loadingIndicator.hide()
        self.githubRepositoriesTableView.reloadData()
    }

}

extension GithubRepositoriesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.respositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let githubRepositoryTableViewCell: GithubRepositoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: GithubRepositoryTableViewCell.identifier, for: indexPath) as? GithubRepositoryTableViewCell else {
            return UITableViewCell()
        }
        githubRepositoryTableViewCell.setupView(with: self.respositories[indexPath.row])
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
        if (searchBar.text?.count ?? 0) > 1 {
            self.getRepositories(with: searchBar.text)
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        self.getRepositories()
    }

}
