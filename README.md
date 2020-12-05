# GithubRepositoriesTask


## Requirements.
 - Check the [https://mail.google.com/mail/u/0/#inbox/FMfcgxwKjfBxsXWrNPHtjnCtlvTBgPTr?projector=1&messagePartId=0.1
 
## How it works
First I created an interface `RequestHandler` to retrieve the data from the api with `Data`.

Then I create a concrete implementation for this `RequestHandler` called `GithubFetcher`.

Now we need this `Data` response to be usable, so I created an interface `GithubRepositoryRepo` which is responsable for decoding this data using `ResponseDecoder` and also filtering these data to match user criteria using `RequestFilterer`.

Then I create a concrete implementation for this `GithubRepositoryRepo` called `GithubRepositoryRepoImp`.

And before all that we need an interface to process the request before sending it to `GithubRepositoryRepo`, here comes the  `GithubRepositoryService` which is responsible processing the request and take the result from `GithubRepositoryRepo` and  present it to  `GithubRepositoriesViewController`.

Finally the data is here and showed to the user.

And This is the trello board to show you how I split the task:
    https://trello.com/b/gU1YEKig/githubrepostask.
