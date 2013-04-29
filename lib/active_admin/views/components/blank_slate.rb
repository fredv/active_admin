module ActiveAdmin
  module Views
    # Build a Blank Slate
    class BlankSlate < ActiveAdmin::Component
      builder_method :blank_slate

      def default_class_name
        'row-fluid blank_slate_container'
      end

      def build(content)
        super(div(span(content.html_safe, :class => "blank_slate"), class: 'span12' ))
      end

    end
  end
end
