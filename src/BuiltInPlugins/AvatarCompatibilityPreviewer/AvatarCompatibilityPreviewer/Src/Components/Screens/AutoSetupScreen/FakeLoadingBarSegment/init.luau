local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_UI_0 = v2.UI;
local l_LoadingBar_0 = l_UI_0.LoadingBar;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local function _(v8) --[[ Line: 22 ]] --[[ Name: formatProgressPercentage ]]
    return string.format("%0d%%", v8 * 100);
end;
return function(v10) --[[ Line: 26 ]] --[[ Name: FakeLoadingBarSegment ]]
    -- upvalues: v3 (copy), l_RunService_0 (copy), l_Pane_0 (copy), l_LoadingBar_0 (copy), l_TextLabel_0 (copy)
    local v11 = v10.startProgress or 0;
    local v12 = v10.holdProgress or 1;
    local l_estimatedTotalTime_0 = v10.estimatedTotalTime;
    local v14 = false;
    if v11 >= 0 then
        v14 = false;
        if v11 <= v12 then
            v14 = v12 <= 1;
        end;
    end;
    assert(v14, "start and hold progress values are invalid!");
    local v15 = os.clock() - v11 * l_estimatedTotalTime_0;
    local v16;
    v14, v16 = v3.useState(v11);
    v3.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: v11 (copy), v12 (copy), l_RunService_0 (ref), v15 (copy), v16 (copy), l_estimatedTotalTime_0 (copy)
        if v11 == v12 then
            return;
        else
            local v18 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 44 ]]
                -- upvalues: v15 (ref), v16 (ref), l_estimatedTotalTime_0 (ref), v12 (ref)
                local v17 = os.clock() - v15;
                v16((math.min(v17 / l_estimatedTotalTime_0, v12)));
            end);
            return function() --[[ Line: 49 ]]
                -- upvalues: v18 (copy)
                v18:Disconnect();
            end;
        end;
    end, {
        v11, 
        v12
    });
    return v3.createElement(l_Pane_0, {
        LayoutOrder = v10.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Size = UDim2.new(1, 0, 0, 32), 
        Spacing = 10
    }, {
        LoadingBar = v3.createElement(l_LoadingBar_0, {
            LayoutOrder = 1, 
            Progress = v14, 
            Size = UDim2.new(1, v10.displayPercentLabel and -50 or 0, 0, 12)
        }), 
        ProgressPercentage = if v10.displayPercentLabel then v3.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2, 
            Size = UDim2.fromOffset(40, 0), 
            Text = string.format("%0d%%", v14 * 100), 
            TextXAlignment = Enum.TextXAlignment.Left
        }) else nil
    });
end;