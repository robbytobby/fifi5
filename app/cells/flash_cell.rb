# frozen_string_literal: true

class FlashCell < ApplicationCell
  attr_reader :key

  def show
    fragments.join
  end

  private

  def fragments
    model.map do |key, value|
      @key = key
      @value = value
      render :show unless message.blank?
    end
  end

  def message
    send "#{@value.class.to_s.underscore}_message"
  end

  def string_message
    @value
  end

  def true_class_message; end
end
