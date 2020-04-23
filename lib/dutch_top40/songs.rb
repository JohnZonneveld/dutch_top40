class DutchTop40::Songs

    attr_accessor :title, :name, :listed, :last_weeks_rank

    @@songs = []

    def initialize(title, name, listed, last_weeks_rank)
        @title = title
        @name = name
        @listed = listed
        @last_weeks_rank = last_weeks_rank
        @@songs << self
    end


    def self.list
        DutchTop40::Scraper.scrape_songs
        @@songs
    end

end