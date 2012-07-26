class PeopleController < ApplicationController

  def index
    @display = []
    me = Person.find_by_name("James Bradford Trask")
    @display << me
    others = Person.all
    others.delete me
    others.shuffle.each do |person|
      if person.couple.blank?
          @display << person
      elsif @display.select{|item| item.id == person.couple.id}.blank?
        @display << person.couple
      end
    end
  end

  def update
    begin
      class_name, item_id = params[:id].split "_"
      entry = class_name == "couple" ? Couple.find(item_id) : Person.find(item_id)
      entry.update_attribute :status, params[:status]
      result = { result: :success }
    rescue Exception => ex
      Rails.logger.debug(ex.inspect)
      result = { result: :failure, error: ex.message }
    end
    render json: result
  end

end
