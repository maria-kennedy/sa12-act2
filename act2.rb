require 'httparty'

# # Problem 1
def prob1
    # get request
    response = HTTParty.get('https://api.github.com/users/obsidianmd/repos')
    
    #parsing response
    repos = JSON.parse(response.body)

    #find repo with most stars
    highest = repos.max_by { |repo| repo['stargazers_count'] }

    # Output: Display the name, description, number of stars, 
    # and URL of the most starred repository.
    puts "Most starred: #{highest['name']}"
    puts "Description: #{highest['description']}"
    puts "Num of stars: #{highest['stargazers_count']}"
    puts "URL: #{highest['html_url']}"
end

# Problem 2
def prob2
    # get request
    response = HTTParty.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')
    
    #parsing response
    data = JSON.parse(response.body)

    #sort by market cap in descending order
    sorted = data.sort_by { |cc| cc['market_cap'] }.reverse

    # Output: List the names and current prices of the top 5 cryptocurrencies by market 
    # capitalization, along with their respective market cap values.
    top_5 = sorted[0..4]
    top_5.each do |cc|
        puts "Name: #{cc['name']}"
        puts "Price: #{cc['current_price']}"
        puts "Market Cap: #{cc['market_cap']}"
        puts ""
    end
end

# Problem 3
def prob3
    # get request
    response = HTTParty.get('http://worldtimeapi.org/api/timezone/America/Chicago')

    #parsing response
    data = JSON.parse(response.body)

    # • Output: Display the specified area and location, the current date, 
    # and the time, ensuring to format the output for readability (e.g., "The current time in Europe/London is 2023-09-15 14:30:25").
    # for readability
    date = data['datetime'].split('T')[0]
    time = data['datetime'].split('T')[1].split('.')[0]
    # print
    puts "The current time in #{data['timezone']} is #{date} #{time}"
end

# testing
puts prob1
puts prob2
puts prob3