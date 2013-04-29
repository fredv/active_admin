module ActiveAdmin
  module Views

    class ActionItems < ActiveAdmin::Component

      def build(action_items)
        super(class: "btn-group pull-right")
        [action_items.map do |action_item|
          instance_eval(&action_item.block)
        end].join("\n").html_safe
      end

    end

  end
end
