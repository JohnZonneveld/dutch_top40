class DutchTop40::Scraper

    attr_accessor :title, :name, :listed, :last_weeks_rank

    def self.scrape_songs
        doc = Nokogiri::HTML(open("http://top40.nl"))
        doc.search('.listScroller .list-right').each do |song|
            # binding.pry
                title = song.css('.songtitle').text.strip
                name = song.css('.artist').text
                details = song.css('.details').text
                listed = details.split(' | ')[1].gsub(/Aantal weken: /,'').strip
                if details.split(' | ')[0].gsub(/Vorige week: #/,'').strip  == '-'
                    last_weeks_rank = 'new entry'
                else
                    last_weeks_rank = details.split(' | ')[0].gsub(/Vorige week: #/,'').strip
                end        
                DutchTop40::Songs.new(title, name, listed, last_weeks_rank)
        end
    end
    
end