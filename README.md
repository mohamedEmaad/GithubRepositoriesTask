# GithubRepositoriesTask
 
 
## Requirements.
 - Check the https://docs.google.com/document/d/1ccstZyPBeUnPfbjSPvf3LPYsKhFj9isISoayvBi4LqQ/edit?usp=sharing
 
## How it works
First I created an interface `RequestHandler` to retrieve the data from the api with `Data`.
 
Then I create a concrete implementation for this `RequestHandler` called `GithubFetcher`.
 
Now we need this `Data` response to be usable, so I created an interface `GithubRepositoryReposioryInterface` which is responsible for decoding this data using `ResponseDecoder` and also filtering these data to match user criteria.
 
Please note that the API doesn't return a date so I made a tweak by generating a random date for every item in  the response to be able to format it then.
 
Then I create a concrete implementation for this `GithubRepositoryReposioryInterface` called `GithubRepositoryRepository`.
 
And before all that we need an interface to process the request before sending it to `GithubRepositoryRepository`, here comes the  `GithubRepositoryServiceInterface` which is responsible processing the request and take the result from `GithubRepositoryReposioryInterface` and  present it to  `GithubRepositoriesViewController`.
 
Finally the data is here and showed to the user.
 
And This is the trello board to show you how I split the task:
    https://trello.com/b/gU1YEKig/githubrepostask.

