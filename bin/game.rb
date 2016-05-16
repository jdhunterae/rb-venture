GAME_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

require File.join(GAME_ROOT, 'lib', 'bootstrap')
require File.join(GAME_ROOT, 'lib', 'game')

def lookup_file_from(path)
    File.absolute_path(File.join(GAME_ROOT, path))
end

# TODO: This could be a little nicer.
location_data_file = lookup_file_from (ARGV[0]).to_s
message_data_file = lookup_file_from (ARGV[1]).to_s

bootstrap = Bootstrap.new(location_data_file, message_data_file)
game = Game.new(bootstrap)
game.play