require File.expand_path('../tracker', __FILE__)

module PageRankr
  module Index
    include Tracker

    alias_method :index, :tracked

    def clean(raw)
      cleaned_content = super(raw)
      return nil if cleaned_content.nil? || cleaned_content.zero?
      cleaned_content
    end
  end
end