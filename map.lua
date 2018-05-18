--
-- User: Glastis
-- Mail: glastis@glastis.com
-- Date: 17/05/18
-- Time: 00:49
--

local constant = require('common.constants')

local map
map = {}

local function create()
    local grid
    local line
    local x
    local y

    x = 0
    y = 0
    grid = {}
    line = {}
    while y < constant.MAX_ROOM_Y do
        line[#line + 1] = constant.ROOM_0
        x = x + 1
        if x > constant.MAX_ROOM_X then
            grid[#grid + 1] = line
            line = {}
            x = 0
            y = y + 1
        end
    end
    return grid
end
map.create = create

local function draw(grid, sprite)
    local x
    local y

    x = 1
    y = 1
    while grid[y] do
        love.graphics.draw(sprite.room[grid[y][x]], ((x - 1) * constant.ROOM_SIZE_X) + constant.OFFSET_X, ((y - 1) * constant.ROOM_SIZE_Y) + constant.OFFSET_Y)
        x = x + 1
        if not grid[y][x] then
            x = 1
            y = y + 1
        end
    end
end
map.draw = draw

local function shift_room(grid, x, y)
    x = math.floor((x - constant.OFFSET_X) / constant.ROOM_SIZE_X) + 1
    y = math.floor((y - constant.OFFSET_Y) / constant.ROOM_SIZE_Y) + 1
    print('shift_room x = ' .. tostring(x))
    print('shift_room y = ' .. tostring(y))
    grid[y][x] = grid[y][x] + 1
    if grid[y][x] > constant.ROOM_MAX then
        grid[y][x] = constant.ROOM_0
    end
end
map.shift_room = shift_room

return map