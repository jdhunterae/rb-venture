require 'minitest/autorun'
require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'room')

ROOM_DESCRIPTION = 'A room.'.freeze
ROOM_HANDLE = 'Test room'.freeze
ROOM_INFO = 'Info about the room.'.freeze
ROOM_ROOMS = [].freeze
ROOM_ITEMS = [].freeze

class RoomTest < MiniTest::Unit::TestCase
    def setup
        @room = Room.new
        @room.description = ROOM_DESCRIPTION
        @room.rooms = ROOM_ROOMS
        @room.items = ROOM_ITEMS
        @room.info = ROOM_INFO
        @room.handle = ROOM_HANDLE
    end

    def test_room_has_properties
        assert_equal(ROOM_DESCRIPTION, @room.description)
        assert_equal(ROOM_ROOMS, @room.rooms)
        assert_equal(ROOM_ITEMS, @room.items)
        assert_equal(ROOM_INFO, @room.info)
        assert_equal(ROOM_HANDLE, @room.handle)
    end

    def test_room_knows_if_it_is_starting_location
        @room.starting_location = false
        refute(@room.starting_location?)

        @room.starting_location = true
        assert(@room.starting_location?)
    end

    def test_room_knows_adjacent_rooms
        @room.rooms = { 'north' => 'room_a', 'south' => 'room_b' }

        assert(@room.has_room_to_the?('north'))
        assert(@room.has_room_to_the?('south'))

        refute(@room.has_room_to_the?('east'))
        refute(@room.has_room_to_the?('west'))
    end
end
