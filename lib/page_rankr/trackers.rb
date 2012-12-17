module PageRankr
  module Trackers
    attr_accessor :site_trackers
    
    def initialize
      @site_trackers = self.class.constants.collect{|tracker| symbol_for(tracker)}
    end

    def lookup(site, *trackers)
      trackers = site_trackers if trackers.empty?
      tracked = {}

      trackers.map do |tracker|
        name, klass = constant_name(tracker), self.class
        
        next unless klass.const_defined? name

        instance = klass.const_get(name)
        Thread.new(tracker, instance, site) do |t, i, s|
          tracked[t] = i.new(s).run
        end
      end.each(&:join)
      
      tracked
    end
    
    private
    
    def symbol_for(klass)
      word = klass.to_s.dup
      word.gsub!(/([A-Z]+)([A-Z][a-z])/){|match| "#{$1}_#{$2}" }
      word.gsub!(/([a-z\d])([A-Z])/){|match| "#{$1}_#{$2}" }
      word.tr!("-", "_")
      word.downcase!
      word.to_sym
    end
    
    def constant_name(sym)
      sym.to_s.split('_').collect{|str| str.capitalize}.join
    end
  end
end