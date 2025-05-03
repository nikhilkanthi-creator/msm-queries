class ActorsController < ApplicationController
  def index
    render({ :template => "actors_templates/list"})
  end


  def show
    @the_id = params.fetch("the_id")
    matching_records = Actor.where({ :id => @the_id})
    @the_actor = matching_records.at(0)
    render({ :template => "actors_templates/details"})
  end
end
