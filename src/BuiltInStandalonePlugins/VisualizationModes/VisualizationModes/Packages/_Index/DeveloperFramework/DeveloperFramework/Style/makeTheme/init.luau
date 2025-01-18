local l_Parent_0 = script.Parent.Parent;
local l_collect_0 = require(l_Parent_0.Parent.Dash).collect;
local l_Style_0 = l_Parent_0.Style;
local v3 = require(l_Style_0.Themes.StudioTheme);
local v4 = require(l_Style_0.ComponentSymbols);
return function(v5, v6, v7) --[[ Line: 22 ]] --[[ Name: makeTheme ]]
    -- upvalues: v3 (copy), l_collect_0 (copy), v4 (copy)
    return function(v8) --[[ Line: 23 ]]
        -- upvalues: v3 (ref), v7 (copy), l_collect_0 (ref), v5 (copy), v4 (ref), v6 (copy)
        local v9 = v8 and v3.mock() or v7 or v3.new();
        local v13 = l_collect_0(v5:GetChildren(), function(_, v11) --[[ Line: 25 ]]
            -- upvalues: v4 (ref)
            local l_style_0 = v11:FindFirstChild("style");
            if l_style_0 then
                return v4:add(v11.Name), require(l_style_0);
            else
                return nil;
            end;
        end);
        return v9:extend(v6 or {}):extend(v13);
    end;
end;