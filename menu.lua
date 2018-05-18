--
-- User: Glastis
-- Mail: glastis@glastis.com
-- Date: 18/05/18
-- Time: 20:29
--

local constant = require('common.constants')
local savegame = require('savegame')

local menu
menu = {}

local function is_in_menu(menu_list, x, y)
    local i

    i = 1
    while menu_list and menu_list[i] do
        if menu_list[i].xmin <= x and menu_list[i].xmax >= x and menu_list[i].ymin <= y and menu_list[i].ymax >= y then
            return menu_list[i]
        end
        i = i + 1
    end
    return nil
end
menu.is_in_menu = is_in_menu

local function draw(menu_list)
    local i

    i = 1
    while menu_list and menu_list[i] do
        if menu_list[i].label then
            love.graphics.print(menu_list[i].label, menu_list[i].xmin, menu_list[i].ymin)
        elseif menu_list[i].sprite then
            love.graphics.draw(menu_list[i].sprite, menu_list[i].xmin, menu_list[i].ymin)
        end
        i = i + 1
    end
end
menu.draw = draw

local function create_menu_bar()
    local menu_list
    local tmp

    menu_list = {}

    tmp = {}
    tmp.xmin = 0
    tmp.xmax = 40
    tmp.ymin = 0
    tmp.ymax = constant.OFFSET_Y
    tmp.label = 'Open'
    tmp.callback = savegame.open
    menu_list[#menu_list + 1] = tmp

    tmp = {}
    tmp.xmin = 40
    tmp.xmax = 80
    tmp.ymin = 0
    tmp.ymax = constant.OFFSET_Y
    tmp.label = 'Save'
    tmp.callback = savegame.save
    menu_list[#menu_list + 1] = tmp

    tmp = {}
    tmp.xmin = 80
    tmp.xmax = 130
    tmp.ymin = 0
    tmp.ymax = constant.OFFSET_Y
    tmp.label = 'Solve'
    tmp.callback = nil
    print(tmp.xmin + (10 * #tmp.label))
    menu_list[#menu_list + 1] = tmp

    return menu_list
end
menu.create_menu_bar = create_menu_bar

return menu