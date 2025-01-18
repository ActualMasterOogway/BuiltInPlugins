local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Enums.CheckboxSize);
local v3 = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
local v4 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v5 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
variantsFactory = function(v8) --[[ Line: 33 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    local v9 = math.ceil(v8.Stroke.Standard);
    local function _(v10) --[[ Line: 35 ]] --[[ Name: getCheckboxSize ]]
        -- upvalues: v9 (copy)
        return UDim2.fromOffset(v10 - v9, v10 - v9);
    end;
    local v12 = {
        container = {
            tag = "row auto-xy align-x-left align-y-center", 
            padding = {
                top = UDim.new(0, v9), 
                bottom = UDim.new(0, v9), 
                left = UDim.new(0, v9)
            }
        }, 
        checkbox = {
            tag = "stroke-standard"
        }, 
        checkmark = {
            tag = "position-center-center anchor-center-center content-action-sub-emphasis"
        }
    };
    local v13 = {};
    local l_Small_0 = v2.Small;
    local v15 = {
        container = {
            tag = "gap-small"
        }
    };
    local v16 = {};
    local l_Size_400_0 = v8.Size.Size_400;
    v16.size = UDim2.fromOffset(l_Size_400_0 - v9, l_Size_400_0 - v9);
    v16.tag = "radius-small";
    v15.checkbox = v16;
    v15.checkmark = {
        tag = "size-300"
    };
    v15.label = {
        size = v3.Small
    };
    v13[l_Small_0] = v15;
    l_Small_0 = v2.Medium;
    v15 = {
        container = {
            tag = "gap-medium"
        }
    };
    v16 = {};
    l_Size_400_0 = v8.Size.Size_500;
    v16.size = UDim2.fromOffset(l_Size_400_0 - v9, l_Size_400_0 - v9);
    v16.tag = "radius-small";
    v15.checkbox = v16;
    v15.checkmark = {
        tag = "size-350"
    };
    v15.label = {
        size = v3.Medium
    };
    v13[l_Small_0] = v15;
    l_Small_0 = v2.Large;
    v15 = {
        container = {
            tag = "gap-small"
        }
    };
    v16 = {};
    l_Size_400_0 = v8.Size.Size_600;
    v16.size = UDim2.fromOffset(l_Size_400_0 - v9, l_Size_400_0 - v9);
    v16.tag = "radius-medium";
    v15.checkbox = v16;
    v15.checkmark = {
        tag = "size-400"
    };
    v15.label = {
        size = v3.Large
    };
    v13[l_Small_0] = v15;
    l_Small_0 = {
        Checked = {
            container = {
                groupTransparency = 0
            }, 
            checkbox = {
                tag = "bg-action-sub-emphasis", 
                stroke = v8.Color.ActionSubEmphasis.Background
            }, 
            label = {
                style = v8.Color.Content.Emphasis
            }
        }, 
        [v4.Hover] = {
            container = {
                groupTransparency = 0
            }, 
            checkbox = {
                stroke = v8.Color.Content.Emphasis
            }, 
            label = {
                style = v8.Color.Content.Emphasis
            }
        }, 
        [v4.Default] = {
            container = {
                groupTransparency = 0
            }, 
            checkbox = {
                stroke = v8.Color.Content.Default
            }, 
            label = {
                style = v8.Color.Content.Default
            }
        }
    };
    return {
        common = v12, 
        sizes = v13, 
        states = l_Small_0
    };
end;
return function(v18, v19, v20) --[[ Line: 147 ]]
    -- upvalues: v7 (copy), v5 (copy)
    local v21 = v7.useVariants("Checkbox", variantsFactory, v18);
    return v5(v21.common, v21.sizes[v19], v21.states[v20]);
end;