# GithubRepositoriesTask


## Requirements.
 - Check the https://docs.google.com/document/d/1ccstZyPBeUnPfbjSPvf3LPYsKhFj9isISoayvBi4LqQ/edit?usp=sharing
 
## How it works
First I created an interface `RequestHandler` to retrieve the data from the api with `Data`.

Then I create a concrete implementation for this `RequestHandler` called `GithubFetcher`.

Now we need this `Data` response to be usable, so I created an interface `GithubRepositoryReposioryInterface` which is responsable for decoding this data using `ResponseDecoder` and also filtering these data to match user criteria.

Then I create a concrete implementation for this `GithubRepositoryReposioryInterface` called `GithubRepositoryRepository`.

And before all that we need an interface to process the request before sending it to `GithubRepositoryRepository`, here comes the  `GithubRepositoryServiceInterface` which is responsible processing the request and take the result from `GithubRepositoryReposioryInterface` and  present it to  `GithubRepositoriesViewController`.

Finally the data is here and showed to the user.

And This is the trello board to show you how I split the task:
    https://trello.com/b/gU1YEKig/githubrepostask.
