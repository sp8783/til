# frozen_string_literal: true

require_relative 'filepath'

class LsCommand
  def initialize(path, options)
    @path = path
    @options = options
  end

  def execute
    all_file_paths = make_all_file_paths
  end

end
