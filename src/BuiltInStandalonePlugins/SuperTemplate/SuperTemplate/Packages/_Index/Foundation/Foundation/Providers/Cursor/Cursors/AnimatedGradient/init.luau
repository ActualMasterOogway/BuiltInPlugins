local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v5 = require(l_script_FirstAncestor_0.Providers.Preferences.usePreferences);
return function() --[[ Line: 16 ]]
    -- upvalues: v4 (copy), v5 (copy), v3 (copy), l_RunService_0 (copy)
    local v6 = v4();
    local l_reducedMotion_0 = v5().reducedMotion;
    local v8 = ColorSequence.new({
        ColorSequenceKeypoint.new(0, v6.Color.Selection.Start.Color3), 
        ColorSequenceKeypoint.new(1, v6.Color.Selection.End.Color3)
    });
    local v9 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, v6.Color.Selection.Start.Transparency), 
        NumberSequenceKeypoint.new(1, v6.Color.Selection.End.Transparency)
    });
    local v10, v11 = v3.useBinding(0);
    local v12, v13 = v3.useBinding(v8);
    local v14, v15 = v3.useBinding(v9);
    v3.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: l_RunService_0 (ref), v10 (copy), v8 (copy), v9 (copy), l_reducedMotion_0 (copy), v11 (copy), v13 (copy), v15 (copy)
        local v24 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 33 ]]
            -- upvalues: v10 (ref), v8 (ref), v9 (ref), l_reducedMotion_0 (ref), v11 (ref), v13 (ref), v15 (ref)
            local v16 = v10:getValue() + 2;
            local l_v8_0 = v8;
            local l_v9_0 = v9;
            if l_reducedMotion_0 then
                local v19 = (math.sin((math.rad(v16))) + 1) / 2;
                local l_Value_0 = l_v8_0.Keypoints[1].Value;
                local l_Value_1 = l_v8_0.Keypoints[#l_v8_0.Keypoints].Value;
                l_v8_0 = ColorSequence.new(l_Value_0:Lerp(l_Value_1, v19));
                local l_Value_2 = l_v9_0.Keypoints[1].Value;
                local l_Value_3 = l_v9_0.Keypoints[#l_v9_0.Keypoints].Value;
                l_v9_0 = NumberSequence.new(l_Value_2 + (l_Value_3 - l_Value_2) * v19);
            end;
            v11(v16);
            v13(l_v8_0);
            v15(l_v9_0);
        end);
        return function() --[[ Line: 54 ]]
            -- upvalues: v24 (copy)
            v24:Disconnect();
        end;
    end, {
        v8, 
        v9
    });
    return v3.createElement("UIGradient", {
        Rotation = v10, 
        Color = v12, 
        Transparency = v14
    });
end;