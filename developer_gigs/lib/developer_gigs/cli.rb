# CLI Controller 

class DeveloperGigs::CLI 
   
   puts "Developer Gigs"
   
   def call 

      puts "Welcome, Lets find some developer jobs." 
      search

   end

   def search 
      puts " To search for jobs near you type a City,State, or zip code, then click enter. Type 'exit' to exit program"         ## Maybe just use zip code instead  
      @zip_or_name = gets.strip
      if @zip_or_name == 'exit'
         exit 
      else
      @location_input = DeveloperGigs::Searches.search_location(@zip_or_name)
      job_postings
      end
      
      
   end

   def job_postings 

      puts "Found #{DeveloperGigs::Searches.count_elements} job posting(s)"     

      @search = DeveloperGigs::Searches.results 
      
      @search.flatten.map.with_index(1) do |lc,i|
   
      puts "#{i}. #{lc["title"]} - #{lc["company"]} - #{lc["location"]} - #{lc["company_url"]}"
      
     end


      if DeveloperGigs::Searches.count_elements != 0
       puts "Type the job number for more details or type 'search' to start a new search."
   
      else
       puts "No Jobs found, type 'search' to start a new search"
       
       end

       job_details
  end

 
   def job_details   
    input = nil
  
      while input != "exit" 
   
         input = gets.strip 

         if  input.to_i > DeveloperGigs::Searches.count_elements  
           puts "There is not a listing with that number. Choose one of the #{DeveloperGigs::Searches.count_elements} listings or type 'search' to start a new search."
            elsif input.to_i > 0   
               job_description = @search[input.to_i-1]      
               puts "#{job_description["description"].strip.gsub(/<\/?[^>]*>/, "")}" 
               puts "Type 'search' to search again or 'exit' to exit the program."
               elsif input.downcase =="search"
                  DeveloperGigs::Searches.clear_jobs
               search 
               elsif input.downcase == "exit"
               exit  
               else
                  puts  "Please type 'search' to start a new search, or 'exit' to exit program"
            end   
         end      
   end


   def exit 
     puts "Good Bye."  
         
   end


end 