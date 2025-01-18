local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v2.useEffect;
local l_useState_0 = v2.useState;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_Slider_0 = v1.UI.Slider;
return function(v7) --[[ Line: 29 ]] --[[ Name: DelayedSliderRenderer ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy), v2 (copy), l_Slider_0 (copy), l_StyleModifier_0 (copy)
    local l_Schema_0 = v7.Schema;
    local v9, v10 = l_useState_0(v7.Value);
    l_useEffect_0(function() --[[ Line: 33 ]]
        -- upvalues: v7 (copy), v9 (copy), v10 (copy), l_Schema_0 (copy)
        if v7.Value ~= v9 then
            v10(v7.Value or l_Schema_0.Min);
        end;
    end, {
        v7.Value
    });
    local v11, v12 = l_useState_0(false);
    l_useEffect_0(function() --[[ Line: 39 ]]
        -- upvalues: v11 (copy), v7 (copy), v9 (copy), l_Schema_0 (copy), v12 (copy)
        if v11 then
            v7.OnChanged((math.clamp(v9, l_Schema_0.Min, l_Schema_0.Max)));
            v12(false);
        end;
    end, {
        v11, 
        v9
    });
    return v2.createElement(l_Slider_0, {
        Disabled = v7.Disabled, 
        Max = l_Schema_0.Max, 
        Min = l_Schema_0.Min, 
        OnInputEnded = function() --[[ Line: 50 ]] --[[ Name: OnInputEnded ]]
            -- upvalues: v12 (copy)
            v12(true);
        end, 
        OnValueChanged = function(v13) --[[ Line: 53 ]] --[[ Name: OnValueChanged ]]
            -- upvalues: v10 (copy)
            v10(v13 or 0);
        end, 
        Size = UDim2.new(1, 0, 0, 24), 
        CustomValidation = v7.CustomValidation, 
        ShowInput = l_Schema_0.ShowInput, 
        SnapIncrement = l_Schema_0.SnapIncrement, 
        StyleModifier = if v7.HasError then l_StyleModifier_0.Error else nil, 
        VerticalDragTolerance = 0, 
        Value = v9
    });
end;