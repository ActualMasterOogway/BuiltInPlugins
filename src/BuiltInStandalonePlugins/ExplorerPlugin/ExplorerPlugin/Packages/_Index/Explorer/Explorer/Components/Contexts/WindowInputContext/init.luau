local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Observable);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.Signal);
local v4 = require(l_script_FirstAncestor_0.Hooks.useEventConnection);
local l_createElement_0 = v2.createElement;
local v6 = {
    windowHoveredObservable = v1.create(true), 
    inputBeganSignal = v3.new(), 
    inputChangedSignal = v3.new(), 
    inputEndedSignal = v3.new()
};
local v7 = v2.createContext(v6);
local function v13(v8) --[[ Line: 28 ]] --[[ Name: Provider ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), l_createElement_0 (copy), v7 (copy)
    local v9 = v2.useState(v3.new);
    v4(v8.inputChangedSignal, function(v10, v11) --[[ Line: 40 ]]
        -- upvalues: v8 (copy), v9 (copy)
        if v10.UserInputState == Enum.UserInputState.Begin then
            v8.inputBeganSignal:Fire(v10, v11);
            return;
        else
            v9:Fire(v10, v11);
            return;
        end;
    end, {
        v8.inputBeganSignal, 
        v9
    });
    local v12 = {
        inputBeganSignal = v8.inputBeganSignal, 
        inputChangedSignal = v9, 
        inputEndedSignal = v8.inputEndedSignal, 
        windowHoveredObservable = v8.windowHoveredObservable
    };
    return l_createElement_0(v7.Provider, {
        value = v12
    }, v8.children);
end;
return {
    Context = v7, 
    Provider = v13, 
    StandardProvider = function(v14) --[[ Line: 60 ]] --[[ Name: StandardProvider ]]
        -- upvalues: v2 (copy), v3 (copy), v1 (copy), l_createElement_0 (copy), v13 (copy)
        local v15 = v2.useState(v3.new);
        local v16 = v2.useState(v3.new);
        local v17 = v2.useState(v3.new);
        local v18, v19 = v1.useState(false);
        local v20 = v2.useCallback(function() --[[ Line: 68 ]]
            -- upvalues: v19 (copy)
            v19(true);
        end, {});
        local v21 = v2.useCallback(function() --[[ Line: 72 ]]
            -- upvalues: v19 (copy)
            v19(false);
        end, {});
        local v25 = v2.useCallback(function(_, v23, v24) --[[ Line: 76 ]]
            -- upvalues: v15 (copy)
            v15:Fire(v23, v24);
        end, {
            v15
        });
        local v29 = v2.useCallback(function(_, v27, v28) --[[ Line: 80 ]]
            -- upvalues: v16 (copy)
            v16:Fire(v27, v28);
        end, {
            v16
        });
        local v33 = v2.useCallback(function(_, v31, v32) --[[ Line: 84 ]]
            -- upvalues: v17 (copy)
            v17:Fire(v31, v32);
        end, {
            v17
        });
        return l_createElement_0(v13, {
            windowHoveredObservable = v18, 
            inputBeganSignal = v15, 
            inputChangedSignal = v16, 
            inputEndedSignal = v17
        }, {
            WindowHoverCatcher = l_createElement_0("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                [v2.Event.MouseEnter] = v20, 
                [v2.Event.MouseLeave] = v21, 
                [v2.Event.InputBegan] = v25, 
                [v2.Event.InputChanged] = v29, 
                [v2.Event.InputEnded] = v33
            }, v14.children)
        });
    end
};