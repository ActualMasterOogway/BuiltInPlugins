local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.ToggleSize);
local v2 = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
local v3 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v9(v6) --[[ Line: 38 ]] --[[ Name: computeProps ]]
    local v7 = (v6.size.height - v6.knobSize) / 2;
    local v8 = v6.knobSize + 2 * v6.knobShadowPadding;
    return {
        toggle = {
            size = UDim2.fromOffset(v6.size.width, v6.size.height), 
            cornerRadius = UDim.new(0, v6.cornerRadius)
        }, 
        knob = {
            offPosition = UDim2.new(0, v7, 0.5, 0), 
            onPosition = UDim2.new(0, v6.size.width - v6.knobSize - v7, 0.5, 0), 
            size = UDim2.fromOffset(v6.knobSize, v6.knobSize)
        }, 
        knobShadow = {
            size = UDim2.fromOffset(v8, v8), 
            padding = v6.knobShadowPadding
        }, 
        label = {
            size = v6.labelSize
        }
    };
end;
local function v13(v10) --[[ Line: 67 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v1 (copy), v9 (copy), v2 (copy)
    local v11 = {
        knob = {
            tag = "anchor-center-left radius-circle"
        }, 
        knobShadow = {
            tag = "anchor-center-left"
        }
    };
    local v12 = {
        [v1.Medium] = v9({
            size = {
                width = v10.Size.Size_1000, 
                height = v10.Size.Size_500
            }, 
            knobSize = v10.Size.Size_400, 
            cornerRadius = v10.Radius.Large, 
            knobShadowPadding = v10.Padding.XSmall, 
            labelSize = v2.Medium
        }), 
        [v1.Large] = v9({
            size = {
                width = v10.Size.Size_1600, 
                height = v10.Size.Size_900
            }, 
            knobSize = v10.Size.Size_700, 
            cornerRadius = v10.Radius.Circle, 
            knobShadowPadding = v10.Padding.Small, 
            labelSize = v2.Large
        })
    };
    return {
        common = v11, 
        sizes = v12
    };
end;
return function(v14, v15) --[[ Line: 96 ]]
    -- upvalues: v5 (copy), v13 (copy), v3 (copy)
    local v16 = v5.useVariants("Toggle", v13, v14);
    return v3(v16.common, v16.sizes[v15]);
end;