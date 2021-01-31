require "json"

module Archer
  class SuggestedArticles
    MAX_ARTICLES_COUNT = 4

    def initialize(data)
      @data = JSON.parse(data)
      @articles = []
    end

    def run
      algorithms = @data.keys
      max_recommendations_count = algorithms.map { |algorithm| @data[algorithm].count }.max

      max_recommendations_count.times do |row|
        algorithms.each do |algorithm|
          if @data[algorithm].count > row
            @articles << @data[algorithm][row]["token"].to_i
            break if reach_max_articles?
          end
        end
        break if reach_max_articles?
      end

      @articles
    end

    private

    def reach_max_articles?
      @articles.count == MAX_ARTICLES_COUNT
    end
  end
end
