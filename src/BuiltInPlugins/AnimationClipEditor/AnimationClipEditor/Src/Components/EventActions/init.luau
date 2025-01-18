local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v9 = require(l_script_FirstAncestor_0.Src.Thunks.Events.PasteEvents);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.Events.CopySelectedEvents);
local v11 = require(l_script_FirstAncestor_0.Src.Thunks.Events.DeleteSelectedEvents);
local v12 = require(l_script_FirstAncestor_0.Src.Actions.SetRightClickContextInfo);
local v13 = v1.PureComponent:extend("EventActions");
v13.makeMenuActionsDeprecated = function(v14) --[[ Line: 36 ]] --[[ Name: makeMenuActionsDeprecated ]]
    -- upvalues: v4 (copy)
    local l_PluginActions_0 = v14.props.PluginActions;
    if l_PluginActions_0 then
        local l_props_0 = v14.props;
        local v17 = {
            l_PluginActions_0:get("DeleteEvents"), 
            v4.MENU_SEPARATOR, 
            l_PluginActions_0:get("CutEvents"), 
            l_PluginActions_0:get("CopyEvents"), 
            l_PluginActions_0:get("PasteEvents")
        };
        if l_props_0.OnEvent then
            table.insert(v17, 1, l_PluginActions_0:get("EditEvents"));
            return v17;
        else
            table.insert(v17, 1, l_PluginActions_0:get("AddEvent"));
            return v17;
        end;
    else
        return;
    end;
end;
v13.makeMenuActions = function(v18) --[[ Line: 59 ]] --[[ Name: makeMenuActions ]]
    -- upvalues: v4 (copy)
    local l_PluginActions_1 = v18.props.PluginActions;
    if l_PluginActions_1 then
        return {
            l_PluginActions_1:get(v18.props.OnEvent and "EditEvents" or "AddEvent"), 
            l_PluginActions_1:get("DeleteEvents"), 
            v4.MENU_SEPARATOR, 
            l_PluginActions_1:get("CutEvents"), 
            l_PluginActions_1:get("CopyEvents"), 
            l_PluginActions_1:get("PasteEvents")
        };
    else
        return nil;
    end;
end;
v13.addAction = function(v20, v21, v22) --[[ Line: 78 ]] --[[ Name: addAction ]]
    if v21 then
        v21.Enabled = false;
        table.insert(v20.Actions, v21);
        table.insert(v20.Connections, v21.Triggered:Connect(v22));
    end;
end;
v13.didMount = function(v23) --[[ Line: 86 ]] --[[ Name: didMount ]]
    local l_PluginActions_2 = v23.props.PluginActions;
    v23.Connections = {};
    v23.Actions = {};
    v23:addAction(l_PluginActions_2:get("EditEvents"), function() --[[ Line: 91 ]]
        -- upvalues: v23 (copy)
        local l_props_1 = v23.props;
        local l_Tick_0 = l_props_1.Tick;
        l_props_1.OnEditEvents(l_Tick_0);
    end);
    v23:addAction(l_PluginActions_2:get("PasteEvents"), function() --[[ Line: 97 ]]
        -- upvalues: v23 (copy)
        local l_props_2 = v23.props;
        local v28 = l_props_2.Tick or l_props_2.Playhead;
        l_props_2.PasteEvents(v28);
    end);
    v23:addAction(l_PluginActions_2:get("CutEvents"), function() --[[ Line: 103 ]]
        -- upvalues: v23 (copy)
        local l_props_3 = v23.props;
        l_props_3.CopySelectedEvents(v23.props.EventFilters);
        l_props_3.DeleteSelectedEvents(v23.props.EventFilters);
    end);
    v23:addAction(l_PluginActions_2:get("CopyEvents"), function() --[[ Line: 109 ]]
        -- upvalues: v23 (copy)
        v23.props.CopySelectedEvents(v23.props.EventFilters);
    end);
    v23:addAction(l_PluginActions_2:get("DeleteEvents"), function() --[[ Line: 113 ]]
        -- upvalues: v23 (copy)
        v23.props.DeleteSelectedEvents(v23.props.EventFilters);
    end);
end;
v13.render = function(v30) --[[ Line: 118 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v4 (copy), v1 (copy), v7 (copy)
    local l_props_4 = v30.props;
    local l_ShowMenu_0 = l_props_4.ShowMenu;
    local l_Clipboard_0 = l_props_4.Clipboard;
    local l_ClipboardType_0 = l_props_4.ClipboardType;
    local l_SelectedEvents_0 = l_props_4.SelectedEvents;
    local l_OnMenuOpened_0 = l_props_4.OnMenuOpened;
    local l_Actions_0 = v30.Actions;
    local l_PluginActions_3 = v30.props.PluginActions;
    if not v3(l_PluginActions_3) and l_Actions_0 ~= nil then
        for _, v40 in ipairs(l_Actions_0) do
            v40.Enabled = false;
        end;
        if l_Clipboard_0 and not v3(l_Clipboard_0) and l_ClipboardType_0 == v4.CLIPBOARD_TYPE.Events then
            l_PluginActions_3:get("PasteEvents").Enabled = true;
        end;
        if l_SelectedEvents_0 and not v3(l_SelectedEvents_0) then
            l_PluginActions_3:get("CutEvents").Enabled = true;
            l_PluginActions_3:get("CopyEvents").Enabled = true;
            l_PluginActions_3:get("DeleteEvents").Enabled = true;
        end;
        if l_props_4.OnEvent then
            l_PluginActions_3:get("EditEvents").Enabled = true;
        end;
    end;
    local v41 = v30:makeMenuActions();
    if l_ShowMenu_0 and v41 then
        return (v1.createElement(v7, {
            Actions = v30:makeMenuActions(), 
            OnMenuOpened = l_OnMenuOpened_0
        }));
    else
        return nil;
    end;
end;
v13.willUnmount = function(v42) --[[ Line: 159 ]] --[[ Name: willUnmount ]]
    if v42.Connections then
        for _, v44 in ipairs(v42.Connections) do
            v44:Disconnect();
        end;
        v42.Connections = {};
    end;
    if v42.Actions then
        for _, v46 in ipairs(v42.Actions) do
            v46.Enabled = false;
        end;
    end;
end;
v13 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    PluginActions = l_ContextServices_0.PluginActions
})(v13);
return v2.connect(function(v47, _) --[[ Line: 178 ]] --[[ Name: mapStateToProps ]]
    local l_Status_0 = v47.Status;
    return {
        Clipboard = l_Status_0.Clipboard, 
        ClipboardType = l_Status_0.ClipboardType, 
        SelectedEvents = l_Status_0.SelectedEvents, 
        Playhead = l_Status_0.Playhead, 
        OnEvent = l_Status_0.RightClickContextInfo.OnEvent, 
        Tick = l_Status_0.RightClickContextInfo.Tick
    };
end, function(v50) --[[ Line: 191 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v8 (copy), v11 (copy), v12 (copy), v10 (copy), v9 (copy)
    return {
        DeleteSelectedEvents = function(v51) --[[ Line: 193 ]] --[[ Name: DeleteSelectedEvents ]]
            -- upvalues: v50 (copy), v8 (ref), v11 (ref), v12 (ref)
            v50(v8());
            v50(v11(v51));
            v50(v12({}));
        end, 
        CopySelectedEvents = function(v52) --[[ Line: 199 ]] --[[ Name: CopySelectedEvents ]]
            -- upvalues: v50 (copy), v10 (ref), v12 (ref)
            v50(v10(v52));
            v50(v12({}));
        end, 
        PasteEvents = function(v53) --[[ Line: 204 ]] --[[ Name: PasteEvents ]]
            -- upvalues: v50 (copy), v8 (ref), v9 (ref), v12 (ref)
            v50(v8());
            v50(v9(v53));
            v50(v12({}));
        end
    };
end)(v13);