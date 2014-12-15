module RunShell
  class Configuration
    def shell_path
      @shell_path ||= ""
    end

    def shell_path=(value)
      @shell_path = value
    end

    def shell_command
      @shell_command ||= ""
    end

    def shell_command=(value)
      @shell_command = value
    end
  end
end