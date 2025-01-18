local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v3 = require(l_script_FirstAncestor_0.Packages.React).PureComponent:extend("PlayerListener");
v3.init = function(v4) --[[ Line: 21 ]] --[[ Name: init ]]
    v4.onCharacterAdded = function(v5) --[[ Line: 22 ]]
        -- upvalues: v4 (copy)
        if v4.props.IsSelectedInstanceValid(v5) then
            v4.props.OnValidSelection(v5);
            return;
        else
            if v4.descendantAddedEvent then
                v4.descendantAddedEvent.Disconnect();
            end;
            v4.descendantAddedEvent = v5.DescendantAdded:Connect(function(v6) --[[ Line: 29 ]]
                -- upvalues: v4 (ref), v5 (copy)
                if (v6:IsA("Script") or v6:IsA("BindableEvent")) and v4.props.IsSelectedInstanceValid(v5) then
                    v4.descendantAddedEvent:Disconnect();
                    v4.descendantAddedEvent = nil;
                    v4.props.OnValidSelection(v5);
                end;
            end);
            return;
        end;
    end;
    v4.onPlayerAdded = function(v7) --[[ Line: 44 ]]
        -- upvalues: v4 (copy)
        if v7.Character then
            v4.onCharacterAdded(v7.Character);
        end;
        if v4.onCharacterAddedEvent then
            v4.onCharacterAddedEvent:Disconnect();
        end;
        v4.onCharacterAddedEvent = v7.CharacterAdded:Connect(v4.onCharacterAdded);
    end;
end;
v3.didMount = function(v8) --[[ Line: 55 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy), l_Players_0 (copy)
    if not l_RunService_0:IsRunning() then
        return;
    elseif l_RunService_0:IsClient() and l_Players_0.LocalPlayer then
        if l_Players_0.LocalPlayer.Character then
            v8.onCharacterAdded(l_Players_0.LocalPlayer.Character);
        end;
        if v8.onCharacterAddedEvent then
            v8.onCharacterAddedEvent:Disconnect();
        end;
        v8.onCharacterAddedEvent = l_Players_0.LocalPlayer.CharacterAdded:Connect(v8.onCharacterAdded);
        return;
    else
        local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
        if l_l_Players_0_Players_0[1] then
            if l_l_Players_0_Players_0[1].Character then
                v8.onCharacterAdded(l_l_Players_0_Players_0[1].Character);
            end;
            l_l_Players_0_Players_0[1].CharacterAdded:Connect(v8.onCharacterAdded);
        end;
        if v8.onPlayerAddedEvent then
            v8.onPlayerAddedEvent:Disconnect();
        end;
        v8.onPlayerAddedEvent = l_Players_0.PlayerAdded:Connect(v8.onPlayerAdded);
        return;
    end;
end;
v3.willUnmount = function(v10) --[[ Line: 83 ]] --[[ Name: willUnmount ]]
    if v10.onPlayerAddedEvent then
        v10.onPlayerAddedEvent:Disconnect();
        v10.onPlayerAdded = nil;
    end;
    if v10.onCharacterAddedEvent then
        v10.onCharacterAddedEvent:Disconnect();
        v10.onCharacterAddedEvent = nil;
    end;
end;
v3.render = function(_) --[[ Line: 95 ]] --[[ Name: render ]]
    return nil;
end;
return v3;