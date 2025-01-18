return function(v0, v1) --[[ Line: 2 ]] --[[ Name: validateInputReceived ]]
    local v2 = {};
    local v3 = false;
    if v0:IsA("GuiButton") then
        table.insert(v2, v0.Activated:Connect(function(v4) --[[ Line: 9 ]]
            -- upvalues: v3 (ref)
            if v4.UserInputState ~= Enum.UserInputState.Cancel then
                v3 = true;
            end;
        end));
    elseif v0:IsA("TextBox") and not v0:IsFocused() then
        table.insert(v2, v0.Focused:Connect(function() --[[ Line: 20 ]]
            -- upvalues: v3 (ref)
            v3 = true;
        end));
    else
        local v5 = false;
        do
            local l_v5_0 = v5;
            table.insert(v2, v0.InputBegan:Connect(function(v7) --[[ Line: 29 ]]
                -- upvalues: l_v5_0 (ref)
                if v7.UserInputState ~= Enum.UserInputState.Cancel then
                    l_v5_0 = true;
                end;
            end));
            table.insert(v2, v0.InputEnded:Connect(function(v8) --[[ Line: 37 ]]
                -- upvalues: l_v5_0 (ref), v3 (ref)
                if v8.UserInputState ~= Enum.UserInputState.Cancel and l_v5_0 then
                    v3 = true;
                end;
            end));
        end;
    end;
    v1();
    for _, v10 in v2 do
        v10:Disconnect();
    end;
    return v3;
end;