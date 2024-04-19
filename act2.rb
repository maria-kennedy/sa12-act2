require 'httparty'

# Problem 1
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

puts prob1