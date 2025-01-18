local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local l_Select_0 = require(l_Parent_0.Packages.Framework).UI.PropertyCell.Renderers.Select;
local l_collectArray_0 = require(l_Parent_0.Packages.Dash).collectArray;
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
return v1.connect(function(v9) --[[ Line: 64 ]]
    return {
        Fonts = v9.Asset.Fonts
    };
end)(function(v10) --[[ Line: 30 ]] --[[ Name: FontWeightRenderer ]]
    -- upvalues: l_useMemo_0 (copy), l_collectArray_0 (copy), v2 (copy), l_Select_0 (copy)
    local l_Value_0 = v10.Value;
    local l_Weight_0 = l_Value_0.Weight;
    local v17 = l_useMemo_0(function() --[[ Line: 34 ]]
        -- upvalues: v10 (copy), l_Value_0 (copy), l_collectArray_0 (ref)
        local v13 = if v10.Fonts[l_Value_0.Family] then v10.Fonts[l_Value_0.Family].Faces else {};
        return l_collectArray_0(v13, function(_, v15) --[[ Line: 37 ]]
            if v15.Style == Enum.FontStyle.Italic then
                return nil;
            else
                local l_Weight_1 = v15.Weight;
                return {
                    Id = l_Weight_1, 
                    Label = l_Weight_1.Name, 
                    Value = l_Weight_1
                };
            end;
        end);
    end, {
        l_Value_0.Family
    });
    return v2.createElement(l_Select_0, {
        OnChanged = function(v18) --[[ Line: 52 ]] --[[ Name: OnChanged ]]
            -- upvalues: l_Value_0 (copy), v10 (copy)
            l_Value_0.Weight = v18;
            v10.OnChanged(l_Value_0);
        end, 
        PlaceholderText = "Bold (procedural)", 
        Schema = {
            Items = v17
        }, 
        Value = l_Weight_0
    });
end);