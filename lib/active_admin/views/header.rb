module ActiveAdmin
  module Views
    class Header < Component

      def build(namespace, menu)
        super(class: "navbar navbar-fixed-top", id: 'navigation')

        @namespace = namespace
        @menu = menu
        @utility_menu = @namespace.fetch_menu(:utility_navigation)

        build_global_navigation
      end

      def build_global_navigation
        div class: 'navbar-inner' do
          insert_tag view_factory.site_title, @namespace
          insert_tag view_factory.global_navigation, @menu

          build_utility_navigation
        end
      end

      def build_utility_navigation
        insert_tag view_factory.global_navigation, @utility_menu, class: 'nav pull-right'
      end

    end
  end
end
