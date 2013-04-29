module ActiveAdmin
  module Views
    class TitleBar < Component

      def build(title, action_items)
        super(id: "title_bar", class: 'row-fluid')
        @title = title
        @action_items = action_items
        build_titlebar_left
        build_titlebar_right
      end

      private

      def build_titlebar_left
        div class: 'span8' do
         # div class: 'span12' do
         #   build_breadcrumb
         # end

          div class: 'span12' do
            div class: 'page-header' do
              build_action_items
              build_title_tag
            end
          end
        end
      end


      def build_titlebar_right
      end

      def build_breadcrumb(separator = "/")
        links = if active_admin_config && active_admin_config.breadcrumb.present?
          instance_exec(controller, &active_admin_config.breadcrumb)
        else
          breadcrumb_links
        end
        return unless links.present? && links.is_a?(::Array)
        ul id: "titlebar_left", class: 'breadcrumb' do
          li do
            links.each do |link|
              text_node link
              span(separator, class: "divider")
            end
          end
        end
      end

      def build_title_tag
        h1(@title, id: 'page_title')
      end

      def build_action_items
        if @action_items.any?
          insert_tag(view_factory.action_items, @action_items) 
        end
      end

    end
  end
end
