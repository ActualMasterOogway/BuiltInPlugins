local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.Components.LoadingBar);
local l_Typecheck_0 = require(l_Parent_0.Util).Typecheck;
local v5 = v2.PureComponent:extend("FakeLoadingBar");
l_Typecheck_0.wrap(v5, script);
v5.init = function(v6, v7) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: l_RunService_0 (copy)
    v6.startTime = tick();
    v6.lastProgress = 0;
    v6.state = {
        progress = 0
    };
    v6.updateProgress = function(v8) --[[ Line: 45 ]]
        -- upvalues: v6 (copy)
        v6:setState({
            progress = v8
        });
        local l_props_0 = v6.props;
        if v8 ~= v6.lastProgress then
            v6.lastProgress = v8;
            if l_props_0.OnProgressChanged then
                l_props_0.OnProgressChanged(v8);
            end;
        end;
    end;
    local l_LoadingTime_0 = v7.LoadingTime;
    assert(type(l_LoadingTime_0) == "number", "FakeLoadingBar expects a 'LoadingTime' prop.");
    assert(l_LoadingTime_0 > 0, "FakeLoadingBar expects 'LoadingTime' to be > 0.");
    local v11 = v7.HoldValue or 1;
    assert(v11 > 0, "FakeLoadingBar expects 'HoldValue' to be > 0.");
    assert(v11 <= 1, "FakeLoadingBar expects 'HoldValue' to be <= 1.");
    v6.updateConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 65 ]]
        -- upvalues: v6 (copy), l_LoadingTime_0 (copy), v11 (copy)
        local l_props_1 = v6.props;
        local v13 = tick() - v6.startTime;
        local v14 = nil;
        v14 = if l_LoadingTime_0 < v13 then l_props_1.Completed and 1 or v11 else v13 / l_LoadingTime_0 * v11;
        v6.updateProgress(v14);
    end);
end;
v5.willUnmount = function(v15) --[[ Line: 82 ]] --[[ Name: willUnmount ]]
    if v15.updateConnection then
        v15.updateConnection:Disconnect();
    end;
end;
v5.render = function(v16) --[[ Line: 88 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy)
    local l_props_2 = v16.props;
    local v18 = math.clamp(v16.state.progress, 0, 1);
    local l_Style_0 = l_props_2.Style;
    local l_Size_0 = l_props_2.Size;
    local l_Position_0 = l_props_2.Position;
    local l_AnchorPoint_0 = l_props_2.AnchorPoint;
    local l_ZIndex_0 = l_props_2.ZIndex;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    return v2.createElement(v3, {
        Progress = v18, 
        Style = l_Style_0, 
        Size = l_Size_0, 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        ZIndex = l_ZIndex_0, 
        LayoutOrder = l_LayoutOrder_0
    });
end;
return v5;