local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local l_AvatarToolsShared_0 = l_Parent_0.AvatarToolsShared;
local _ = l_AvatarToolsShared_0.Util.AccessoryAndBodyToolShared;
local v4 = require(l_AvatarToolsShared_0.Components.PreviewViewportFrame);
local v5 = require(l_Parent_0.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_AvatarToolsShared_0.Contexts.PreviewContext);
local l_DockWidget_0 = v5.UI.DockWidget;
local v10 = v1.PureComponent:extend("PreviewDockWidget");
v10.defaultProps = {
    InitialDockState = Enum.InitialDockState.Left, 
    InitialEnabled = true, 
    Enabled = true
};
v10.init = function(v11) --[[ Line: 36 ]] --[[ Name: init ]]
    v11.onInputBegan = function(_, v13) --[[ Line: 37 ]]
        -- upvalues: v11 (copy)
        local l_PreviewContext_0 = v11.props.PreviewContext;
        if v13.UserInputType == Enum.UserInputType.Keyboard then
            if v13.KeyCode == Enum.KeyCode.Left then
                l_PreviewContext_0:cyclePreviewAvatarIndex(false);
                return;
            elseif v13.KeyCode == Enum.KeyCode.Right then
                l_PreviewContext_0:cyclePreviewAvatarIndex(true);
            end;
        end;
    end;
end;
v10.render = function(v15) --[[ Line: 49 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_DockWidget_0 (copy), v4 (copy)
    local l_props_0 = v15.props;
    local _ = l_props_0.PreviewContext;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement(l_DockWidget_0, {
        Id = "PreviewWidget", 
        Title = "Preview Widget", 
        Name = "Preview Widget", 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        InitialDockState = l_props_0.InitialDockState, 
        InitialEnabled = l_props_0.InitialEnabled, 
        Size = l_Stylizer_0.Size, 
        MinSize = l_Stylizer_0.MinSize, 
        OnClose = l_props_0.OnClose or function() --[[ Line: 64 ]]

        end, 
        Enabled = l_props_0.Enabled
    }, {
        Container = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            [v1.Event.InputBegan] = v15.onInputBegan
        }, {
            PreviewViewportFrame = v1.createElement(v4, {
                Size = UDim2.new(1, 0, 1, 0), 
                OnCapacityReached = v15.props.OnCapacityReached
            })
        })
    });
end;
v10.willUnmount = function(v19) --[[ Line: 79 ]] --[[ Name: willUnmount ]]
    local v20 = v19.props.PreviewContext:getAvatars();
    for _, v22 in ipairs(v20) do
        if v22.model then
            v22.model.Parent = nil;
        end;
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Plugin = l_ContextServices_0.Plugin, 
    PreviewContext = v8
})(v10));