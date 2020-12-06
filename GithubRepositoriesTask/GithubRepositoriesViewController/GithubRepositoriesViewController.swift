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
    @IBOutlet private weak var emptyLabel: UILabel!

    private let githubRepositoryTableViewCellHeight: CGFloat = 69
    private let searchBarAlpha: CGFloat = 0.4
    private let githubRepositoryService: GithubRepositoryServiceInterface
    private var respositories: [Repository] = []

    init(githubRepositoryService: GithubRepositoryServiceInterface) {
        self.githubRepositoryService = githubRepositoryService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.addSearchBar()
        self.getRepositories()
    }

    private func setupTableView() {
        self.githubRepositoriesTableView.dataSource = self
        self.githubRepositoriesTableView.delegate = self
        self.githubRepositoriesTableView.register(
            GithubRepositoryTableViewCell.nib,
            forCellReuseIdentifier: GithubRepositoryTableViewCell.identifier
        )
        self.githubRepositoriesTableView.tableFooterView = UIView()
    }

    private func addSearchBar() {
        self.navigationItem.titleView = self.searchBar()
    }

    private func searchBar() -> UISearchBar {
        let searchBar:UISearchBar = UISearchBar()
        searchBar.placeholder = "SearchBar:placeHolder".localized
        searchBar.autocapitalizationType = .none
        searchBar.searchTextField.backgroundColor = UIColor.lightGray.withAlphaComponent(searchBarAlpha)
        searchBar.searchTextField.textColor = UIColor.gray
        searchBar.searchTextField.clearButtonMode = .whileEditing
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        
        return searchBar
    }

    private func getRepositories(with keyword: String? = nil) {
        self.loadingIndicator.show()

        self.githubRepositoryService.find(criteria: ["keyword": keyword]) {
            [weak self] (result) in

            self?.resolveFindResult(result)
        }
    }

    private func resolveFindResult(_ result: Result<[Repository]?>) {
        if case let Result.error(errorMessage) = result {
            self.respositories = []
            self.showErrorView(with: errorMessage)
            self.reloadView()

            return
        }

        guard case let Result.success(repos) = result else {
            return
        }
        self.respositories = repos ?? []
        self.showSuccessView()
        self.reloadView()
    }

    private func showSuccessView() {
        self.emptyLabel.isHidden = true
    }

    private func showErrorView(with errorMessage: String) {
        self.emptyLabel.isHidden = false
        self.emptyLabel.text = errorMessage
    }

    private func reloadView() {
        self.loadingIndicator.hide()
        self.githubRepositoriesTableView.reloadData()
    }

}

extension GithubRepositoriesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.respositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let githubRepositoryTableViewCell: GithubRepositoryTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: GithubRepositoryTableViewCell.identifier,
            for: indexPath
        ) as? GithubRepositoryTableViewCell else {
            return UITableViewCell()
        }

        githubRepositoryTableViewCell.setupView(
            with: self.getRepositoryByIndex(indexPath.row),
            imageLoader: self.getImageLoader(requestHandler: GithubFetcher(headers: nil))
        )

        return githubRepositoryTableViewCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let singleRepositoryViewController: SingleRepositoryViewController = SingleRepositoryViewController(
            repository: self.getRepositoryByIndex(indexPath.row),
            imageLoader: self.getImageLoader(requestHandler: GithubFetcher(headers: nil))
        )

        self.navigationController?.pushViewController(singleRepositoryViewController, animated: true)

        tableView.reloadData()
    }

    private func getRepositoryByIndex(_ index: Int) -> Repository {
        return self.respositories[index]
    }

    private func getImageLoader(requestHandler: RequestHandler) -> ImageLoader {
        let remoteImageLoader: ImageLoader = GithubUserImageLoader(requestHandler: GithubFetcher(headers: nil))

        return CachedImageLoader(cacheImage: imageCache, remoteImageLoader: remoteImageLoader)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.githubRepositoryTableViewCellHeight
    }

}

extension GithubRepositoriesViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if (searchBar.text?.count ?? 0) < 1 {
            return
        }

        self.getRepositories(with: searchBar.text)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        
        self.getRepositories()
    }

}
