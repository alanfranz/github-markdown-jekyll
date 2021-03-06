# encoding: utf-8
Gem::Specification.new do |s|
  s.name = 'github-markdown-jekyll'
  s.version = '0.7.0'
  s.summary = 'The Markdown parser with support for jekyll yaml frontmatter'
  s.description = 'Self-contained Markdown parser for GitHub, with all our custom extensions'
  s.date = '2013-10-01'
  s.email = 'username@franzoni.eu'
  s.homepage = 'https://github.com/alanfranz/github-markdown-jekyll'
  s.authors = ['GitHub, Inc', 'Alan Franzoni']
  # = MANIFEST =
  s.files = %w[
    Rakefile
    bin/gfm
    ext/markdown/autolink.c
    ext/markdown/autolink.h
    ext/markdown/buffer.c
    ext/markdown/buffer.h
    ext/markdown/extconf.rb
    ext/markdown/gh-markdown.c
    ext/markdown/houdini.h
    ext/markdown/houdini_href_e.c
    ext/markdown/houdini_html_e.c
    ext/markdown/html.c
    ext/markdown/html.h
    ext/markdown/html_blocks.h
    ext/markdown/markdown.c
    ext/markdown/markdown.h
    ext/markdown/plaintext.c
    ext/markdown/plaintext.h
    ext/markdown/stack.c
    ext/markdown/stack.h
    github-markdown-jekyll.gemspec
    lib/github/markdown.rb
    test/gfm_test.rb
  ]
  # = MANIFEST =
  s.test_files = ["test/gfm_test.rb"]
  s.extensions = ["ext/markdown/extconf.rb"]
  s.require_paths = ["lib"]
  s.add_development_dependency 'rake-compiler', '~> 0.9.2'
  s.add_development_dependency 'nokogiri', '~> 1.6.2.1'
end
