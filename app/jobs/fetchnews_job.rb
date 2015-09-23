class FetchnewsJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    get_news
  end

  def get_news
    url = "https://en.wikipedia.org/wiki/Portal:Current_events"
    page = Nokogiri::HTML(open(url))

    news = page.css("table")[1]

    events = news.css("ul")[0]
    events_list = []

    events.css("li").each do |elements|
      r = Story.new(content: elements, formatted_content: elements.text)
      r.save
    end
  end
end
