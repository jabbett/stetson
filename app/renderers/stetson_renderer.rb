require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class StetsonRenderer < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end
