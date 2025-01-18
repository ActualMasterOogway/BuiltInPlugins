local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_DraggerFramework_0.DraggerTools.DraggerToolComponent);
local v7 = require(l_DraggerFramework_0.Handles.MoveHandles);
local v8 = require(l_DraggerFramework_0.Handles.RotateHandles);
local v9 = require(l_Parent_0.Src.DraggerSchemaPivot.PivotHandle);
local v10 = require(l_Parent_0.Src.DraggerSchemaPivot.DraggerSchema);
local v11 = require(l_Parent_0.Src.DraggerSchemaPivot.DraggerContext_Pivot);
local v12 = require(l_Parent_0.Src.RoduxComponents.SelectionUpdaterBound);
local v13 = require(l_Parent_0.Src.Actions.BeginSelectingPivot);
local v14 = require(l_Parent_0.Src.Actions.DoneSelectingPivot);
local v15 = require(l_Parent_0.Src.Utility.EditingMode);
local v16 = require(l_Parent_0.Src.Utility.StatusMessage);
local v17 = require(l_Parent_0.Src.Utility.ToastNotification);
local v18 = v1.PureComponent:extend("EditPivotSession");
local function _(v19) --[[ Line: 31 ]] --[[ Name: shouldShowNotification ]]
    -- upvalues: v16 (copy)
    if v19 == v16.None or v19 == v16.NoSelection then
        return false;
    else
        return true;
    end;
end;
v18.init = function(v21) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), v10 (copy)
    local v22 = v21.props.Plugin:get();
    v21._draggerContext = v21.props.DraggerContext;
    if not v21._draggerContext then
        v21._draggerContext = v11.new(v22, game, settings(), v10.Selection.new());
    end;
end;
v18.didMount = function(v23) --[[ Line: 47 ]] --[[ Name: didMount ]]
    -- upvalues: v16 (copy)
    local v24 = v23.props.statusMessage == v16.None;
    v23._oldShowPivot = v23._draggerContext:setPivotIndicator(v24);
end;
v18._getCurrentDraggerHandles = function(v25) --[[ Line: 52 ]] --[[ Name: _getCurrentDraggerHandles ]]
    -- upvalues: v15 (copy), v7 (copy), v10 (copy), v8 (copy), v9 (copy)
    if v25.props.editingMode == v15.Transform then
        return {
            v7.new(v25._draggerContext, {
                Outset = 0.5, 
                ShowBoundingBox = false, 
                Summonable = false, 
                MustPositionAtPivot = true
            }, v10.MoveHandlesImplementation.new(v25._draggerContext, "EditPivot")), 
            v8.new(v25._draggerContext, {
                ShowBoundingBox = false, 
                Summonable = false
            }, v10.RotateHandlesImplementation.new(v25._draggerContext, "EditPivot")), 
            v9.new(v25._draggerContext)
        };
    else
        return {};
    end;
end;
v18.render = function(v26) --[[ Line: 74 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), v1 (copy), v6 (copy), v10 (copy), v12 (copy)
    local l_editingMode_0 = v26.props.editingMode;
    local v28 = {};
    local l_Mouse_0 = v26.props.Plugin:get():GetMouse();
    if l_editingMode_0 == v15.Transform or l_editingMode_0 == v15.None then
        local v30 = l_editingMode_0 == v15.Transform;
        v28.DraggerToolComponent = v1.createElement(v6, {
            Mouse = l_Mouse_0, 
            DraggerContext = v26._draggerContext, 
            DraggerSchema = v10, 
            DraggerSettings = {
                AnalyticsName = "EditPivot", 
                AllowDragSelect = false, 
                AllowFreeformDrag = v30, 
                ShowLocalSpaceIndicator = false, 
                HandlesList = v26:_getCurrentDraggerHandles()
            }
        });
    end;
    v28.SelectionUpdaterBound = v1.createElement(v12);
    return v1.createFragment(v28);
end;
v18.didUpdate = function(v31, v32, _) --[[ Line: 103 ]] --[[ Name: didUpdate ]]
    -- upvalues: v16 (copy)
    local l_statusMessage_0 = v31.props.statusMessage;
    local v35 = l_statusMessage_0 == v16.None;
    v31._draggerContext:setPivotIndicator(v35);
    local l_statusMessage_1 = v32.statusMessage;
    if l_statusMessage_1 ~= l_statusMessage_0 then
        if l_statusMessage_1 ~= v16.None then
            v32.ToastNotification:hideNotification(l_statusMessage_1);
        end;
        if l_statusMessage_0 ~= v16.None and l_statusMessage_0 ~= v16.NoSelection then
            local v37 = v32.Localization:getText("Notification", l_statusMessage_0);
            v32.ToastNotification:showNotification(v37, l_statusMessage_0);
        end;
    end;
end;
v18.willUnmount = function(v38) --[[ Line: 125 ]] --[[ Name: willUnmount ]]
    v38._draggerContext:setPivotIndicator(v38._oldShowPivot);
end;
v18 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    ToastNotification = v17
})(v18);
return v2.connect(function(v39, _) --[[ Line: 135 ]] --[[ Name: mapStateToProps ]]
    return {
        editingMode = v39.editingMode, 
        statusMessage = v39.statusMessage, 
        targetObject = v39.targetObject
    };
end, function(v41) --[[ Line: 143 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v13 (copy), v14 (copy)
    return {
        beginSelectingPivot = function(v42, v43) --[[ Line: 145 ]] --[[ Name: beginSelectingPivot ]]
            -- upvalues: v41 (copy), v13 (ref)
            v41(v13(v42, v43));
        end, 
        doneSelectingPivot = function() --[[ Line: 148 ]] --[[ Name: doneSelectingPivot ]]
            -- upvalues: v41 (copy), v14 (ref)
            v41(v14());
        end
    };
end)(v18);