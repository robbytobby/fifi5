# frozen_string_literal: true

class FlashCell < Cell::ViewModel
  attr_reader :key

  def show
    model.map{|key, value|
      @key, @value = key, value
      render :show
    }.join
  end

  private
  def message
    send "#{@value.class.to_s.underscore}_message"
  end

  def string_message
    @value
  end
end
