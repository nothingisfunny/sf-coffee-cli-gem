require_relative '../sf_coffee'

class SfCoffee::Scraper
	
	def self.starbucks
	  	stores = []
    	doc = Nokogiri::XML(open("https://openapi.starbucks.com/location/v1/stores?apikey=7b35m595vccu6spuuzu2rjh4&city=San%20Francisco&limit=50"))
        doc.xpath("//xmlns:store").each do |store|
          address = store.xpath("xmlns:address") 
          stores << {
           		:name => "Starbucks " + store.xpath("xmlns:name").text,
                :address => [address.xpath("xmlns:streetAddressLine1").text(), address.xpath("xmlns:streetAddressLine2").text(), address.xpath("xmlns:streetAddressLine3").text(), address.xpath("xmlns:city").text()].delete_if{|i|i==""},
                :phone => store.xpath("xmlns:phoneNumber").text,
                :zip_code => address.xpath("xmlns:postalCode").text[0..4]
           	}
        end
        doc = Nokogiri::XML(open("https://openapi.starbucks.com/location/v1/stores?apikey=7b35m595vccu6spuuzu2rjh4&city=San%20Francisco&offset=50&limit=50"))
       	doc.xpath("//xmlns:store").each do |store|
            address = store.xpath("xmlns:address") 
         	stores << {
           		:name => "Starbucks " + store.xpath("xmlns:name").text,
                :address => [address.xpath("xmlns:streetAddressLine1").text(), address.xpath("xmlns:streetAddressLine2").text(), address.xpath("xmlns:streetAddressLine3").text(), address.xpath("xmlns:city").text()].delete_if{|i|i==""},
                :phone => store.xpath("xmlns:phoneNumber").text,
                :zip_code => address.xpath("xmlns:postalCode").text[0..4]
           	}
       	end
        stores.each{|store|store[:address] = store[:address].join(", ")}
        stores
	 end

	def self.peets
		stores = []
		doc = Nokogiri::HTML(open("http://www.peets.com/stores/peets-stores/stores-store-list.html"))
		doc.css(".storeItem").each do |store|
          	stores << {
            	:name => store.children[0].text,
            	:address => (store.children[2].text()+","+store.children[4].text()),
            	:zip_code => store.children[0].text,
            	:phone => store.children[6].text.gsub(" ", "")
            }
		end
      	stores.delete_if{|store| !store[:name].include?("San Francisco—")}
      	stores.each {|store|store[:name] = "Peet's " + store[:name].split("—")[1]}
      	stores.each {|store|store[:zip_code] = store[:address].split("CA")[1].gsub(" ", "")}
        stores.each{|store|store[:address] = store[:address][1..store[:address].length].split(/,* CA/)[0]}
      	stores
	end

	def self.philz
        stores = []
    	doc = Nokogiri::HTML(open("http://www.philzcoffee.com/locations-sf"))
     	doc.css(".span4.mid").each do |store|
        	stores << {
          		:name => "Philz " + store.css("h1").text(),
          		:address => store.css(".location-text.text-left").text.gsub("ADDRESS: ",""),
          		:phone => store.css(".pull-left.location-phone-detail .text-right").text.gsub(" ", ""),
          		:zip_code => nil
          	}
      	end
      stores.delete_if{|store| !store[:address].include?("San Francisco")}
      stores.each {|store|store[:zip_code] = store[:address].split("CA")[1].gsub(" ", "")}
      stores.each{|store|store[:address] = store[:address].split(",")[0]}
      stores 
	end
end