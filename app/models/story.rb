require 'open-uri'
require 'nokogiri'
require 'cgi'

class Story < ActiveRecord::Base

  def self.get_news
    url = "https://en.wikipedia.org/wiki/Portal:Current_events"
    page = Nokogiri::HTML(open(url))


    news = page.css("table")[1]

    links = news.css("a")

    events = news.css("ul")[0]
    events_list = []

    events.css("li").each do |elements|
      r = Story.new(content: elements, formatted_content: elements.text)
      r.save
    end
  end

  def wikify_link
    news.css("a").each do |link|
      puts link.attributes["href"].value = "https://en.wikipedia.org#{CGI.escape link.attributes["href"].value}"
    end
  end
end


# Play with Wikipedia's API
# http://en.wikipedia.org/w/api.php?action=query&titles=Ile d'Yeu&format=json
# https://en.wikipedia.org/w/index.php?title=%C3%8Ele_d%27Yeu&curid=630868
# .gsub(/\/wiki\//, "http://en.wikipedia.org/wiki/")
