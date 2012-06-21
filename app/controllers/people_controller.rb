class PeopleController < ApplicationController

  def index
    @display = []
    Person.all.each do |person|
      if person.couple.blank?
          @display << person
      elsif @display.select{|item| item.id == person.couple.id}.blank?
        @display << person.couple
      end
      @display.last.status = Forgery(:lorem_ipsum).words((0..40).to_a.sample)
    end
    @display.shuffle!
  end

end
