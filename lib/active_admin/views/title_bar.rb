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
        div class: 'row-fluid' do
          ul id: "titlebar_left", class: 'breadcrumb' do
            build_breadcrumb
          end
          div class: 'page-header' do
            build_title_tag
          end
        end
      end

      def build_titlebar_right
        build_action_items
      end

      def build_breadcrumb(separator = "/")
        links = if active_admin_config && active_admin_config.breadcrumb.present?
          instance_exec(controller, &active_admin_config.breadcrumb)
        else
          breadcrumb_links
        end
        return unless links.present? && links.is_a?(::Array)
        li do
          links.each do |link|
            text_node link
            span(separator, class: "divider")
          end
        end
      end

      def build_title_tag
        h1(@title, id: 'page_title')
      end

      def build_action_items
        if @action_items.any?
          div class: 'row-fluid' do
            div class: 'span8' do
              insert_tag(view_factory.action_items, @action_items) 
            end
          end
        end
      end

    end
  end
end
