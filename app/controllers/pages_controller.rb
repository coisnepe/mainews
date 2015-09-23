class PagesController < ApplicationController
  def index
    Story.get_news
    @events = Story.pluck(:formatted_content, :created_at)
    @title = @events[0]
    @date = @events[1]
  end
end

# .strftime(%A, %b %d)
