local l_Selection_0 = game:GetService("Selection");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local v10 = require(l_Parent_0.Packages.DraggerFramework.Utility.Analytics);
local v11 = require(l_Parent_0.Src.RoduxComponents.EditPivotSession);
local v12 = require(l_Parent_0.Src.Utility.setWorldPivot);
local v13 = require(l_Parent_0.Src.Utility.getDefaultModelPivot);
local v14 = v4.PureComponent:extend("EditPivotPlugin");
local v15 = require(l_Parent_0.Src.Flags.getFFlagImprovePluginSpeedPivotEditor);
local v16 = require(l_Parent_0.Src.Flags.getFFlagPivotEditorFixButtonState);
v14.init = function(v17) --[[ Line: 27 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy)
    v17:setState({
        active = false
    });
    v17.toggleActive = function() --[[ Line: 32 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            active = not v17.state.active
        });
    end;
    if v15() then
        v17.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v17.toggleActive);
    end;
end;
v14.didMount = function(v18) --[[ Line: 42 ]] --[[ Name: didMount ]]
    -- upvalues: v16 (copy)
    v18._deactivatedConnection = v18.props.Plugin:get().Deactivation:Connect(function() --[[ Line: 43 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            active = false
        });
    end);
    if v18.state.active then
        v18.props.Plugin:get():Activate(true);
        if v16() then
            v18.props.pluginLoaderContext.mainButton:SetActive(true);
        end;
    end;
end;
v14.willUnmount = function(v19) --[[ Line: 56 ]] --[[ Name: willUnmount ]]
    v19._deactivatedConnection:Disconnect();
end;
v14.willUpdate = function(v20, _, v22) --[[ Line: 60 ]] --[[ Name: willUpdate ]]
    if v22.active and not v20.state.active then
        v20.props.Plugin:get():Activate(true);
    end;
end;
if v15() then
    v14.didUpdate = function(v23) --[[ Line: 68 ]] --[[ Name: didUpdate ]]
        v23.props.pluginLoaderContext.mainButton:SetActive(v23.state.active);
    end;
end;
v14._onClearPivot = function(_) --[[ Line: 73 ]] --[[ Name: _onClearPivot ]]
    -- upvalues: l_Selection_0 (copy), v13 (copy), v12 (copy), l_ChangeHistoryService_0 (copy), v10 (copy)
    local v25 = false;
    local v26 = 0;
    for _, v28 in ipairs(l_Selection_0:Get()) do
        if v28:IsA("BasePart") then
            v26 = v26 + 1;
            if v28.PivotOffset ~= CFrame.new() then
                v28.PivotOffset = CFrame.new();
                v25 = true;
            end;
        elseif v28:IsA("Model") then
            v26 = v26 + 1;
            if v28.PrimaryPart then
                if v28.PrimaryPart.PivotOffset ~= CFrame.identity then
                    v28.PrimaryPart.PivotOffset = CFrame.identity;
                    v28.WorldPivot = v28:GetPivot();
                    v25 = true;
                end;
            else
                local v29 = v13(v28);
                if v29 ~= v28.WorldPivot then
                    v12(v28, v29);
                    v25 = true;
                end;
            end;
        end;
    end;
    if v25 then
        l_ChangeHistoryService_0:SetWaypoint("Clear Pivot");
    end;
    v10:sendEvent("clearPivot", {
        objectCount = v26
    });
end;
v14.render = function(v30) --[[ Line: 112 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_PluginToolbar_0 (copy), v15 (copy), l_PluginButton_0 (copy), v11 (copy)
    return v4.createFragment({
        Toolbar = v4.createElement(l_PluginToolbar_0, {
            Title = "Pivot", 
            RenderButtons = function(v31) --[[ Line: 116 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v15 (ref), v4 (ref), l_PluginButton_0 (ref), v30 (copy)
                return {
                    EditPivot = if not v15() then v4.createElement(l_PluginButton_0, {
                        Toolbar = v31, 
                        Title = "EditPivot", 
                        Tooltip = "", 
                        Icon = "", 
                        Active = v30.state.active, 
                        OnClick = v30.toggleActive
                    }) else nil, 
                    ClearPivot = v4.createElement(l_PluginButton_0, {
                        Toolbar = v31, 
                        Title = "ClearPivot", 
                        Tooltip = "", 
                        Icon = "", 
                        Active = false, 
                        Enabled = true, 
                        OnClick = function() --[[ Line: 139 ]] --[[ Name: OnClick ]]
                            -- upvalues: v30 (ref)
                            v30:_onClearPivot();
                        end
                    })
                };
            end
        }), 
        Session = v30.state.active and v4.createElement(v11)
    });
end;
return (l_withContext_0({
    Plugin = l_ContextServices_0.Plugin
})(v14));