require 'rubygems'
require 'thor/group'

module Bookshop
  module Generators
    # Thor based generator for creating new projects based upon a template project which
    # is copied into the name_of_book project-folder when 'build new name_of_book' is issued
    class AppGenerator < Thor::Group
      include Thor::Actions

      # Define arguments and options
      argument :app_path, :optional=> true, :type => :string
      
      # Define source root of application
      def self.source_root
        File.dirname(__FILE__)
      end

      
        # Create the project from templates
        def create_base_project
          raise GeneratorArgumentsError if app_path.nil?
          puts "creating base project"
          directory "templates", "#{app_path}"
        end

        # Adds third-party tools
        # def add_tools
        #   directory "tools/", "#{app_path}/tools/"
        # end

        #Change the permissions so tools are executable 
        def chmod_tools
          chmod "#{app_path}/script/epubcheck/epubcheck.jar", 0755
          chmod "#{app_path}/script/epubcheck/lib/jing.jar", 0755
          chmod "#{app_path}/script/epubcheck/lib/saxon.jar", 0755
          chmod "#{app_path}/script/kindlegen/kindlegen.exe", 0755
          chmod "#{app_path}/script/kindlegen/kindlegen_mac", 0755
          chmod "#{app_path}/script/kindlegen/kindlegen_linux", 0755
        end
       
             
      
    protected

      def self.banner
        raise ArgumentsError
      end

    end
  end
end
