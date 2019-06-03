
require 'httparty'

class DeveloperGigs::Searches
    include HTTParty  
    

    attr_accessor :location, :keyword, :description 

    @@jobs = []

  
  def self.results
     @@jobs << @location
    #  @@jobs << @keyword 
    @@jobs[0] || 0
    
  end


    def self.count_elements
        @number_of_listing = results.count 
        @number_of_listing
    end

    def self.search_location(zip_or_name = nil )

        if zip_or_name != nil
        @location = get("https://jobs.github.com/positions.json?location=#{zip_or_name}").parsed_response
   
        else 
            puts "Please type in a city,state,country, or zip code" 
        end

        
     end

     def self.clear_jobs

        @@jobs.clear

     end

    # def self.search_keyword(keyword = nil )

    #     if keyword != nil
    #     @keyword = get("https://jobs.github.com/positions.json?search=#{keyword}").parsed_response
       
    #     else 
    #         puts "Please type in a keyword" 
    #     end

   
    #     # @keyword.map.with_index(1) do |kw,i|
 
    #     #     puts "#{i}. #{kw["title"]} - #{kw["company"]} - #{kw["location"]} - #{kw["company_url"]}"
    #     #  end
 
    #  end


end














