module ActiveAdmin
  module Views
    class Footer < Component

      def build
        super :id => "footer"
      end

      private

      def powered_by_message
        para I18n.t('active_admin.powered_by',
          :active_admin => "Active Admin",
          :version => ActiveAdmin::VERSION).html_safe
      end

    end
  end
end
