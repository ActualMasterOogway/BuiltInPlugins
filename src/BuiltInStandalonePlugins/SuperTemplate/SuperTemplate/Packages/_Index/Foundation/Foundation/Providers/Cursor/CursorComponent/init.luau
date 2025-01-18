local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactUtils);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v6 = require(l_script_FirstAncestor_0.Providers.Preferences.usePreferences);
local v7 = require(l_script_FirstAncestor_0.Components.View);
local l_EventConnection_0 = v4.EventConnection;
local v30 = v3.forwardRef(function(v9, v10) --[[ Line: 22 ]]
    -- upvalues: v5 (copy), v6 (copy), v3 (copy), v7 (copy), l_EventConnection_0 (copy), l_RunService_0 (copy)
    local v11 = v5();
    local l_reducedMotion_0 = v6().reducedMotion;
    local v13 = ColorSequence.new({
        ColorSequenceKeypoint.new(0, v11.Color.Selection.Start.Color3), 
        ColorSequenceKeypoint.new(1, v11.Color.Selection.End.Color3)
    });
    local v14 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, v11.Color.Selection.Start.Transparency), 
        NumberSequenceKeypoint.new(1, v11.Color.Selection.End.Transparency)
    });
    local v15, v16 = v3.useBinding(0);
    local v17, v18 = v3.useBinding(v13);
    local v19, v20 = v3.useBinding(v14);
    return v3.createElement(v7, {
        Position = UDim2.fromOffset(-v9.offset, -v9.offset), 
        Size = UDim2.new(1, v9.offset * 2, 1, v9.offset * 2), 
        ref = v10
    }, {
        UICorner = v3.createElement("UICorner", {
            CornerRadius = v9.cornerRadius
        }), 
        UIStroke = v3.createElement("UIStroke", {
            Color = Color3.new(1, 1, 1), 
            Transparency = 0, 
            Thickness = v9.borderWidth
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Rotation = v15, 
                Color = v17, 
                Transparency = v19
            })
        }), 
        HeartbeatConnection = v9.isVisible and v3.createElement(l_EventConnection_0, {
            event = l_RunService_0.Heartbeat, 
            callback = function(_) --[[ Line: 59 ]] --[[ Name: callback ]]
                -- upvalues: v15 (copy), v13 (copy), v14 (copy), l_reducedMotion_0 (copy), v16 (copy), v18 (copy), v20 (copy)
                local v22 = v15:getValue() + 2;
                local l_v13_0 = v13;
                local l_v14_0 = v14;
                if l_reducedMotion_0 then
                    local v25 = (math.sin((math.rad(v22))) + 1) / 2;
                    local l_Value_0 = l_v13_0.Keypoints[1].Value;
                    local l_Value_1 = l_v13_0.Keypoints[#l_v13_0.Keypoints].Value;
                    l_v13_0 = ColorSequence.new(l_Value_0:Lerp(l_Value_1, v25));
                    local l_Value_2 = l_v14_0.Keypoints[1].Value;
                    local l_Value_3 = l_v14_0.Keypoints[#l_v14_0.Keypoints].Value;
                    l_v14_0 = NumberSequence.new(l_Value_2 + (l_Value_3 - l_Value_2) * v25);
                end;
                v16(v22);
                v18(l_v13_0);
                v20(l_v14_0);
            end
        })
    });
end);
return v3.memo(v30);