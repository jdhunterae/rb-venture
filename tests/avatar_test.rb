require 'minitest/autorun'
require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'avatar')

class AvatarTest < MiniTest::Unit::TestCase
    def setup
        @starting_location = MiniTest::Mock.new
        @avatar = Avatar.new(@starting_location)
    end

    def teardown
        @starting_location.verify
    end

    def test_avatar_has_location
        assert_equal(@starting_location, @avatar.location)
    end

    def test_avatar_knows_if_can_move_in_a_direction
        @starting_location.expect(:has_room_to_the?, true, ['north'])
        assert(@avatar.can_move_to_the?('north'))

        @starting_location.expect(:has_room_to_the?, fase, ['east'])
        refute(@avatar.can_move_to_the?('east'))
    end

    def test_avatar_can_move
        rooms = MiniTest::Mock.new
        room = MiniTest::Mock.new
        
        rooms.expect(:[], room, ['east'])
        @starting_location.expect(:has_room_to_the?, true, ['east'])
        @starting_location.expect(:rooms, rooms)

        assert(@avatar.move('east'))
        assert_equal(room, @avatar.location)
    end
end
