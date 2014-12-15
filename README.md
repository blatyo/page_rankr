# PageRankr [![Build Status](https://api.travis-ci.org/blatyo/page_rankr.png)](http://travis-ci.org/blatyo/page_rankr)

Provides an easy way to retrieve Google Page Rank, Alexa Rank, backlink counts, index counts and different types of social signals.

I'm looking for co-maintainers. If you'd like to help maintain this project, let me know.

__Note: Version ~> 2.0 and ~> 3.0 used typheous internally which caused memory leak issues and failures on windows. 4.0.0 changes the implementation to use a Net::HTTP based library for better compatability.__

__Note: Version >= 4.1.0 no longer actively maintains compatibility with Ruby 1.8.X. It will probably still work for the time being.__

__Note: Version >= 4.2.0 no longer actively maintains compatibility with Ruby < 1.9.3. It will probably still work, but you may need to specify older versions for gems this library depends on in your Gemfile.__

Check out a little [web app][1] I wrote up that uses it or look at the [source][2].

[1]: http://isitpopular.heroku.com
[2]: https://github.com/blatyo/is_it_popular

## Get it!

``` bash
    gem install PageRankr
```

## Gemfile

``` ruby
    gem 'PageRankr'
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
        #=> {:bing=>2120000, :google=>4860000, :yahoo => 4863000}

    # is equivalent to
    PageRankr.indexes('www.google.com', :google, :bing, :yahoo)
        #=> {:bing=>2120000, :google=>4860000, :yahoo => 4863000}
```

You can also use the alias `index` instead of `indexes`.

Valid search engines are: `:google, :bing, :yahoo`. To get this list you can do:

``` ruby
    PageRankr.index_trackers #=> [:bing, :google, :yahoo]
```

### Ranks

Ranks are ratings assigned to specify how popular a site is. The most famous example of this is the google page rank.

``` ruby
    PageRankr.ranks('www.google.com', :google)        #=> {:google=>10}
```

If you don't specify a rank provider, then all of them are used.

``` ruby
    PageRankr.ranks('www.google.com', :alexa_us, :alexa_global, :google, :moz_rank, :page_authority)
        #=> {:alexa_us=>1, :alexa_global=>1, :alexa_country=>1, :google=>10, :moz_rank => 8, :page_authority => 97}

    # this also gives the same result
    PageRankr.ranks('www.google.com')
        #=> {:alexa_us=>1, :alexa_global=>1, :alexa_country=>1, :google=>9, :moz_rank=>8, :domain_authority=>100, :page_authority=>96}
```

You can also use the alias `rank` instead of `ranks`.

Valid rank trackers are: `:alexa_country, :alexa_global, :alexa_us, :google, :moz_rank, :page_authority`. To get this you can do:

``` ruby
    PageRankr.rank_trackers #=> [:alexa_us, :alexa_global, :alexa_country, :google, :moz_rank, :domain_authority, :page_authority]
```

Alexa ranks are descending where 1 is the most popular. Google page ranks are in the range 0-10 where 10 is the most popular. If a site is unindexed then the rank will be nil.

### Socials

Social signals are a somewhat oversimplified way of telling how popular a site or page currently is.

``` ruby
    PageRankr.socials('www.google.com', :linked_in)        #=> {:linked_in=>1001}
```

If you don't specify a social tracker, then all of them are used.

``` ruby
    PageRankr.socials('www.google.com', :google, :linked_in, :pinterest, :stumbled_upon, :twitter, :vk)
        #=> {:google=>10000, :linked_in=>1001, :pinterest=>75108, :stumple_upon=>255078, :twitter=>21933764, :vk=>3725}

    # this also gives the same result
    PageRankr.socials('www.google.com')
        #=> {:google=>10000, :linked_in=>1001, :pinterest=>75108, :stumble_upon=>255078, :twitter=>21933764, :vk=>3725}
```

Valid social trackers are: `:google, :linked_in, :pinterest, :stumble_upon, :twitter, :vk`. To get this you can do:

``` ruby
    PageRankr.social_trackers #=> [:google, :linked_in, :pinterest, :stumble_upon, :twitter, :vk]
```


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

## Rate limiting and proxies

One of the annoying things about each of these services is that they really don't like you scraping data from them. In order to deal with this issue, they throttle traffic from a single machine. The simplest way to get around this is to use proxy machines to make the requests.

In PageRankr >= 3.2.0, this is much simpler. The first thing you'll need is a proxy service. Two are provided [here](https://github.com/blatyo/page_rankr/tree/master/lib/page_rankr/proxy_services). A proxy service must define a `proxy` method that takes two arguments. It should return a string like `http://user:password@192.168.1.1:50501`.

Once you have a proxy service, you can tell PageRankr to use it. For example:

``` ruby
    PageRankr.proxy_service = PageRankr::ProxyServices::Random.new([
      'http://user:password@192.168.1.1:50501',
      'http://user:password@192.168.1.2:50501'
    ])
```

Once PageRankr knows about your proxy service, any request that is made will ask for a proxy from the proxy service. It does this by calling the `proxy` method. When it calls the `proxy` method, it passed the name of the tracker (e.g. `:ranks_google`) and the site that is being looked up. Hopefully, this information is sufficient for you to build a much smarter proxy service than the ones provided (pull requests welcome!).

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
            {:q => tracked_url}
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
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## TODO Version 5
* Detect request throttling

## Shout Out
Gotta give credit where credits due!

Original inspiration from:

* [PageRankSharp](https://github.com/alexmipego/PageRankSharp)
* [Google Page Range Lookup/](http://snipplr.com/view/18329/google-page-range-lookup/)
* [AJAX PR Checker](http://www.sitetoolcenter.com/free-website-scripts/ajax-pr-checker.php)

## Copyright

Copyright (c) 2010 Allen Madsen. See LICENSE for details.
