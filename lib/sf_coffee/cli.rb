require_relative '../sf_coffee'

class SfCoffee::CLI
	ZIP_CODES = [94102, 94103, 94104,
	             94105, 94107, 94108,
	             94109, 94110, 94111,
	             94112, 94114, 94115,
	             94116, 94117, 94118,
	             94121, 94122, 94123,
	             94124, 94127, 94129,
	             94130, 94131, 94132,
	             94133, 94134, 94158]
	def call
		greeting
		menu
		goodbye
	end

	def greeting
		puts "\n"
		puts "Welcome to San Francisco coffee finder!"
	end

	def print_menu
		puts "List all of the locations for your favorite coffee company by entering 1, 2, or 3:"
		puts "\t1. Starbucks".yellow
		puts "\t2. Peet's Coffee and Tea".yellow
		puts "\t3. Philz Coffee".yellow
		puts "OR"
		puts "Find the nearest coffeeshop, by entering your ZIP Code:"
	end

	def finish_session
		puts "To finish your session type" + " exit.".red + " To return to the main menu type" + " menu".red + "."
		input = gets.strip.downcase
		while input != "exit" && input !="menu"
				puts "Oops, something went wrong. Please try again.".red
				input = gets.strip.downcase
		end
		if input == "menu"
			self.menu
		else 
		end
	end

	def valid_zipcode?(input)
		ZIP_CODES.include?(input.to_i)
	end		

	def menu
		self.print_menu
		input = gets.strip
		until input == "exit" || input =="menu"  || input =="1" || input =="2" || input =="3" || valid_zipcode?(input) == true
				puts "Oops, something went wrong. Please choose a number from the menu, or enter a valid San Francisco zipcode".red
				input = gets.strip
		end
		if input == "menu"
			self.menu
		end
		if input == "1"
			# lists all Starbucks locations
			puts "Here is what we found for your request:".blue
			SfCoffee::Scraper.starbucks.each_with_index do |store, index| 
				puts "#{index+1}. Store name: ".yellow + "#{store[:name]}".yellow
				puts "Address: #{store[:address]}, #{store[:zip_code]}".white
				puts "Phone: #{store[:phone]}".white
			end
			self.finish_session
		elsif input == "2"
			#lists all Peet's Coffee and Tea locations
			puts "Here is what we found for your request:".blue
			SfCoffee::Scraper.peets.each_with_index do |store, index| 
				puts "#{index+1}. Store name: ".yellow + "#{store[:name]}".yellow
				puts "Address: #{store[:address]}, #{store[:zip_code]}".white
				puts "Phone: #{store[:phone]}".white
			end
			self.finish_session
		elsif input == "3"
			#lists all Philz Coffee locations
			puts "Here is what we found for your request:".blue
			SfCoffee::Scraper.philz.each_with_index do |store, index| 
				puts "#{index+1}. Store name: ".yellow + "#{store[:name]}".yellow
				puts "Address: #{store[:address]}, #{store[:zip_code]}".white
				puts "Phone: #{store[:phone]}".white
			end
			self.finish_session
		elsif valid_zipcode?(input)
			#prints the coffee shops in the area"
			stores_with_zip = []
			SfCoffee::Scraper.starbucks.each do |store|
				if store[:zip_code] == input
					stores_with_zip << store
				end
			end
			SfCoffee::Scraper.peets.each do |store|
				if store[:zip_code] == input
					stores_with_zip << store
				end
			end
			SfCoffee::Scraper.philz.each do |store|
				if store[:zip_code] == input
					stores_with_zip << store
				end
			end
			puts "Here is what we found for your request:".blue
			stores_with_zip.each_with_index do |store, index| 
				puts "#{index+1}. Store name: ".yellow + "#{store[:name]}".yellow
				puts "Address: #{store[:address]}, #{store[:zip_code]}".white
				puts "Phone: #{store[:phone]}".white
			end
			self.finish_session
		end
	end

	def goodbye
		puts "Thank you for using SF coffee fnder!".yellow
	end

end
