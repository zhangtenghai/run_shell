module RunShell
  class Shell < ActiveRecord::Base
    #attr_accessible :whodunnit, :file_path, :content, :result
    
    def self.run
        if File.exists?(RunShell.config.shell_path)
          content = File.read(RunShell.config.shell_path)
          result = system content
          shell = Shell.new(file_path:RunShell.config.shell_path, content:content, result:result, whodunnit:RunShell.whodunnit)
          shell.save
        end

        if !RunShell.config.shell_command.blank?
          content = RunShell.config.shell_command
          result = system content
          shell = Shell.new(content:content, result:result, whodunnit:RunShell.whodunnit)
          shell.save
        end
    end
  end
end