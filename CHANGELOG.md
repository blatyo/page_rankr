# Change Log

## Version 4.1.1
* Fix issue where Google Rank tracker did not pass options to request.

## Version 4.1.0
* Add Alexa Country rank.

## Version 4.0.0
* Fix for Google pagerank check. Query parts were omitted which made the some pages get the same PR as the domain.
* Switch from Typheous to HTTParty to avoid memory leaks and have better support on Windows.

## Version 3.2.1
* Fix issue where tracker calls proxy with class name rather than name defined on class instance.

## Version 3.2.0
* Added proxy service
* Removed Compete rank tracker, because there is no way to get it without a key now
* Fixed google backlinks and indexes

## Version 3.1.2
* Fix issue with URI parse in 1.9.3

## Version 3.1.1
* Fix google backlinks and indexes

## Version 3.1.0
* Add yahoo index back
* Fix yahoo and google backlinks and indexes
* Improve PageRankr::Site to support different levels of specificity

## Version 3.0.2
* Update gem dependencies

## Version 3.0.1
* Improve PageRankr::Site

## Version 3.0.0
* Refactor
    * Move the logic for the typhoeus request out of the individual trackers in Tracker to hide the complexity.
    * Create Tracker to encapsulate the common logic in Backlink, Tracker, and Rank.
    * Have each file declare it's dependencies, so that it is simple to use a la carte.
* Fix google backlink and index. The search API is deprecated and the new API is annoying to setup, so webscraping has been brought back.
* Make requires consistent.
* API Breakages
    * Tracker was renamed to Trackers and a new Tracker file was created that represents a different object.

## Version 2.0.4
* Fix google page rank url

## Version 2.0.3
* Fix Compete scraper

## Version 2.0.2
* Update public_suffix_service gem

## Version 2.0.1
* Alexa sometimes returns result for the incorrect site. In this case, the results returned are ignored.

## Version 2.0.0
* URL validation
* Parallel requests = way faster!
* Not tracked returns nil
* Alexa US and Global are treated as separate trackers and returned results are a single level hash.
* Removed Altavista and AllTheWeb because they now direct to yahoo.
* Changed some classes to modules so that it wasn't necessary to specify them when opening the class.

## Version 1.7.1
* Catches exception thrown when doing compete rank lookup with url not in the form "google.com".

## Version 1.7.0
* Merged in additions from iteration labs to add compete rank tracker and domain indexes.

## Version 1.6.0

* Added ability to get global alexa rank instead of just us alexa rank.

## Version 1.5.1

* Added json gem requirement for rubies < 1.9

## Version 1.5.0

* Use googles api to retrieve backlinks.
* Changed workflow for building gems.

## Version 1.4.3

* Fixed google backlink lookup where odd invalid urls were getting high results. For example, "gaybuttfuckers". Thanks to Zach Elko.

## Version 1.4.2

* Fixed bug where sites not tracked by google were returning nil instead of -1.

## Version 1.4.1

* Broken

## Version 1.4.0

* Made it easier to get at the list of supported trackers.
* Refactoring

## Version 1.3.0

* Lots of refactoring. Should be much easier to extend and temporarily fix if needed.

## Version 1.2.0

* Changed backlinks method with no search engines specified to use all of them
* Changed ranks method with no search engines specified to use all of them
* Added alias rank for ranks
* Added alias backlink for backlinks

## Version 1.1.0

* Fixed google xpath for backlinks