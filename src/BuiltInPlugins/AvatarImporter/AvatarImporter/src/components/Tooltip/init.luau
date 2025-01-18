local l_Parent_0 = script.Parent.Parent.Parent;
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_Parent_0.Packages.Roact);
local l_Studio_0 = settings().Studio;
local v4 = v2.Component:extend("Tooltip");
v4.init = function(v5) --[[ Line: 26 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_RunService_0 (copy)
    v5.detectorRef = v2.createRef();
    v5.state = {
        show = false
    };
    v5.targetTime = 1e999;
    v5.mouseEnter = function(_, v7, v8) --[[ Line: 35 ]]
        -- upvalues: v5 (copy), l_RunService_0 (ref)
        v5.mouseX = v7;
        v5.mouseY = v8;
        v5:resetTargetTime();
        v5:disconnectHeartbeat();
        v5.heartbeatConn = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 40 ]]
            -- upvalues: v5 (ref)
            if tick() >= v5.targetTime then
                v5.heartbeatConn:Disconnect();
                v5:setState({
                    show = true, 
                    tooltipPosition = v5:getPosition()
                });
            end;
        end);
    end;
    v5.mouseMoved = function(_, v10, v11) --[[ Line: 51 ]]
        -- upvalues: v5 (copy)
        v5.mouseX = v10;
        v5.mouseY = v11;
        v5:resetTargetTime();
    end;
    v5.mouseLeave = function() --[[ Line: 57 ]]
        -- upvalues: v5 (copy)
        v5:disconnectHeartbeat();
        v5:setState({
            show = false
        });
    end;
end;
v4.disconnectHeartbeat = function(v12) --[[ Line: 65 ]] --[[ Name: disconnectHeartbeat ]]
    if v12.heartbeatConn then
        v12.heartbeatConn:Disconnect();
        v12.heartbeatConn = nil;
    end;
end;
v4.resetTargetTime = function(v13) --[[ Line: 72 ]] --[[ Name: resetTargetTime ]]
    v13.targetTime = tick() + (v13.props.showDelay or 0.5);
end;
v4.getPosition = function(v14) --[[ Line: 76 ]] --[[ Name: getPosition ]]
    local v15 = v14.detectorRef:getValue();
    if v15 then
        local l_AbsolutePosition_0 = v15.AbsolutePosition;
        return UDim2.new(0, v14.mouseX - l_AbsolutePosition_0.X + 13, 0, v14.mouseY - l_AbsolutePosition_0.Y + 23);
    else
        return;
    end;
end;
v4.render = function(v17) --[[ Line: 84 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Studio_0 (copy)
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        [v2.Ref] = v17.detectorRef, 
        [v2.Event.MouseEnter] = v17.mouseEnter, 
        [v2.Event.MouseMoved] = v17.mouseMoved, 
        [v2.Event.MouseLeave] = v17.mouseLeave
    }, {
        Tooltip = v17.state.show and v2.createElement("Frame", {
            ZIndex = 10, 
            Position = v17.state.tooltipPosition, 
            Size = v17.props.Size, 
            Visible = v17.props.enabled, 
            BackgroundColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainBackground, Enum.StudioStyleGuideModifier.Default), 
            BorderColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.Border, Enum.StudioStyleGuideModifier.Default)
        }, v17.props[v2.Children])
    });
end;
return v4;