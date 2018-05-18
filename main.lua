--
-- User: Glastis
-- Mail: glastis@glastis.com
-- Date: 16/05/18
-- Time: 22:44
--

local constant = require('common.constants')
local map = require('map')
local menu = require('menu')

--[[
----    GLOBALS
--]]

local grid
local sprite
local menu_list
local tmp_menu
local tmp_retval

function love.load()
    menu_open = false
    love.window.setMode(constant.WINDOW_SIZE_X, constant.WINDOW_SIZE_Y, {resizable=constant.WINDOW_RESIZABLE, vsync=constant.WINDOW_VSYNC})
    love.window.setTitle(constant.TITLE_LABEL)
    sprite = {}
    sprite.room = {}
    sprite.room[constant.ROOM_0] = love.graphics.newImage(constant.ROOM_0_SPRITE_PATH)
    sprite.room[constant.ROOM_1] = love.graphics.newImage(constant.ROOM_1_SPRITE_PATH)
    sprite.room[constant.ROOM_2] = love.graphics.newImage(constant.ROOM_2_SPRITE_PATH)
    sprite.room[constant.ROOM_3] = love.graphics.newImage(constant.ROOM_3_SPRITE_PATH)

    sprite.monster = {}
    sprite.monster[constant.MONSTER_0] = love.graphics.newImage(constant.MONSTER_0_SPRITE_PATH)
    sprite.monster[constant.MONSTER_1] = love.graphics.newImage(constant.MONSTER_1_SPRITE_PATH)
    sprite.monster[constant.MONSTER_2] = love.graphics.newImage(constant.MONSTER_2_SPRITE_PATH)
    sprite.monster[constant.MONSTER_3] = love.graphics.newImage(constant.MONSTER_3_SPRITE_PATH)
    sprite.monster[constant.MONSTER_4] = love.graphics.newImage(constant.MONSTER_4_SPRITE_PATH)
    sprite.monster[constant.MONSTER_5] = love.graphics.newImage(constant.MONSTER_5_SPRITE_PATH)
    sprite.monster[constant.MONSTER_6] = love.graphics.newImage(constant.MONSTER_6_SPRITE_PATH)

    grid = map.create()
    map.draw(grid, sprite)
    menu_list = menu.create_menu_bar()
end

function love.draw()
    map.draw(grid, sprite)
    menu.draw(menu_list)
end

function love.mousepressed(x, y, button)
    print('x = ' .. tostring(x))
    print('y = ' .. tostring(y))
    print('button = ' .. tostring(button))
    tmp_menu = menu.is_in_menu(menu_list, x, y)
    if tmp_menu then
        tmp_retval = tmp_menu.callback(grid)
        if tmp_retval then
            grid = tmp_retval
        end
    elseif x >= constant.OFFSET_X and y >= constant.OFFSET_Y then
        map.shift_room(grid, x, y)
    end
end
