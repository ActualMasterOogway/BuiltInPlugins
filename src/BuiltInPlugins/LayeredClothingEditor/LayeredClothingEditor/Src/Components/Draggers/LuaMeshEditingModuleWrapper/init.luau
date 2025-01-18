local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_RunService_0 = game:GetService("RunService");
local l_Selection_0 = game:GetService("Selection");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v4 = require(l_Parent_0.Packages.Roact);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local l_LuaMeshEditingModule_0 = l_Parent_0.Packages.LuaMeshEditingModule;
local v7 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v10 = require(l_LuaMeshEditingModule_0.Components.MeshEditingComponent);
local l_LuaMeshEditingModuleContext_0 = v7.Contexts.LuaMeshEditingModuleContext;
local v12 = require(l_Parent_0.Src.Actions.SetControlsPanelBlockerActivity);
local v13 = require(l_Parent_0.Src.Actions.SetControlsPanelBlockerMessage);
local v14 = require(l_Parent_0.Src.Flags.getFFlagStudioLuaMeshEditingModuleActivatesTool);
local v15 = v4.PureComponent:extend("LuaMeshEditingModuleWrapper");
local v16 = {
    Enum.RibbonTool.Select, 
    Enum.RibbonTool.Move, 
    Enum.RibbonTool.Scale, 
    Enum.RibbonTool.Rotate
};
local v17 = {};
for v18, v19 in ipairs(v16) do
    v17[v19] = v18;
end;
v15.didMount = function(v20) --[[ Line: 44 ]] --[[ Name: didMount ]]
    -- upvalues: v14 (copy), l_RunService_0 (copy), l_Selection_0 (copy), l_ChangeHistoryService_0 (copy)
    local l_props_0 = v20.props;
    local v22 = l_props_0.Plugin:get();
    v22:Activate(true);
    v20.toolChangedHandle = v20.props.LuaMeshEditingModuleContext:getToolChangedSignal():Connect(function() --[[ Line: 50 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            temp = {}
        });
    end);
    v20.onToolSelected = function(v23) --[[ Line: 58 ]]
        -- upvalues: v20 (copy), v14 (ref), v22 (copy)
        local v24 = v20.props.LuaMeshEditingModuleContext:getCurrentTool();
        if v23 == Enum.RibbonTool.Select or v23 == Enum.RibbonTool.Rotate or v23 == Enum.RibbonTool.Move or v23 == Enum.RibbonTool.Scale then
            if v14() then
                if not v24 then
                    return false;
                elseif v24:getCurrentHandle() == v23 then
                    return false;
                else
                    v22:Activate(true);
                    v24:setCurrentHandle(v23);
                end;
            else
                task.delay(0, function() --[[ Line: 81 ]]
                    -- upvalues: v22 (ref)
                    v22:Activate(true);
                end);
                if v24 then
                    v24:setCurrentHandle(v23);
                end;
            end;
            return true;
        else
            return false;
        end;
    end;
    v20.disableEditing = function() --[[ Line: 96 ]]
        -- upvalues: v20 (copy)
        v20.props.LuaMeshEditingModuleContext:disableEditing();
        v20.props.SetControlsPanelBlockerMessage(v20.props.Localization:getText("Editor", "ResumeEditing"));
        v20.props.SetControlsPanelBlockerActivity(true);
    end;
    v20.deactivationListener = v22.Deactivation:Connect(function() --[[ Line: 102 ]]
        -- upvalues: v14 (ref), v22 (copy), v20 (copy), l_RunService_0 (ref), l_Selection_0 (ref)
        if not v14() then
            local l_v22_SelectedRibbonTool_0 = v22:GetSelectedRibbonTool();
            if l_v22_SelectedRibbonTool_0 ~= Enum.RibbonTool.None then
                if next(game:GetService("Selection"):Get()) == nil then
                    if v20.onToolSelected(l_v22_SelectedRibbonTool_0) then
                        return;
                    end;
                else
                    v20.props.LuaMeshEditingModuleContext:disableEditing();
                    v20.props.SetControlsPanelBlockerMessage(v20.props.Localization:getText("Editor", "ResumeEditing"));
                    v20.props.SetControlsPanelBlockerActivity(true);
                end;
            end;
            return;
        else
            task.spawn(function() --[[ Line: 123 ]]
                -- upvalues: l_RunService_0 (ref), l_Selection_0 (ref), v20 (ref), v22 (ref)
                l_RunService_0.Heartbeat:Wait();
                l_RunService_0.Heartbeat:Wait();
                if next(l_Selection_0:Get()) ~= nil then
                    v20.disableEditing();
                    return;
                else
                    local l_v22_SelectedRibbonTool_1 = v22:GetSelectedRibbonTool();
                    if v20.onToolSelected(l_v22_SelectedRibbonTool_1) then
                        return;
                    else
                        v20.disableEditing();
                        return;
                    end;
                end;
            end);
            return;
        end;
    end);
    local v27 = l_props_0.PluginActions:get("Undo");
    if v27 then
        v27.Enabled = true;
        v20.undoHandle = v27.Triggered:Connect(function() --[[ Line: 145 ]]
            -- upvalues: v20 (copy)
            local v28 = v20.props.LuaMeshEditingModuleContext:getCurrentTool();
            if v28 then
                v28:undo();
            end;
        end);
    end;
    local v29 = l_props_0.PluginActions:get("Redo");
    if v29 then
        v29.Enabled = true;
        v20.redoHandle = v29.Triggered:Connect(function() --[[ Line: 156 ]]
            -- upvalues: v20 (copy)
            local v30 = v20.props.LuaMeshEditingModuleContext:getCurrentTool();
            if v30 then
                v30:redo();
            end;
        end);
    end;
    l_ChangeHistoryService_0:SetEnabled(false);
end;
v15.render = function(v31) --[[ Line: 167 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v10 (copy)
    local l_props_1 = v31.props;
    local v33 = l_props_1.Mouse:get();
    local v34 = l_props_1.Plugin:get();
    local v35 = l_props_1.LuaMeshEditingModuleContext:getCurrentTool();
    if v35 ~= nil then
        return v4.createElement(v10, {
            Mouse = v33, 
            Plugin = v34, 
            VertexToolBase = v35
        });
    else
        return nil;
    end;
end;
v15.willUnmount = function(v36) --[[ Line: 185 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ChangeHistoryService_0 (copy)
    local l_props_2 = v36.props;
    local v38 = l_props_2.PluginActions:get("Undo");
    local v39 = l_props_2.PluginActions:get("Redo");
    if v38 then
        v38.Enabled = false;
    end;
    if v39 then
        v39.Enabled = false;
    end;
    if v36.deactivationListener then
        v36.deactivationListener:Disconnect();
    end;
    if v36.undoHandle then
        v36.undoHandle:Disconnect();
    end;
    if v36.redoHandle then
        v36.redoHandle:Disconnect();
    end;
    if v36.toolChangedHandle then
        v36.toolChangedHandle:Disconnect();
    end;
    l_ChangeHistoryService_0:SetEnabled(true);
end;
local function v42(v40, _) --[[ Line: 218 ]] --[[ Name: mapStateToProps ]]
    return {
        EditingCage = v40.selectItem.editingCage
    };
end;
local function v46(v43) --[[ Line: 226 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy), v13 (copy)
    return {
        SetControlsPanelBlockerActivity = function(v44) --[[ Line: 228 ]] --[[ Name: SetControlsPanelBlockerActivity ]]
            -- upvalues: v43 (copy), v12 (ref)
            v43(v12(v44));
        end, 
        SetControlsPanelBlockerMessage = function(v45) --[[ Line: 232 ]] --[[ Name: SetControlsPanelBlockerMessage ]]
            -- upvalues: v43 (copy), v13 (ref)
            v43(v13(v45));
        end
    };
end;
v15 = l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    PluginActions = l_ContextServices_0.PluginActions, 
    Localization = l_ContextServices_0.Localization, 
    LuaMeshEditingModuleContext = l_LuaMeshEditingModuleContext_0, 
    Mouse = l_ContextServices_0.Mouse
})(v15);
return v5.connect(v42, v46)(v15);