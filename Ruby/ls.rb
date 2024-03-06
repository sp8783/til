# frozen_string_literal: true

require_relative 'ls_command'

def main
  options = ARGV.getopts('a', 'r', 'l')
  path = ARGV[0]

  Ls.new(path, options).execute
end

main
