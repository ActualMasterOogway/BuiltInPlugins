local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Src.Actions.SetPreviewVisible);
local v6 = v3.PureComponent:extend("HoverPreviewEnabler");
v6.init = function(v7) --[[ Line: 18 ]] --[[ Name: init ]]
    v7.mouseMoved = function() --[[ Line: 19 ]]
        -- upvalues: v7 (copy)
        if not v7.props.previewVisible then
            v7.props.setPreviewVisible(true);
        end;
    end;
    v7.mouseLeave = function() --[[ Line: 24 ]]
        -- upvalues: v7 (copy)
        v7.props.setPreviewVisible(false);
    end;
end;
v6.didMount = function(v8) --[[ Line: 29 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy), l_RunService_0 (copy)
    local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
    l_RunService_0:BindToRenderStep("getMouseLocation", 1, function() --[[ Line: 31 ]]
        -- upvalues: l_UserInputService_0 (ref), l_l_UserInputService_0_MouseLocation_0 (ref), v8 (copy)
        local l_l_UserInputService_0_MouseLocation_1 = l_UserInputService_0:GetMouseLocation();
        if l_l_UserInputService_0_MouseLocation_0 ~= l_l_UserInputService_0_MouseLocation_1 and v8.props.previewVisible then
            v8.props.setPreviewVisible(false);
        end;
        l_l_UserInputService_0_MouseLocation_0 = l_l_UserInputService_0_MouseLocation_1;
    end);
end;
v6.willUnmount = function(v11) --[[ Line: 42 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_RunService_0 (copy)
    v11.mouseLeave();
    l_RunService_0:UnbindFromRenderStep("getMouseLocation");
end;
v6.render = function(v12) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v3.Event.MouseMoved] = v12.mouseMoved, 
        [v3.Event.MouseLeave] = v12.mouseLeave
    }, v12.props[v3.Children]);
end;
return v4.connect(function(v13, _) --[[ Line: 56 ]] --[[ Name: mapStateToProps ]]
    return {
        previewVisible = v13.previewVisible
    };
end, function(v15) --[[ Line: 62 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v5 (copy)
    return {
        setPreviewVisible = function(v16) --[[ Line: 64 ]] --[[ Name: setPreviewVisible ]]
            -- upvalues: v15 (copy), v5 (ref)
            v15(v5(v16));
        end
    };
end)(v6);