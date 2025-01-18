local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactOtter);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v6 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v7 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local _ = require(l_script_FirstAncestor_0.Enums.ScrollBarVisibility);
local v9 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v10 = {
    frequency = 2
};
local v11 = {
    scrollBarVisibility = "Auto"
};
return v2.memo(v2.forwardRef(function(v12, v13) --[[ Line: 39 ]] --[[ Name: ScrollingFrame ]]
    -- upvalues: v5 (copy), v11 (copy), v6 (copy), v7 (copy), v2 (copy), v3 (copy), v10 (copy), v9 (copy)
    local v14 = v5(v12, v11);
    local v15 = v6();
    local v16 = v7();
    local v17 = v2.useRef(nil);
    local v18, v19 = v3.useAnimatedBinding(1);
    local v22 = v2.useCallback(function(v20, v21) --[[ Line: 46 ]]
        -- upvalues: v17 (copy), v19 (copy), v3 (ref), v15 (copy), v10 (ref)
        if v17.current then
            task.cancel(v17.current);
        end;
        if v20 then
            v19(v3.spring(v15.Color.Shift.Shift_200.Transparency, v10));
        end;
        if v21 ~= nil then
            v17.current = task.delay(v21, function() --[[ Line: 56 ]]
                -- upvalues: v19 (ref), v3 (ref), v10 (ref)
                v19(v3.spring(1, v10));
            end);
        end;
    end, {
        v15
    });
    v2.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: v14 (copy), v22 (copy), v9 (ref)
        if v14.scrollBarVisibility == "None" then
            v22(false, 0);
            return;
        elseif v14.scrollBarVisibility == "Always" then
            v22(true);
            return;
        else
            local l_v22_0 = v22;
            local v24 = true;
            if v14.controlState ~= v9.Hover then
                v24 = true;
                if v14.controlState ~= v9.Selected then
                    v24 = v14.controlState == v9.Pressed;
                end;
            end;
            l_v22_0(v24, v14.controlState == v9.Default and 0 or nil);
            return;
        end;
    end, {
        v14.scrollBarVisibility, 
        v14.controlState
    });
    return v2.createElement("ScrollingFrame", {
        AutomaticCanvasSize = v14.AutomaticCanvasSize, 
        CanvasSize = v14.CanvasSize, 
        ScrollingDirection = v14.ScrollingDirection, 
        ScrollBarImageColor3 = v15.Color.Shift.Shift_200.Color3, 
        ScrollBarImageTransparency = v18, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        SelectionImageObject = v16, 
        [v2.Change.CanvasPosition] = v14.scrollBarVisibility == "Auto" and function(_) --[[ Line: 95 ]]
            -- upvalues: v22 (copy)
            v22(true, 3);
        end or nil, 
        ref = v13
    }, v14.children);
end));