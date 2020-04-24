class DutchTop40::CLI

    def call
        logo
        
        puts "One moment, acquiring data.",""
        list_songs
        menu
    end

    def list_songs
        @songs = DutchTop40::Songs.list
        print_songs
        puts
    end

    def print_songs
        puts "Dutch Top40 - week  #{Time.now.strftime("%U")}", ""
        @songs.each.with_index(1) do |song, index| 
            puts "#{index}.  #{song.title}"
        end
    end

    def menu       
            input = nil
            while input != 'exit'
                puts "Which song do you want more info on? Type list to see list again, type exit to quit.",""
                input = gets.strip.downcase
                case input.to_i
                    when 1..@songs.size
                        puts "------------------------------------------------------------------------------------"
                        puts "Current rank #{input}."
                        puts "------------------------------------------------------------------------------------"
                        puts "#{@songs[input.to_i-1].title} - performing artist(s): #{@songs[input.to_i-1].name}"
                        puts "weeks in Top40: #{@songs[input.to_i-1].listed} - last weeks rank: #{@songs[input.to_i-1].last_weeks_rank}"
                        puts "------------------------------------------------------------------------------------"
                    else 
                        puts "Invalid input!" unless input == 'exit' || input == 'list'
                    if input == 'list' 
                        print_songs
                    end
                    if input == 'exit' 
                        goodbye
                    end
                end
            end
    end

    def goodbye
        logo
        puts "See you next time..."
    end

    def logo
        puts "                                                                                                    
        `````````````````````   ````````````````````    ````````````````````             
       `:``````````````````.+. -.``````````````````-/` :```````````````````+.            
       :` `---:::::::---`  /Ny`:   `.-/+::+/:`     hm/:`.///////-///:-`   -Nd`           
      -.  ```oyyyyyyo```  .NN-/  ./oyyyo`+yyys/   +Mh.-`syyyyyy/.yyyyys. `dM:            
     `:     -yyyyyys`     hM+:`.+yyyyys.:yyyyyy- -Nm.: +yyyyyys`oyyyyyy/ sMs             
     :     `syyyyyy-     oMy.--syyyyyy:.yyyyyyy:`mM::`-yyyyyyy./yyyyyys./Md`             
    :`     oyyyyyy+     :Mm./-yyyyyyy+`syyyyyys`yMo-.`syyyyyy/-yyyyyyo..NN.              
   .-     /yyyyyys`    `mM-:`syyyyyys`+yyyyyys./Md`: oyyyyyys.syyss+-  dM/               
   /     .yyyyyyy.     yMo.- syyyyyy.:yyyyyyo`.NN./ :yyyyyys-....`    oMy                
  :`    `syyyyyy:     +Mh`:  -syyyy:.yyyyy+- `dM/-..yyyyyyy-         :Mm`                
 .-     /yssssso     -NN./    `/oso-+o+/-`   sMs`: +ssssss:         `mM-                 
 :                  `mM:-.                  :Mm`/                   hM+                  
.-hdddddddddddddddddmMs -/dddddddmmmmdmmmmmmNN.`-ymmmmmmmmmmmmmmmmmmMh                   
  --------------------   .-------------------.   .---................`                   
                                                                                         
                      .-..................-:  :....-----........../                      
                      :        `::::::`   sm+:`    .:/+-++:.     -mh                     
                     :`      `:syyyyyo   :Mm--  `:syyy:-yyyy:   `mM:                     
                    ..      -/syyyyys`  `mN::  -syyyy+`syyyys   yMo                      
                   `:     -:./yyyyyy-   hM+:` /yyyyys`+yyyyyo  /Md                       
                   :    .:. .yyyyyy+   +Mh-. /yyyyyy--yyyyyy: .NN.                       
                  -.  .:-  `syyyyys`  -Nm-: `yyyyyy/`syyyyy/ `dM/                        
                 `: `/:....+yyyyyy:` `mM::  -yyyyyo`oyyyys:  sMs                         
                 :  `...../yyyyyy/.` yMo-`  `syyyy.:yyys+.  :Md`                         
                :`       `osssss+   /Mh.-    .+os/.oo+:.   .mN-                          
               .-         ``````   .NN.:       `````       hM+                           
               ::yyyyyyyyyyyyyyyyyymM/.:syyyyyyyyyyyyyyyyyhMy                            
                .+++++++/////////////  `+++++++++++++++/////`                            
                                                                                         
                                                                                         
"
    end
end