local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v4 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v5 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v6 = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
local v7 = require(l_Components_0.InternalTextInput);
local v8 = require(l_Components_0.InputField);
local _ = require(l_Components_0.Types);
local v10 = require(script.Parent.NumberInputControls);
local function _(v11, v12) --[[ Line: 19 ]] --[[ Name: round ]]
    local v13 = 10 ^ (v12 or 0);
    return math.floor(v11 * v13 + 0.5) / v13;
end;
local v16 = {
    minimum = -1e999, 
    maximum = 1e999, 
    step = 1, 
    precision = 3, 
    value = 0, 
    formatAsString = function(v15) --[[ Line: 50 ]] --[[ Name: defaultFormatAsString ]]
        return (tostring(v15));
    end, 
    width = UDim.new(0, 400)
};
return v2.forwardRef(function(v17, v18) --[[ Line: 64 ]] --[[ Name: NumberInput ]]
    -- upvalues: v4 (copy), v16 (copy), v2 (copy), v8 (copy), v5 (copy), v6 (copy), v7 (copy), v10 (copy)
    local v19 = v4(v17, v16);
    local v20, v21 = v2.useState(false);
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    if not v20 then
        local v26 = v19.value + v19.step;
        local v27 = 10 ^ (v19.precision or 0);
        v24 = math.floor(v26 * v27 + 0.5) / v27;
        v22 = v19.maximum < v24;
        v26 = v19.value - v19.step;
        v27 = 10 ^ (v19.precision or 0);
        v25 = math.floor(v26 * v27 + 0.5) / v27;
        v23 = v25 < v19.minimum;
    end;
    local v28;
    if v19.value then
        local l_value_0 = v19.value;
        local v30 = 10 ^ (v19.precision or 0);
        v28 = math.floor(l_value_0 * v30 + 0.5) / v30;
    else
        v28 = 0;
    end;
    local v31 = if v20 then tostring(v19.value) else v19.formatAsString(v28);
    local v32 = v2.useCallback(function() --[[ Line: 96 ]]
        -- upvalues: v21 (copy)
        v21(true);
    end, {
        v21
    });
    local v36 = v2.useCallback(function() --[[ Line: 100 ]]
        -- upvalues: v21 (copy), v19 (copy)
        v21(false);
        local v33 = math.clamp(v19.value, v19.minimum, v19.maximum);
        local l_onChanged_0 = v19.onChanged;
        local v35 = 10 ^ (v19.precision or 0);
        l_onChanged_0(math.floor(v33 * v35 + 0.5) / v35);
    end, {
        v21, 
        v19.onChanged, 
        v19.maximum, 
        v19.minimum, 
        v19.precision, 
        v19.value
    });
    local v39 = v2.useCallback(function(v37) --[[ Line: 106 ]]
        -- upvalues: v20 (copy), v19 (copy)
        if not v20 then
            return;
        else
            local v38 = tonumber(v37);
            if v38 == nil then
                return;
            else
                v19.onChanged(v38);
                return;
            end;
        end;
    end, {
        v20, 
        v19.onChanged
    });
    return v2.createElement(v8, v5(v19, {
        width = v19.width, 
        ref = v18, 
        label = v19.label, 
        size = v6.Small, 
        isRequired = v19.isRequired, 
        hint = v19.hint, 
        input = function(v40) --[[ Line: 127 ]] --[[ Name: input ]]
            -- upvalues: v2 (ref), v7 (ref), v31 (copy), v39 (copy), v36 (copy), v32 (copy), v10 (ref), v19 (copy), v22 (ref), v24 (ref), v23 (ref), v25 (ref)
            return v2.createElement(v7, {
                text = v31, 
                onChanged = v39, 
                onFocusLost = v36, 
                onFocus = v32, 
                ref = v40, 
                trailingElement = v2.createElement(v10, {
                    up = {
                        isDisabled = v19.isDisabled or v22, 
                        onClick = function() --[[ Line: 137 ]] --[[ Name: onClick ]]
                            -- upvalues: v19 (ref), v22 (ref), v24 (ref)
                            if v19.isDisabled or v22 then
                                return;
                            else
                                v19.onChanged(v24);
                                return;
                            end;
                        end
                    }, 
                    down = {
                        isDisabled = v19.isDisabled or v23, 
                        onClick = function() --[[ Line: 146 ]] --[[ Name: onClick ]]
                            -- upvalues: v19 (ref), v23 (ref), v25 (ref)
                            if v19.isDisabled or v23 then
                                return;
                            else
                                v19.onChanged(v25);
                                return;
                            end;
                        end
                    }
                }), 
                isDisabled = v19.isDisabled, 
                tag = "padding-x-medium"
            });
        end
    }));
end);