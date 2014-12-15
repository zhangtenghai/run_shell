require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record'

module RunShell
  class InstallGenerator < ::Rails::Generators::Base
    include ::Rails::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)
   
    desc 'Generates (but does not run) a migration to add a shells table.'

    def create_migration_file
      migration_template 'create_shells.rb', 'db/migrate/create_shells.rb'
    end

    def copy_initializer
      template "run_shell.rb", "config/initializers/run_shell.rb"
    end

    def self.next_migration_number(dirname)
      ActiveRecord::Generators::Base.next_migration_number(dirname)
    end
  end
end
