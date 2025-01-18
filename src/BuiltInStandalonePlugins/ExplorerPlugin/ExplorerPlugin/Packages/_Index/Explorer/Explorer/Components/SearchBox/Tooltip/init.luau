local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local l_createElement_0 = v1.createElement;
return function(v3) --[[ Line: 7 ]] --[[ Name: Tooltip ]]
    -- upvalues: v1 (copy), l_createElement_0 (copy)
    local v4, v5 = v1.useState(false);
    local v6 = v1.useRef(0);
    local v7 = v1.useRef(nil);
    local v9 = v1.useCallback(function() --[[ Line: 19 ]]
        -- upvalues: v7 (copy)
        local l_current_0 = v7.current;
        if l_current_0 ~= nil then
            task.cancel(l_current_0);
        end;
    end, {});
    local v10 = v1.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: v9 (copy), v6 (copy), v3 (copy), v7 (copy), v5 (copy)
        v9();
        v6.current = os.clock() + v3.showDelay;
        v7.current = task.spawn(function() --[[ Line: 30 ]]
            -- upvalues: v6 (ref), v7 (ref), v5 (ref)
            while os.clock() < v6.current do
                task.wait();
            end;
            v7.current = nil;
            v5(true);
        end);
    end, {
        v9, 
        v3.showDelay
    });
    local v11 = v1.useCallback(function() --[[ Line: 39 ]]
        -- upvalues: v6 (copy), v3 (copy)
        v6.current = os.clock() + v3.showDelay;
    end, {
        v6, 
        v3.showDelay
    });
    local v12 = v1.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: v9 (copy), v5 (copy)
        v9();
        v5(false);
    end, {
        v9
    });
    return l_createElement_0("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        [v1.Event.MouseEnter] = v10, 
        [v1.Event.MouseLeave] = v12, 
        [v1.Event.MouseMoved] = v11
    }, {
        Text = v4 and l_createElement_0("TextLabel", {
            AnchorPoint = v3.anchorPoint, 
            Position = v3.position, 
            Text = v3.text, 
            [v1.Tag] = "X-Fit X-PadS Explorer-BG-Surface0 Explorer-StandardText Explorer-SearchBox-Corner"
        })
    });
end;