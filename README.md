# PageRankr

Provides an easy way to retrieve Google Page Rank, Alexa Rank, and backlink counts.

## Exampes

### Backlinks
Backlinks are the result of doing a search with a query like "link:www.google.com". The number of returned results indicates how many sites point to that url.

`PageRankr.backlinks 'www.google.com', :google, :bing, :yahoo, :altavista, :alltheweb`
`    #=> {:google=>161000, :bing=>208000000, :yahoo=>256300062, :altavista=>110000000, :alltheweb=>55700000}`

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## TODO
* <strike>Get backlink counts for:</strike>
  * <strike>Google</strike>
  * <strike>Bing</strike>
  * <strike>Yahoo!</strike>
  * <strike>AltaVista</strike>
  * <strike>AllTheWeb</strike>
* Get Google Page Rank
  * Implement Hashing Algorithm
* Get Alexa ranking

## Copyright

Copyright (c) 2010 Allen Madsen. See LICENSE for details.