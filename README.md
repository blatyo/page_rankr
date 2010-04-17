# PageRankr

Provides an easy way to retrieve Google Page Rank, Alexa Rank, and backlink counts.

## Exampes

### Backlinks
Backlinks are the result of doing a search with a query like "link:www.google.com". The number of returned results indicates how many sites point to that url.

`PageRankr.backlinks('www.google.com', :google, :bing) #=> {:google=>161000, :bing=>208000000}`

`PageRankr.backlinks('www.google.com', :yahoo)         #=> {:yahoo=>256300062}`

Valid search engines are: `:google, :bing, :yahoo, :altavista, :alltheweb`.

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## TODO
* <del>Get backlink counts for:</del>
  * <del>Google</del>
  * <del>Bing</del>
  * <del>Yahoo!</del>
  * <del>AltaVista</del>
  * <del>AllTheWeb</del>
* Get Google Page Rank
  * Implement Hashing Algorithm
* Get Alexa ranking

## Copyright

Copyright (c) 2010 Allen Madsen. See LICENSE for details.
