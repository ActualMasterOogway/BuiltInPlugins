local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.Util.Signal);
local l_Style_0 = l_Parent_0.Style;
local v4 = require(l_Style_0.Themes.DarkTheme);
local v5 = require(l_Style_0.Themes.LightTheme);
local v6 = require(l_Style_0.createDefaultTheme);
local v7 = require(l_Style_0.StudioThemeFallback);
local v8 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkStorybookEmbedStyles);
local function _() --[[ Line: 19 ]]
    -- upvalues: v7 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 20 ]]
        return settings().Studio.Theme.Name;
    end);
    if not l_status_0 then
        return v7;
    else
        return l_result_0;
    end;
end;
local v12 = v2.new();
pcall(function() --[[ Line: 31 ]]
    -- upvalues: v12 (copy)
    settings().Studio.ThemeChanged:Connect(function() --[[ Line: 32 ]]
        -- upvalues: v12 (ref)
        v12:Fire();
    end);
end);
local v13 = {
    current = "Default"
};
v13.getThemeName = function() --[[ Line: 41 ]] --[[ Name: getThemeName ]]
    -- upvalues: v13 (copy), v7 (copy)
    if v13.current == "Default" then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 20 ]]
            return settings().Studio.Theme.Name;
        end);
        if not l_status_1 then
            return v7;
        else
            return l_result_1;
        end;
    else
        return v13.current;
    end;
end;
v13.setTheme = function(v16) --[[ Line: 49 ]] --[[ Name: setTheme ]]
    -- upvalues: v13 (copy), v12 (copy), v8 (copy)
    v13.current = v16;
    v12:Fire();
    local l_StudioDesign_0 = game:GetService("StylingService"):FindFirstChild("StudioDesign");
    if l_StudioDesign_0 then
        if v8 then
            l_StudioDesign_0.Design:SetDerives({
                l_StudioDesign_0.Themes:FindFirstChild(v13.getThemeName())
            });
            return;
        else
            l_StudioDesign_0.Design:SetDerives({
                l_StudioDesign_0.Themes:FindFirstChild(v16)
            });
        end;
    end;
end;
v13.new = function(v18, v19) --[[ Line: 64 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v1 (copy), v5 (copy), v12 (copy), v13 (copy), v8 (copy), v6 (copy)
    local l_v4_0 = v4;
    if v18 then
        l_v4_0 = v1.Dictionary.join(v4, v18);
    end;
    local l_v5_0 = v5;
    if v19 then
        l_v5_0 = v1.Dictionary.join(v5, v19);
    end;
    local v22 = v1.Dictionary.join({
        themesList = {
            Dark = l_v4_0, 
            Light = l_v5_0
        }, 
        themeChangedConnection = v12
    }, v13);
    if v8 then
        local v23 = v6(v22);
        v13.setTheme(v13.current);
        return v23;
    else
        return v6(v22);
    end;
end;
return v13;