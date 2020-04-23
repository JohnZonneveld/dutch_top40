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
        self.scrape_songs
    end

    def self.scrape_songs
        doc = Nokogiri::HTML(open("http://top40.nl"))
        doc.search('.listScroller').search('.top40List').each do |song|
                title = song.search('.songtitle').text.strip
                name = song.search('.artist').text
                listed = song.search('.details').text.split(' | ')[1].gsub(/Aantal weken: /,'').strip
                last_weeks_rank = song.search('.details').text.split(' | ')[0].gsub(/Vorige week: #/,'').strip
                self.new(title, name, listed, last_weeks_rank)
        end
        @@songs
    end

end