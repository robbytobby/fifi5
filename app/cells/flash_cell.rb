# frozen_string_literal: true

class FlashCell < Cell::ViewModel
  def initialize(*arg)
    super(*arg)
    @output = +''
    process_flash
  end

  def render
    @output
  end

  private

  def process_flash
    model.each do |key, value|
      @key = key
      @output << content_tag(:div,
                             value.to_s.html_safe + dismiss_button,
                             class: "alert flash-#{key}",
                             id: "flash_#{key}")
    end
  end

  def dismiss_button
    content_tag(:button,
                close_span,
                type: 'button',
                class: 'close',
                data: { dismiss: 'alert' },
                aria: { label: 'Close' })
  end

  def close_span
    content_tag(:span, '&times'.html_safe, aria: { hidden: 'true' })
  end
end
