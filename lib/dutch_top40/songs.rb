class DutchTop40::Songs

    attr_accessor :title, :name, :listed, :last_week_rank

    @@all = []


    def self.list
        self.scrape_songs
    end

    def self.scrape_songs
        songs = []
        doc = Nokogiri::HTML(open("http://top40.nl"))
        doc.search('.listScroller').search('.top40List').each do |song|
            songs << {
                :title => song.search('.songtitle').text.strip,
                :name => song.search('.artist').text,
                :listed => song.search('.details').text.split(' | ')[1].gsub(/Aantal weken: /,'').strip,
                :last_week_rank => song.search('.details').text.split(' | ')[0].gsub(/Vorige week: #/,'').strip
        }
        end
        songs
    end

end