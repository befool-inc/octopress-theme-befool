require 'octopress-ink'
require 'octopress-befool-theme/version'

Octopress::Ink.add_theme({
  name:          "Octopress Befool Theme",
  gem:           "octopress-befool-theme",
  path:          File.expand_path(File.join(File.dirname(__FILE__), "../")),
  version:       Octopress::Befool::VERSION,
  source_url:    "https://github.com/befool-inc/octopress-befool-theme",
  description:   "A minimalist theme for Jekyll sites build on Octopress Ink"
})
