local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v3 = require(l_script_FirstAncestor_0.Components.PropertyView.getPropertyView);
return function(v4) --[[ Line: 7 ]] --[[ Name: PropertyView ]]
    -- upvalues: v1 (copy), v3 (copy)
    local l_record_0 = v4.record;
    local l_id_0 = l_record_0.id;
    local l_session_0 = v4.session;
    local v9 = v1.useCallback(function(v8) --[[ Line: 21 ]]
        -- upvalues: l_session_0 (copy), l_id_0 (copy)
        return l_session_0.beginEditingPropertyAsync(l_id_0, v8);
    end, {
        l_session_0, 
        l_id_0
    });
    local v12 = v1.useCallback(function(v10, v11) --[[ Line: 25 ]]
        -- upvalues: l_session_0 (copy), l_id_0 (copy)
        l_session_0.setPropertyPart(l_id_0, v10, v11);
    end, {
        l_session_0, 
        l_id_0
    });
    local v14 = v1.useCallback(function(v13) --[[ Line: 29 ]]
        -- upvalues: l_session_0 (copy), l_id_0 (copy)
        l_session_0.finishEditingProperty(l_id_0, v13);
    end, {
        l_session_0, 
        l_id_0
    });
    local v15 = v1.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v3 (ref), l_record_0 (copy)
        return v3(l_record_0);
    end, {
        l_id_0, 
        l_record_0.value.typeof
    });
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v4.size, 
        Position = v4.position, 
        LayoutOrder = v4.layoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        SpecificView = v1.createElement(v15, {
            info = l_record_0.value, 
            beginEditingAsync = v9, 
            setPart = v12, 
            finishEditing = v14
        })
    });
end;