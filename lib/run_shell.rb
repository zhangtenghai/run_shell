require "run_shell/version"
require "run_shell/configuration"
require "run_shell/shell"

Dir[File.join(File.dirname(__FILE__), 'run_shell', 'frameworks', '*.rb')].each { |file| require file }

module RunShell
  # Your code goes here...
  class << self
    def setup
      yield config
    end

    def config
      @config ||= Configuration.new
    end
  end

  def self.whodunnit
    run_shell_store[:whodunnit]
  end

  def self.whodunnit=(value)
    run_shell_store[:whodunnit] = value
  end

  def self.run_shell_store
    Thread.current[:run_shell] ||= { }
  end
end

if defined?(ActionController)
  ActiveSupport.on_load(:action_controller) do
    include RunShell::Rails::Controller
  end
end