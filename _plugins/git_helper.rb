# frozen_string_literal: true
module Jekyll
  module GitBranchPlugin
    class Tag < Liquid::Tag
      NO_GIT_MESSAGE          = "Oops, are you sure this is a git project?".freeze

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

      def render(context)
		product = context.registers[:page]['product']
		return unless (!product.nil? and !product.to_s.strip.empty?)

	    rootPath = context.registers[:site].config['source']
	    @gitDir = rootPath + "/pages/" + product + "/.git"

        if git_repo?
          current_branch
        else
          NO_GIT_MESSAGE
        end
      end

      private

      attr_reader :params

      # for testing
      def system_wrapper
        @system_wrapper ||= SystemWrapper.new
      end

      def current_branch
		branch = run("git --git-dir " + @gitDir + " rev-parse --abbrev-ref HEAD")

        branch.to_s.strip if command_succeeded?
      end

      def run(command)
        system_wrapper.run(command)
      end

      def git_repo?
        File.exists?(@gitDir) and system_wrapper.git_repo?(@gitDir)
      end

      def command_succeeded?
        system_wrapper.command_succeeded?
      end
    end
  end
end

Liquid::Template.register_tag("git_current_branch", Jekyll::GitBranchPlugin::Tag)