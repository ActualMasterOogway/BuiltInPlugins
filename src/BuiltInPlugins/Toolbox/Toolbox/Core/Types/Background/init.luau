local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.isCli);
local v2 = {
    BACKGROUNDS = {
        {
            name = "White", 
            color = "White"
        }, 
        {
            name = "Black", 
            color = "Black"
        }, 
        {
            name = "None", 
            color = "None"
        }
    }, 
    WHITE = 1, 
    BLACK = 2, 
    NONE = 3
};
v2.getBackgroundForStudioTheme = function() --[[ Line: 27 ]] --[[ Name: getBackgroundForStudioTheme ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v1() then
        return v2.NONE;
    else
        local l_Name_0 = settings().Studio.Theme.Name;
        if l_Name_0 == "Light" then
            return v2.WHITE;
        elseif l_Name_0 == "Dark" then
            return v2.NONE;
        else
            return v2.NONE;
        end;
    end;
end;
return v2;