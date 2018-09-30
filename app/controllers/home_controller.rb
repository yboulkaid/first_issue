class HomeController < ApplicationController
  def index
    @repositories_by_language = Github::Repositories.all_by_language
  end
end
