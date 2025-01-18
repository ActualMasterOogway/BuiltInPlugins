local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_1.React);
local l_useForwardRef_0 = require(l_Parent_1.ReactUtils).useForwardRef;
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local _ = require(l_script_FirstAncestor_0.Enums.ControlStateEvent);
local v7 = require(l_Parent_0.createGuiControlStateTable);
return function(v8, v9, v10) --[[ Line: 17 ]] --[[ Name: useGuiControlState ]]
    -- upvalues: v3 (copy), v7 (copy), l_useForwardRef_0 (copy)
    local v11 = v3.useRef(v10);
    local v12 = v3.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: v7 (ref), v9 (copy)
        return v7(v9);
    end, {});
    v3.useEffect(function() --[[ Line: 28 ]]
        -- upvalues: v12 (copy), v9 (copy)
        v12:onStateChange(v9);
    end, {
        v9
    });
    local v19 = v3.useCallback(function(v13) --[[ Line: 32 ]]
        -- upvalues: v11 (copy), v12 (copy)
        local v14 = {};
        if v13 then
            table.insert(v14, v13.InputBegan:Connect(function(v15) --[[ Line: 50 ]]
                -- upvalues: v11 (ref), v12 (ref)
                if not v11.current then
                    return nil;
                else
                    if v15.UserInputType == Enum.UserInputType.MouseButton1 or v15.UserInputType == Enum.UserInputType.Touch or v15.KeyCode == Enum.KeyCode.ButtonA or v15.KeyCode == Enum.KeyCode.Return then
                        v12.events.PrimaryPressed();
                    end;
                    return;
                end;
            end));
            table.insert(v14, v13.InputEnded:Connect(function(v16) --[[ Line: 66 ]]
                -- upvalues: v11 (ref), v12 (ref)
                if not v11.current then
                    return nil;
                elseif v16.UserInputType == Enum.UserInputType.MouseButton1 then
                    v12.events.PrimaryReleasedHover();
                    return;
                else
                    if v16.UserInputType == Enum.UserInputType.Touch or v16.KeyCode == Enum.KeyCode.ButtonA or v16.KeyCode == Enum.KeyCode.Return then
                        v12.events.PrimaryReleased();
                    end;
                    return;
                end;
            end));
            table.insert(v14, v13.SelectionGained:Connect(function() --[[ Line: 85 ]]
                -- upvalues: v11 (ref), v12 (ref)
                if not v11.current then
                    return nil;
                else
                    v12.events.SelectionGained();
                    return;
                end;
            end));
            table.insert(v14, v13.SelectionLost:Connect(function() --[[ Line: 94 ]]
                -- upvalues: v11 (ref), v12 (ref)
                if not v11.current then
                    return nil;
                else
                    v12.events.SelectionLost();
                    return;
                end;
            end));
            table.insert(v14, v13.MouseEnter:Connect(function() --[[ Line: 105 ]]
                -- upvalues: v11 (ref), v12 (ref)
                if not v11.current then
                    return nil;
                else
                    v12.events.PointerHover();
                    return;
                end;
            end));
            table.insert(v14, v13.MouseLeave:Connect(function() --[[ Line: 114 ]]
                -- upvalues: v11 (ref), v12 (ref)
                if not v11.current then
                    return nil;
                else
                    v12.events.PointerHoverEnd();
                    return;
                end;
            end));
        end;
        return function() --[[ Line: 123 ]]
            -- upvalues: v14 (copy)
            for _, v18 in v14 do
                v18:Disconnect();
            end;
        end;
    end, {
        v12
    });
    v3.useEffect(function() --[[ Line: 130 ]]
        -- upvalues: v11 (copy), v10 (copy)
        v11.current = v10;
    end, {
        v10
    });
    return l_useForwardRef_0(v8, v19), v12;
end;