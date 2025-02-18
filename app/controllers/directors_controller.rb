class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id})

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details"})
  end

  def youngest
    # Find the youngest director (most recent birthdate)
    @the_youngest_director = Director.where.not(dob: nil).order(dob: :desc).first
    render({ :template => "director_templates/youngest" })
  end

  def oldest
    @the_oldest_director = Director.where.not(dob: nil).order(dob: :asc).first
    render({ :template => "director_templates/oldest" })
  end
end
