
# GitHub Markdown Rendering class
#
# Provides a Markdown rendering method as a singleton, and two
# auxiliary functions
#
# There are two kinds of Markdown in GitHub.com:
#
# - Plain Markdown: used in Wikis, Pages and GitHub::Markup (READMEs).
#   This is standards-compliant Markdown, with some of the PHP-Markdown
#   extensions:
#
# - GitHub-flavored Markdown: used in user-input text, such as comments.
#   Same extensions as Plain Markdown, and additionally the following
#   extensions:
#
# GitHub::Markdown.render(content)
# #=> Rendered Markdown as HTML plaintext with the default extensions
#
# GitHub::Markdown.render_gfm(content)
# #=> Rendered GitHub-flavored Markdown as HTML plaintext
#
# GitHub::Markdown._to_html(content, mode) { |code, lang| ... }
# #=> Rendered Markdown with the given mode as HTML plaintext
module GitHub
  class Markdown
    def self.render(content)
      self.to_html(content, :markdown)
    end

    def self.render_gfm(content)
      self.to_html(content, :gfm)
    end
  end
end

# Load the actual C extension
require 'github/markdown.so'

module GitHub
  Markdown.class_eval do
    class << self
      alias_method :original_to_html, :to_html

      def to_html(content, mode)
        pattern = /\A\s*---\s*?\n(?:(.*?)\n|)---\s*?(?:\n(.*))?\z/m
        match = pattern.match(content)
        if match.nil?
          return original_to_html(content, mode)
        end

        yaml_frontmatter = match[1] || ''
        md_content = match[2] || ''

        return original_to_html("```yaml\n#{yaml_frontmatter}\n```\n#{md_content}", mode)


      end
    end

  end
end
