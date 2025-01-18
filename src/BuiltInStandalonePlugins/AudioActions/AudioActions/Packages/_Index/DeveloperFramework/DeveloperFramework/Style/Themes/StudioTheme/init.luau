local l_Parent_0 = script:FindFirstAncestor("Style").Parent;
local v1 = require(l_Parent_0.Style.Themes.DarkTheme);
local v2 = require(l_Parent_0.Style.Themes.LightTheme);
local v3 = require(l_Parent_0.Style.createDefaultTheme);
local v4 = require(l_Parent_0.Parent.Cryo);
local function v5() --[[ Line: 11 ]]
    return settings().Studio.Theme.Name;
end;
return {
    new = function(v6, v7) --[[ Line: 17 ]] --[[ Name: new ]]
        -- upvalues: v1 (copy), v4 (copy), v2 (copy), v5 (copy), v3 (copy)
        local l_v1_0 = v1;
        if v6 then
            l_v1_0 = v4.Dictionary.join(v1, v6);
        end;
        local l_v2_0 = v2;
        if v7 then
            l_v2_0 = v4.Dictionary.join(v2, v7);
        end;
        local v10 = {
            getThemeName = v5, 
            themesList = {
                Dark = l_v1_0, 
                Light = l_v2_0
            }, 
            themeChangedConnection = settings().Studio.ThemeChanged
        };
        return v3(v10);
    end, 
    mock = function(v11) --[[ Line: 39 ]] --[[ Name: mock ]]
        -- upvalues: v1 (copy), v4 (copy), v3 (copy)
        local l_v1_1 = v1;
        if v11 then
            l_v1_1 = v4.Dictionary.join(v1, v11);
        end;
        local v13 = {
            getThemeName = function() --[[ Line: 46 ]] --[[ Name: getThemeName ]]
                return "Dark";
            end, 
            themesList = {
                Dark = l_v1_1
            }
        };
        return v3(v13);
    end
};