class ImageUrlInput < SimpleForm::Inputs::Base
  def input(wrapper_options = nil)
    out = ActiveSupport::SafeBuffer.new
    out << @builder.text_field(attribute_name, input_html_options)
    if object.send("#{attribute_name}?")
      out << @builder.image_tag(object.send(attribute_name).url(:medium))
    end
    out
  end

  def input_html_options
    super.merge({ class: 'form-control' })
  end
end
