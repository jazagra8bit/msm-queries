class MoviesController < ApplicationController
  def index
    render({ :template => "movie_templates/list" })
  end

  def show
    the_id = params.fetch("the_id")
    matching_records = Movie.where({ :id => the_id })
    @the_movie = matching_records.at(0)

    # Find the director associated with the movie
    @the_director = Director.find(@the_movie.director_id)

    render({ :template => "movie_templates/details" })
  end
end

