# PageRankr

Provides an easy way to retrieve Google Page Rank, Alexa Rank, backlink counts, and index counts.

Check out a little [web app][1] I wrote up that uses it or look at the [source][2].

[1]: http://isitpopular.heroku.com
[2]: https://github.com/blatyo/is_it_popular

## Get it!

    gem install PageRankr

## Use it!

    require 'page_rankr'

### Backlinks

Backlinks are the result of doing a search with a query like "link:www.google.com". The number of returned results indicates how many sites point to that url. If a site is not tracked then `nil` is returned.

    PageRankr.backlinks('www.google.com', :google, :bing) #=> {:google=>161000, :bing=>208000000}
    PageRankr.backlinks('www.google.com', :yahoo)         #=> {:yahoo=>256300062}

If you don't specify a search engine, then all of them are used.

    # this
    PageRankr.backlinks('www.google.com')
        #=> {:google=>23000, :bing=>215000000, :yahoo=>250522337, :alexa=>727036}

    # is equivalent to
    PageRankr.backlinks('www.google.com', :google, :bing, :yahoo, :alexa)
        #=> {:google=>23000, :bing=>215000000, :yahoo=>250522337, :alexa=>727036}

You can also use the alias `backlink` instead of `backlinks`.

Valid search engines are: `:google, :bing, :yahoo, :alexa` (altavista and alltheweb now redirect to yahoo). To get this list you can do:

    PageRankr.backlink_trackers #=> [:alexa, :bing, :google, :yahoo]

### Indexes

Indexes are the result of doing a search with a query like "site:www.google.com". The number of returned results indicates how many pages of a domain are indexed by a particular search engine. If the site is not indexed `nil` is returned.

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

    PageRankr.index_trackers #=> [:bing, :google]

### Ranks

Ranks are ratings assigned to specify how popular a site is. The most famous example of this is the google page rank.

    PageRankr.ranks('www.google.com', :google)        #=> {:google=>10}

If you don't specify a rank provider, then all of them are used.

    PageRankr.ranks('www.google.com', :alexa_us, :alexa_global, :compete, :google)
        #=> {:alexa_us=>1, :alexa_global=>1, :google=>10, :compete=>1}

    # this also gives the same result
    PageRankr.ranks('www.google.com')
        #=> {:alexa_us=>1, :alexa_global=>1, :google=>10, :compete=>1}

You can also use the alias `rank` instead of `ranks`.

Valid rank trackers are: `:alexa_us, :alexa_global, :compete, :google`. To get this you can do:

    PageRankr.rank_trackers #=> [:alexa_global, :alexa_us, :compete, :google]

Alexa and Compete ranks are descending where 1 is the most popular. Google page ranks are in the range 0-10 where 10 is the most popular. If a site is unindexed then the rank will be nil.

## Fix it!

If you ever find something is broken it should now be much easier to fix it with version >= 1.3.0. For example, if the xpath used to lookup a backlink is broken, just override the method for that class to provide the correct xpath.

    module PageRankr
      class Backlinks
        class Bing
          def xpath
            "//my/new/awesome/@xpath"
          end
        end
      end
    end

## Extend it!

If you ever come across a site that provides a rank or backlinks you can hook that class up to automatically be use with PageRankr. PageRankr does this by looking up all the classes namespaced under Backlinks, Indexes, and Ranks.

    module PageRankr
      class Backlinks
        class Foo
          include Backlink

          def request
            @request ||= Typhoeus::Request.new("http://example.com/",
                :params => {:q => @site.to_s})
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

## TODO Version 3
* Use API's where possible
* Configuration
    * Optionally use API keys
    * Maybe allow API key cycling to get around query limits
* Google search API is deprecated
* Some search engines throttle the amount of queries. It would be nice to know when this happens. Probably throw an exception.

## Contributors
* [Dru Ibarra](https://github.com/Druwerd) - Use Google Search API instead of scraping.
* [Iteration Labs, LLC](https://github.com/iterationlabs) - Compete rank tracker and domain indexes.
* [Marc Seeger](http://www.marc-seeger.de)([Acquia](http://www.acquia.com)) - Ignore invalid ranks that Alexa returns for incorrect sites.

## Shout Out
Gotta give credit where credits due!

Original inspiration from:
* [PageRankSharp](https://github.com/alexmipego/PageRankSharp)
* [Google Page Range Lookup/](http://snipplr.com/view/18329/google-page-range-lookup/)
* [AJAX PR Checker](http://www.sitetoolcenter.com/free-website-scripts/ajax-pr-checker.php)

## Copyright

Copyright (c) 2010 Allen Madsen. See LICENSE for details.