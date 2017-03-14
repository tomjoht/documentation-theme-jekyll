# frozen_string_literal: true
module Jekyll
  module GitHelperPlugin
    class AbstractGitTag < Liquid::Tag
      NO_GIT_MESSAGE = "Oops, are you sure this is a git project?".freeze

      # A wrapper around system calls; mock/stub this in testing
      class SystemWrapper
        def run(command)
          `#{command}`
        end

        def command_succeeded?
          !$?.nil? && $?.success?
        end

        def git_repo?(gitDir)
          system("git --git-dir " + gitDir + " rev-parse")
        end
      end

      def initialize(tag_name, product, tokens)
        super
		@product = product
      end

      private

      attr_reader :params

      # for testing
      def system_wrapper
        @system_wrapper ||= SystemWrapper.new
      end

	  def render(context)
        sidebarName = context.registers[:page]['sidebar']
        if !sidebarName.nil? then
          sidebar = context.registers[:site].data['sidebars'][sidebarName]
          if !sidebar.nil? then
            relativePath = sidebar['entries'][0]['relative_path']
          end
        end

		# product = context.registers[:page]['product']
        return unless (!relativePath.nil? and !relativePath.to_s.strip.empty?)

        rootPath = context.registers[:site].config['source']
        @gitDir = rootPath + "/" + relativePath + "/.git"
	  end

      def run(command)
        system_wrapper.run(command)
      end

      def git_repo?
        !@gitDir.nil? and File.exists?(@gitDir) and system_wrapper.git_repo?(@gitDir)
      end

      def command_succeeded?
        system_wrapper.command_succeeded?
      end
    end
	class CurrentBranchTag < AbstractGitTag
      def current_branch
		branch = run("git --git-dir " + @gitDir + " rev-parse --abbrev-ref HEAD")

        branch.to_s.strip if command_succeeded?
      end

      def render(context)
	    super

        if git_repo?
          current_branch
        else
          NO_GIT_MESSAGE
        end
      end
	end
	class RemoteURLTag < AbstractGitTag
      def remote_url
		branch = run("git --git-dir " + @gitDir + " config --get remote.origin.url")

        branch.to_s.strip if command_succeeded?
      end

      def render(context)
	    super

        if git_repo?
          remote_url
        else
          NO_GIT_MESSAGE
        end
      end
	end
  end
end

Liquid::Template.register_tag("git_current_branch", Jekyll::GitHelperPlugin::CurrentBranchTag)
Liquid::Template.register_tag("git_remote_url", Jekyll::GitHelperPlugin::RemoteURLTag)
