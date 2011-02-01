# PageRankr

Provides an easy way to retrieve Google Page Rank, Alexa Rank, and backlink counts.

Check out a little [web app][1] I wrote up that uses it or look at the [source][2].

[1]: http://isitpopular.heroku.com
[2]: http://github.com/blatyo/is_it_popular

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

### Indexes

Indexes are the result of doing a search with a query like "site:www.google.com". The number of returned results indicates how many pages of a domain are indexed by a particular search engine.

    PageRankr.indexes('www.google.com', :google)       #=> {:google=>4860000}
    PageRankr.indexes('www.google.com', :bing)         #=> {:bing=>2120000}

If you don't specify a search engine, then all of them are used.

    # this
    PageRankr.indexes('www.google.com')
        #=> {:bing=>2120000, :google=>4860000}

    # is equivalent to
    PageRankr.indexes('www.google.com', :google, :bing)
        #=> {:bing=>2120000, :google=>4860000}

You can also use the alias `index` instead of `indexes`.
Valid search engines are: `:google, :bing`. To get this list you can do:

    PageRankr.index_trackers #=> [:alexa, :alltheweb, :altavista, :bing, :google, :yahoo]

### Ranks

    PageRankr.ranks('www.google.com', :alexa, :google) #=> {:alexa=>{:us=>1, :global=>1}, :google=>10}

    # this also gives the same result
    PageRankr.ranks('www.google.com')                  #=> {:alexa=>{:us=>1, :global=>1}, :google=>10}

You can also use the alias `rank` instead of `ranks`.
There are two valid rank trackers supported: `:alexa, :google`. To get this you can do:

    PageRankr.rank_trackers #=> [:alexa, :google]

Alexa ranks are descending where 1 is the most popular. If a site has an alexa rank of 0 then the site is unranked.
Google page ranks are in the range 0-10 where 10 is the most popular. If a site is unindexed then the rank will be -1.

## Fix it!

If you ever find something is broken it should now be much easier to fix it with version >= 1.3.0. For example, if the xpath used to lookup a backlink is broken, just override the method for that class to provide the correct xpath.

    module PageRankr
      class Backlinks < Tracker
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
      class Backlinks < Tracker
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

Then, just make sure you require the class and PageRankr and whenever you call PageRankr.backlinks it'll be able to use your class.

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## TODO Version 2
* Use API's where possible
* Use [Typhoeus](https://github.com/pauldix/typhoeus) to improve speed when requesting multiple ranks and/or backlinks
* Configuration
    * Optionally use API keys

## Contributors
* [Druwerd](http://github.com/Druwerd) - Use Google Search API instead of scraping.

## Shout Out
Gotta give credit where credits due!

* [http://github.com/alexmipego/PageRankSharp](http://github.com/alexmipego/PageRankSharp)
* [http://snipplr.com/view/18329/google-page-range-lookup/](http://snipplr.com/view/18329/google-page-range-lookup/)
* [http://www.sitetoolcenter.com/free-website-scripts/ajax-pr-checker.php](http://www.sitetoolcenter.com/free-website-scripts/ajax-pr-checker.php)

## Copyright

Copyright (c) 2010 Allen Madsen. See LICENSE for details.