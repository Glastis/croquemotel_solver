--
-- User: Glastis
-- Mail: glastis@glastis.com
-- Date: 18/05/18
-- Time: 22:16
--

dofile('libs/libSaveTableToFile.lua')
local constant = require('common.constants')

local savegame
savegame = {}

local function open()
    local tmp
    local data

    data, tmp = table.load(constant.SAVE_FILENAME)
    if tmp then
        print(tmp)
    else
        return data
    end
    return nil
end
savegame.open = open

local function save(data)
    print(table.save(data, constant.SAVE_FILENAME))
    return nil
end
savegame.save = save

return savegame

