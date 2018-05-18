--
-- User: Glastis
-- Mail: glastis@glastis.com
-- Date: 18/05/18
-- Time: 20:29
--

local menu
menu = {}

local function is_in_menu(menu_list, x, y)
    local i

    i = 1
    while menu_list and menu_list[i] do
        if menu_list.xmin <= x and menu_list.xmax >= x and menu_list.ymin <= y and menu_list.ymax >= y then
            return menu_list[i]
        end
        i = i + 1
    end
    return false
end
menu.is_in_menu = is_in_menu

return menu