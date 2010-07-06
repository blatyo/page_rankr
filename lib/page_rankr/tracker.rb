module PageRankr
  class Tracker
    attr_accessor :site_trackers
    
    def initialize
      @site_trackers = self.class.constants.collect{|tracker| tracker.to_s.downcase.to_sym}
    end

    def lookup(site, *trackers)
      trackers = site_trackers if trackers.empty?
      
      tracked = {}
      trackers.each do |tracker|
        name, klass = tracker.to_s.capitalize, self.class
        
        next unless klass.const_defined? name
        
        tracked[tracker] = klass.const_get(name).new(site).tracked
      end
      tracked
    end
  end
end