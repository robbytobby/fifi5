class FlashCell < Cell::ViewModel
  def initialize(*arg)
    super(*arg)
    process_flash
  end

  def render
    output
  end

  private

  def output
    @output ||= ''
  end

  def process_flash
    model.each do |key, value|
      @key = key
      output << content_tag(:div, value, class: bootstrap_class, id: dom_id)
    end
  end

  def bootstrap_class
    ['alert', key_dependent_class].join(' ')
  end

  def key_dependent_class
    { alert: 'alert-danger', notice: 'alert-success' }[@key.to_sym]
  end

  def dom_id
    ['flash', @key].join('_')
  end
end
