local l_Parent_0 = script:FindFirstAncestor("Style").Parent;
local v1 = require(l_Parent_0.Style.Themes.DarkTheme);
local v2 = require(l_Parent_0.Style.Themes.LightTheme);
local v3 = require(l_Parent_0.Style.createDefaultTheme);
local v4 = require(l_Parent_0.Parent.Dash);
local v5 = require(l_Parent_0.Util.Signal);
local l_join_0 = v4.join;
local v7 = require(script.Parent.StudioTheme_stubbed);
v7.new = function(v8, v9) --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: l_join_0 (copy), v1 (copy), v2 (copy), v5 (copy), v3 (copy)
    local v10 = l_join_0(v1, v8);
    local v11 = l_join_0(v2, v9);
    local v12 = "Light";
    local v13 = v5.new();
    local v14 = {
        getThemeName = function() --[[ Line: 22 ]] --[[ Name: getThemeName ]]
            -- upvalues: v12 (ref)
            return v12;
        end, 
        themesList = {
            Dark = v10, 
            Light = v11
        }, 
        themeChangedConnection = v13
    };
    local v15 = v3(v14);
    v15.changeTheme = function(_, v17) --[[ Line: 32 ]] --[[ Name: changeTheme ]]
        -- upvalues: v12 (ref), v13 (copy)
        v12 = v17;
        v13:Fire(v17);
    end;
    return v15;
end;
return v7;