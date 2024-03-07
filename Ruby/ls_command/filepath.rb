# frozen_string_literal: true

class Filepath
  attr_reader :path, :options

  def initialize(path, options)
    @path = path
    @options = options
  end

  def make_all_file_paths
    sort_file_paths(glob_file_paths(path))
  end

  def glob_file_paths(path)
    if path.nil?
      is_all ? Dir.entries('.') : Dir.glob('*')
    elsif FileTest.directory?(path)
      is_all ? Dir.entries(path) : Dir.glob(File.join(path, '*'))
    elsif FileTest.file?(path)
      [path]
    else
      puts "ls: cannot access '#{path}': No such file or directory"
      exit
    end
  end

  def sort_file_paths(all_file_paths)
    all_file_paths.sort! { |x, y| x.casecmp(y).nonzero? || y <=> x }
    options['r'] ? all_file_paths.reverse : all_file_paths
  end

  def is_file
    path.nil? || FileTest.file?(path)
  end
end
