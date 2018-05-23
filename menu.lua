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

local function add_menu_to_bar(menu_list, label, callback)
    local menu_item

    menu_item = {}
    menu_item.label = label
    menu_item.callback = callback
    if not menu_list[1] then
        menu_item.xmin = 0
    else
        menu_item.xmin = menu_list[#menu_list].xmax + 1
    end
    menu_item.xmax = (#label * 10) + menu_item.xmin
    menu_item.ymin = 0
    menu_item.ymax = constant.OFFSET_Y
    menu_list[#menu_list + 1] = menu_item
end
menu.add_menu_to_bar = add_menu_to_bar

local function shift_menu_bar_items(menu_list, from)
    while menu_list[from] and menu_list[from + 1] do
        if from == 1 then
            menu_list[from + 1].xmin = 0
        else
            menu_list[from + 1].xmin = menu_list[from].xmin
        end
        menu_list[from] = menu_list[from + 1]
        menu_list[from].xmax = (#menu_list[from].label * 10) + menu_list[from].xmin
    end
    menu_list[#menu_list] = nil
end
menu.shift_menu_bar_items = shift_menu_bar_items

local function remove_menu_from_bar(menu_list, label)
    local i

    i = 1
    while menu_list[i] do
        if menu_list[i].label == label then
            shift_menu_bar_items(menu_list, i)
            return true
        end
        i = i + 1
    end
    return false
end
menu.remove_menu_from_bar = remove_menu_from_bar

local function create_menu_bar()
    local menu_list

    menu_list = {}
    add_menu_to_bar(menu_list, 'Open', savegame.open)
    add_menu_to_bar(menu_list, 'Save', savegame.save)
    add_menu_to_bar(menu_list, 'Next', nil)
    return menu_list
end
menu.create_menu_bar = create_menu_bar

return menu