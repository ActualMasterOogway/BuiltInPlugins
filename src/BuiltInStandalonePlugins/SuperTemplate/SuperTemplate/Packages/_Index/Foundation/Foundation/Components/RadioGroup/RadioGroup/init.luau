local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.View);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v6 = require(script.Parent.CheckedValueContext);
return v2.memo(v2.forwardRef(function(v7, v8) --[[ Line: 20 ]] --[[ Name: RadioGroup ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v6 (copy)
    local v9, v10 = v2.useState(v7.value);
    v2.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v7 (copy), v10 (copy)
        if v7.value ~= nil then
            v10(v7.value);
        end;
    end, {
        v7.value
    });
    local v12 = v2.useCallback(function(v11) --[[ Line: 29 ]]
        -- upvalues: v10 (copy), v7 (copy)
        v10(v11);
        v7.onValueChanged(v11);
    end, {
        v10, 
        v7.onValueChanged
    });
    return v2.createElement(v3, v5(v7, {
        tag = "auto-xy col gap-large", 
        ref = v8
    }), {
        CheckedValueContext = v2.createElement(v6.Provider, {
            value = {
                value = v9, 
                onValueChanged = v12
            }
        }, v7.children)
    });
end));