class PeopleController < ApplicationController

  def index
    @display = []
    Person.all.each do |person|
      if person.couple.blank?
          @display << person
      elsif @display.select{|item| item.id == person.couple.id}.blank?
        @display << person.couple
      end
    end
    @display.shuffle!
  end

end
