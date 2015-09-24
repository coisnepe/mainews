class PagesController < ApplicationController
  def index
    Story.get_news
    @events = Story.all
  end
end

# .strftime(%A, %b %d)
