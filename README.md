# PageRankr

Provides an easy way to retrieve Google Page Rank, Alexa Rank, and backlink counts.

## Get it!

    gem install PageRankr
    
## Use it!

    require 'page_rankr'

### Backlinks

Backlinks are the result of doing a search with a query like "link:www.google.com". The number of returned results indicates how many sites point to that url.

    PageRankr.backlinks('www.google.com', :google, :bing) #=> {:google=>161000, :bing=>208000000}
    PageRankr.backlinks('www.google.com', :yahoo)         #=> {:yahoo=>256300062}
    
If you don't specify a search engine, then all of them are used.

    # this
    PageRankr.backlinks('www.google.com') 
        #=> {:google=>23000, :bing=>215000000, :yahoo=>250522337, :altavista=>137000000, :alltheweb=>74500000, :alexa=>727036} 
    
    # is equivalent to
    PageRankr.backlinks('www.google.com', :google, :bing, :yahoo, :altavista, :alltheweb, :alexa)
        #=> {:google=>23000, :bing=>215000000, :yahoo=>250522337, :altavista=>137000000, :alltheweb=>74500000, :alexa=>727036} 

You can also use the alias `backlink` instead of `backlinks`.
Valid search engines are: `:google, :bing, :yahoo, :altavista, :alltheweb, :alexa`. To get this list you can do:

    PageRankr.backlink_trackers #=> [:alexa, :alltheweb, :altavista, :bing, :google, :yahoo]

### Ranks

    PageRankr.ranks('www.google.com', :alexa, :google) #=> {:alexa=>1, :google=>10}
    
    # this also gives the same result
    PageRankr.ranks('www.google.com')                  #=> {:alexa=>1, :google=>10}

You can also use the alias `rank` instead of `ranks`.
There are two valid rank trackers supported: `:alexa, :google`. To get this you can do:

    PageRankr.rank_trackers #=> [:alexa, :google]

Alexa ranks are descending where 1 is the most popular. If a site has an alexa rank of 0 then the site is unranked.
Google page ranks are in the range 0-10 where 10 is the most popular. If a site is unindexed then the rank will be -1.

## Fix it!

If you ever find something is broken it should now be much easier to fix it with version >= 1.3.0. For example, if the xpath used to lookup a backlink is broken, just override the method for that class to provide the correct xpath.

    module PageRankr
      class Backlinks
        class Google < Backlink
          def xpath
            "my new awesome xpath"
          end
        end
      end
    end

## Extend it!

If you ever come across a site that provides a rank or backlinks you can hook that class up to automatically be use with PageRankr.

    module PageRankr
      class Backlinks
        class Foo < Backlink
          def url(site)
            "http://example.com/?q=#{site}"
          end
          
          def xpath
            "//backlinks/text()"
          end
          
          def clean(backlink_count)
            #do some of my own cleaning
            super(backlink_count) # strips letters, commas, and a few other nasty things and converts it to an integer
          end
        end
      end
    end
    
Then, just make sure you require the class and PageRankr and whenver you call PageRankr.backlinks it'll be able to use your class.

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
  * <del>Alexa</del>
* <del>Get Google Page Rank</del>
  * <del>Implement Hashing Algorithm</del>
* <del>Get Alexa ranking</del>
* Major refactorings (Version 2)

## Shout Out
Gotta give credit where credits due!

* http://github.com/alexmipego/PageRankSharp
* http://snipplr.com/view/18329/google-page-range-lookup/
* http://www.sitetoolcenter.com/free-website-scripts/ajax-pr-checker.php 

## Copyright

Copyright (c) 2010 Allen Madsen. See LICENSE for details.