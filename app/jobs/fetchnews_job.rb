class FetchnewsJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
  end

  def get_news
    url = "https://en.wikipedia.org/wiki/Portal:Current_events"
    page = Nokogiri::HTML(open(url))

    news = page.css("table")[1]

    events = news.css("ul")[0]
    events_list = []

    events.css("li").each do |elements|
      events_list << elements.text
    end
    events_list
  end
end