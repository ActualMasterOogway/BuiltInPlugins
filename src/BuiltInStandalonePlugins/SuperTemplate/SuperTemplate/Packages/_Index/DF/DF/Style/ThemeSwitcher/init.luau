local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.Util.Signal);
local l_Style_0 = l_Parent_0.Style;
local v4 = require(l_Style_0.Themes.DarkTheme);
local v5 = require(l_Style_0.Themes.LightTheme);
local v6 = require(l_Style_0.createDefaultTheme);
local function _() --[[ Line: 16 ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 17 ]]
        return settings().Studio.Theme.Name;
    end);
    if not l_status_0 then
        return "Dark";
    else
        return l_result_0;
    end;
end;
local v10 = v2.new();
pcall(function() --[[ Line: 28 ]]
    -- upvalues: v10 (copy)
    settings().Studio.ThemeChanged:Connect(function() --[[ Line: 29 ]]
        -- upvalues: v10 (ref)
        v10:Fire();
    end);
end);
local v11 = {
    current = "Default"
};
v11.getThemeName = function() --[[ Line: 38 ]] --[[ Name: getThemeName ]]
    -- upvalues: v11 (copy)
    if v11.current == "Default" then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 17 ]]
            return settings().Studio.Theme.Name;
        end);
        if not l_status_1 then
            return "Dark";
        else
            return l_result_1;
        end;
    else
        return v11.current;
    end;
end;
v11.setTheme = function(v14) --[[ Line: 46 ]] --[[ Name: setTheme ]]
    -- upvalues: v11 (copy), v10 (copy)
    v11.current = v14;
    v10:Fire();
    local l_StudioDesign_0 = game:GetService("StylingService"):FindFirstChild("StudioDesign");
    if l_StudioDesign_0 then
        l_StudioDesign_0.Design:SetDerives({
            l_StudioDesign_0.Themes:FindFirstChild(v14)
        });
    end;
end;
v11.new = function(v16, v17) --[[ Line: 56 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v1 (copy), v5 (copy), v10 (copy), v11 (copy), v6 (copy)
    local l_v4_0 = v4;
    if v16 then
        l_v4_0 = v1.Dictionary.join(v4, v16);
    end;
    local l_v5_0 = v5;
    if v17 then
        l_v5_0 = v1.Dictionary.join(v5, v17);
    end;
    local v20 = v1.Dictionary.join({
        themesList = {
            Dark = l_v4_0, 
            Light = l_v5_0
        }, 
        themeChangedConnection = v10
    }, v11);
    return v6(v20);
end;
return v11;