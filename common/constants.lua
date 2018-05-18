--
-- User: Luciano
-- Date: 11/11/2017
-- Time: 20:07
--

local constant

constant = {}

constant.OFFSET_X = 0
constant.OFFSET_Y = 0
constant.MAX_ROOM_X = 8
constant.MAX_ROOM_Y = 6
constant.ROOM_SIZE_X = 100
constant.ROOM_SIZE_Y = 100

constant.ROOM_0 = 0
constant.ROOM_1 = 1
constant.ROOM_2 = 2
constant.ROOM_3 = 3
constant.ROOM_MAX = constant.ROOM_3
constant.ROOM_0_SPRITE_PATH = 'assets/room_0.png'
constant.ROOM_1_SPRITE_PATH = 'assets/room_1.png'
constant.ROOM_2_SPRITE_PATH = 'assets/room_2.png'
constant.ROOM_3_SPRITE_PATH = 'assets/room_3.png'

constant.MONSTER_0 = 0
constant.MONSTER_1 = 1
constant.MONSTER_2 = 2
constant.MONSTER_3 = 3
constant.MONSTER_4 = 4
constant.MONSTER_5 = 5
constant.MONSTER_6 = 6
constant.MONSTER_7 = 7
constant.MONSTER_0_NAME = 'chinese'
constant.MONSTER_1_NAME = 'cool_zombie'
constant.MONSTER_2_NAME = 'fish'
constant.MONSTER_3_NAME = 'ghost'
constant.MONSTER_4_NAME = 'pig'
constant.MONSTER_5_NAME = 'plant'
constant.MONSTER_6_NAME = 'witch'
constant.MONSTER_7_NAME = 'zombie'
constant.MONSTER_0_SPRITE_PATH = 'assets/monsters/chinese.png'
constant.MONSTER_1_SPRITE_PATH = 'assets/monsters/cool_zombie.png'
constant.MONSTER_2_SPRITE_PATH = 'assets/monsters/fish.png'
constant.MONSTER_3_SPRITE_PATH = 'assets/monsters/ghost.png'
constant.MONSTER_4_SPRITE_PATH = 'assets/monsters/pig.png'
constant.MONSTER_5_SPRITE_PATH = 'assets/monsters/plant.png'
constant.MONSTER_6_SPRITE_PATH = 'assets/monsters/witch.png'
constant.MONSTER_7_SPRITE_PATH = 'assets/monsters/zombie.png'

constant.WINDOW_SIZE_X = constant.ROOM_SIZE_X * constant.MAX_ROOM_X
constant.WINDOW_SIZE_Y = constant.ROOM_SIZE_Y * constant.MAX_ROOM_Y

constant.WINDOW_RESIZABLE = false
constant.WINDOW_VSYNC = false
return constant