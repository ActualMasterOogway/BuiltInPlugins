local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local l_createElement_0 = v1.createElement;
return function(v3) --[[ Line: 7 ]] --[[ Name: FocusTracker ]]
    -- upvalues: v1 (copy), l_createElement_0 (copy)
    local v4 = v1.useRef(nil);
    local v5 = v1.useCallback(function() --[[ Line: 12 ]]
        -- upvalues: v4 (copy)
        if v4.current then
            v4.current:CaptureFocus();
        end;
    end, {
        v4
    });
    local v8 = v1.useCallback(function(_, v7) --[[ Line: 18 ]]
        -- upvalues: v5 (copy)
        if v7.UserInputType == Enum.UserInputType.MouseButton1 or v7.UserInputType == Enum.UserInputType.Touch then
            v5();
        end;
    end, {
        v5
    });
    local v12 = v1.useCallback(function(v9, v10, v11) --[[ Line: 27 ]]
        -- upvalues: v3 (copy), v5 (copy)
        if v11 ~= nil then
            v3.onFocusLost(v9, v10, v11, v5);
        end;
    end, {
        v3.onFocusLost, 
        v5
    });
    return l_createElement_0("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        [v1.Event.InputBegan] = v8
    }, {
        Dummy = l_createElement_0("TextBox", {
            Visible = false, 
            ref = v4, 
            [v1.Event.FocusLost] = v12
        })
    });
end;