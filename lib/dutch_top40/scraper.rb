class DutchTop40::Scraper

    attr_accessor :title, :name, :listed, :last_weeks_rank

    def self.scrape_songs
        doc = Nokogiri::HTML(open("http://top40.nl"))
        doc.search('.listScroller').search('.top40List').each do |song|
                title = song.search('.songtitle').text.strip
                name = song.search('.artist').text
                listed = song.search('.details').text.split(' | ')[1].gsub(/Aantal weken: /,'').strip
                if song.search('.details').text.split(' | ')[0].gsub(/Vorige week: #/,'').strip  == '-'
                    last_weeks_rank = 'new entry'
                else
                    last_weeks_rank = song.search('.details').text.split(' | ')[0].gsub(/Vorige week: #/,'').strip
                end
                DutchTop40::Songs.new(title, name, listed, last_weeks_rank)
        end
    end
end