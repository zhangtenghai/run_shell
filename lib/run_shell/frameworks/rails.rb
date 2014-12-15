module RunShell
  module Rails
    module Controller

      def self.included(base)
        if defined?(ActionController) && base == ActionController::Base
          base.before_filter :set_run_shell_whodunnit
        end
      end

      protected
      def user_for_run_shell
        current_user if defined?(current_user)
      end
      
      def set_run_shell_whodunnit
        ::RunShell.whodunnit = user_for_run_shell
      end

    end
  end
end
