module ActiveAdmin
  module Views

    class ActionItems < ActiveAdmin::Component

      def build(action_items)
        div class: "btn-group pull-right" do
          [action_items.map do |action_item|
            instance_eval(&action_item.block)
          end].join("\n").html_safe
        end
      end

    end

  end
end
