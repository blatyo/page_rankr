# PageRankr [![Build Status](http://travis-ci.org/blatyo/page_rankr.png)](http://travis-ci.org/blatyo/page_rankr)

Provides an easy way to retrieve Google Page Rank, Alexa Rank, backlink counts, and index counts.

Check out a little [web app][1] I wrote up that uses it or look at the [source][2].

[1]: http://isitpopular.heroku.com
[2]: https://github.com/blatyo/is_it_popular

## Get it!

``` bash
    gem install PageRankr
```

## Use it!

``` ruby
    require 'page_rankr'
```

### Backlinks

Backlinks are the result of doing a search with a query like "link:www.google.com". The number of returned results indicates how many sites point to that url. If a site is not tracked then `nil` is returned.

``` ruby
    PageRankr.backlinks('www.google.com', :google, :bing) #=> {:google=>161000, :bing=>208000000}
    PageRankr.backlinks('www.google.com', :yahoo)         #=> {:yahoo=>256300062}
```

If you don't specify a search engine, then all of them are used.

``` ruby
    # this
    PageRankr.backlinks('www.google.com')
        #=> {:google=>23000, :bing=>215000000, :yahoo=>250522337, :alexa=>727036}

    # is equivalent to
    PageRankr.backlinks('www.google.com', :google, :bing, :yahoo, :alexa)
        #=> {:google=>23000, :bing=>215000000, :yahoo=>250522337, :alexa=>727036}
```

You can also use the alias `backlink` instead of `backlinks`.

Valid search engines are: `:google, :bing, :yahoo, :alexa` (altavista and alltheweb now redirect to yahoo). To get this list you can do:

``` ruby
    PageRankr.backlink_trackers #=> [:alexa, :bing, :google, :yahoo]
```

### Indexes

Indexes are the result of doing a search with a query like "site:www.google.com". The number of returned results indicates how many pages of a domain are indexed by a particular search engine. If the site is not indexed `nil` is returned.

``` ruby
    PageRankr.indexes('www.google.com', :google)       #=> {:google=>4860000}
    PageRankr.indexes('www.google.com', :bing)         #=> {:bing=>2120000}
```

If you don't specify a search engine, then all of them are used.

``` ruby
    # this
    PageRankr.indexes('www.google.com')
        #=> {:bing=>2120000, :google=>4860000}

    # is equivalent to
    PageRankr.indexes('www.google.com', :google, :bing)
        #=> {:bing=>2120000, :google=>4860000}
```

You can also use the alias `index` instead of `indexes`.

Valid search engines are: `:google, :bing`. To get this list you can do:

``` ruby
    PageRankr.index_trackers #=> [:bing, :google]
```

### Ranks

Ranks are ratings assigned to specify how popular a site is. The most famous example of this is the google page rank.

``` ruby
    PageRankr.ranks('www.google.com', :google)        #=> {:google=>10}
```

If you don't specify a rank provider, then all of them are used.

``` ruby
    PageRankr.ranks('www.google.com', :alexa_us, :alexa_global, :compete, :google)
        #=> {:alexa_us=>1, :alexa_global=>1, :google=>10, :compete=>1}

    # this also gives the same result
    PageRankr.ranks('www.google.com')
        #=> {:alexa_us=>1, :alexa_global=>1, :google=>10, :compete=>1}
```

You can also use the alias `rank` instead of `ranks`.

Valid rank trackers are: `:alexa_us, :alexa_global, :compete, :google`. To get this you can do:

``` ruby
    PageRankr.rank_trackers #=> [:alexa_global, :alexa_us, :compete, :google]
```

Alexa and Compete ranks are descending where 1 is the most popular. Google page ranks are in the range 0-10 where 10 is the most popular. If a site is unindexed then the rank will be nil.

## Use it a la carte!

From versions >= 3, everything should be usable in a much more a la carte manner. If all you care about is google page rank (which I speculate is common) you can get that all by itself:

``` ruby
    require 'page_rankr/ranks/google'

    tracker = PageRankr::Ranks::Google.new("myawesomesite.com")
    tracker.run #=> 2
```

Also, once a tracker has run three values will be accessible from it:

``` ruby
    # The value extracted. Tracked is aliased to rank for PageRankr::Ranks, backlink for PageRankr::Backlinks, and index for PageRankr::Indexes.
    tracker.tracked #=> 2

    # The value extracted with the jsonpath, xpath, or regex before being cleaned.
    tracker.raw     #=> "2"

    # The body of the response
    tracker.body    #=> "<html><head>..."
```

## Fix it!

If you ever find something is broken it should now be much easier to fix it with version >= 1.3.0. For example, if the xpath used to lookup a backlink is broken, just override the method for that class to provide the correct xpath.

``` ruby
    module PageRankr
      class Backlinks
        class Bing
          def xpath
            "//my/new/awesome/@xpath"
          end
        end
      end
    end
```

## Extend it!

If you ever come across a site that provides a rank or backlinks you can hook that class up to automatically be use with PageRankr. PageRankr does this by looking up all the classes namespaced under Backlinks, Indexes, and Ranks.

``` ruby
    require 'page_rankr/backlink'

    module PageRankr
      class Backlinks
        class Foo
          include Backlink

          # This method is required
          def url
            "http://example.com/"
          end

          # This method specifies the parameters for the url. It is optional, but likely required for the class to be useful.
          def params
            {:q => @site.to_s}
          end

          # You can use a method named either xpath, jsonpath, or regex with the appropriate query type
          def xpath
            "//backlinks/text()"
          end

          # Optionally, you could override the clean method if the current implementation isn't sufficient
          # def clean(backlink_count)
          #   #do some of my own cleaning
          #   super(backlink_count) # strips non-digits and converts it to an integer or nil
          # end
        end
      end
    end

    PageRankr::Backlinks::Foo.new("myawesomesite.com").run #=> 3
    PageRankr.backlinks("myawesomesite.com", :foo)[:foo]   #=> 3
```

Then, just make sure you require the class and PageRankr and whenever you call PageRankr.backlinks it'll be able to use your class.

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## TODO Version 3-4
* Use API's where possible
* New Compete API
* Some search engines throttle the amount of queries. It would be nice to know when this happens. Probably throw an exception.

## Contributors
* [Dru Ibarra](https://github.com/Druwerd) - Use Google Search API instead of scraping.
* [Iteration Labs, LLC](https://github.com/iterationlabs) - Compete rank tracker and domain indexes.
* [Marc Seeger](http://www.marc-seeger.de) ([Acquia](http://www.acquia.com)) - Ignore invalid ranks that Alexa returns for incorrect sites.
* [Rémy Coutable](https://github.com/rymai) - Update public_suffix_service gem
* [Jonathan Rudenberg](https://github.com/titanous) - Fix compete scraper
* [Chris Corbyn](https://github.com/d11wtq) - Fix google page rank url

## Shout Out
Gotta give credit where credits due!

Original inspiration from:

* [PageRankSharp](https://github.com/alexmipego/PageRankSharp)
* [Google Page Range Lookup/](http://snipplr.com/view/18329/google-page-range-lookup/)
* [AJAX PR Checker](http://www.sitetoolcenter.com/free-website-scripts/ajax-pr-checker.php)

## Copyright

Copyright (c) 2010 Allen Madsen. See LICENSE for details.