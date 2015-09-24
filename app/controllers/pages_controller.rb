class PagesController < ApplicationController
  def index
    # Story.get_news
    @events = Story.all
  end
end

# Wikipedia links need to be prepended with "https://en.wikipedia.org/wiki"
