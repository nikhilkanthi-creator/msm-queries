class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end


  def show
    @the_id = params.fetch("the_id")
    matching_records = Director.where({ :id => @the_id})
    @the_director = matching_records.at(0)
    render({ :template => "director_templates/details"})
  end

  def youngest
    @director_age = Director.where.not({ :dob => nil }).order({ :dob => :desc})
    @director_youngest = @director_age.at(0)
    @youngest_name = @director_youngest.name
    @youngest_dob = @director_youngest.dob
    render({ :template => "director_templates/youngest"})
  end

  def eldest
    @director_age = Director.all.order(:dob)
    @director_eldest = @director_age.at(0)
    @eldest_name = @director_eldest.name
    @eldest_dob = @director_eldest.dob
    render({ :template => "director_templates/eldest"})
  end

end
