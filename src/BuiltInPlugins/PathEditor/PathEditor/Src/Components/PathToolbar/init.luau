local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local v5 = require(l_Parent_0.Packages.ViewportToolingFramework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Toolbar_0 = v5.Toolbar;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v14 = require(l_Actions_0.ToggleAddPointTool);
local v15 = require(l_Actions_0.ToggleAddTangentTool);
local v16 = require(l_Actions_0.ToggleDone);
local v17 = require(l_Actions_0.ToggleMirrored);
local v18 = require(l_Actions_0.ToggleMoveTool);
local v19 = require(l_Actions_0.ToolbarHovered);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v21 = require(l_Thunks_0.AddControlPointTangent);
local v22 = require(l_Thunks_0.ClearControlPointTangent);
local v23 = require(l_Thunks_0.RemoveControlPoint);
local v24 = require(l_Parent_0.Src.Util.getShortcuts)();
local v25 = require(l_Parent_0.Src.Util.TelemetryGlobals);
local v26 = require(l_Parent_0.Src.Resources.Constants);
local v27 = game:DefineFastFlag("PathEditorSelectToolRename", false);
local v28 = v2.PureComponent:extend("PathToolbar");
v28.render = function(v29) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: v27 (copy), v24 (copy), v26 (copy), v2 (copy), l_Toolbar_0 (copy)
    local l_props_0 = v29.props;
    local l_PathToolbar_0 = l_props_0.Stylizer.PathToolbar;
    local l_Localization_1 = l_props_0.Localization;
    local v33 = nil;
    if not l_props_0.SelectedObject then
        return nil;
    else
        v33 = #l_props_0.SelectedObject:GetControlPoints();
        local v35 = {
            {
                Type = "Radio", 
                Value = l_props_0.Path2DToolMode, 
                OnChange = function(v34) --[[ Line: 84 ]] --[[ Name: OnChange ]]
                    -- upvalues: l_props_0 (copy)
                    if v34 == "Move" then
                        l_props_0.dispatchToggleMoveTool();
                        return;
                    elseif v34 == "AddPoint" then
                        l_props_0.dispatchToggleAddPointTool();
                        return;
                    else
                        if v34 == "AddTangent" then
                            l_props_0.dispatchToggleAddTangentTool();
                        end;
                        return;
                    end;
                end, 
                Items = {
                    {
                        Id = "Move", 
                        Tooltip = ("%* (%*)"):format(l_Localization_1:getText("Info", v27 and "Select" or "SelectTool"), v24.Move), 
                        Icon = l_PathToolbar_0.MoveImage
                    }, 
                    if v33 < v26.MaxControlPoints then {
                        Id = "AddPoint", 
                        Tooltip = ("%* (%*)"):format(l_Localization_1:getText("Info", "AddPointTool"), v24.AddPoint), 
                        Icon = l_PathToolbar_0.AddPointImage
                    } else nil, 
                    {
                        Id = "AddTangent", 
                        Tooltip = ("%* (%*)"):format(l_Localization_1:getText("Info", "AddTangentTool"), v24.AddTangent), 
                        Icon = l_PathToolbar_0.AddTangentImage
                    }
                }
            }
        };
        if l_props_0.Path2DToolMode ~= "DoneEditing" then
            table.insert(v35, {
                Type = "TextButton", 
                Text = l_Localization_1:getText("Info", "Done"), 
                OnClick = l_props_0.dispatchToggleDone
            });
        end;
        return v2.createElement(l_Toolbar_0, {
            DisplayOrder = 4, 
            HorizontalItems = v35
        });
    end;
end;
v28 = l_withContext_0({
    Mouse = l_Mouse_0, 
    Plugin = l_Plugin_0, 
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0
})(v28);
return v3.connect(function(v36, _) --[[ Line: 140 ]]
    return {
        ControlPointStates = v36.PathReducer.ControlPointStates, 
        SelectedObject = v36.PathReducer.SelectedObject, 
        Path2DToolMode = v36.PathReducer.Path2DToolMode, 
        SelectedControlPointIndex = v36.PathReducer.SelectedControlPointIndex, 
        SelectedTangentSide = v36.PathReducer.SelectedTangentSide
    };
end, function(v38) --[[ Line: 148 ]]
    -- upvalues: v25 (copy), v14 (copy), v15 (copy), v16 (copy), v18 (copy), v23 (copy), v22 (copy), v19 (copy), v21 (copy), v17 (copy)
    return {
        dispatchToggleAddPointTool = function() --[[ Line: 150 ]] --[[ Name: dispatchToggleAddPointTool ]]
            -- upvalues: v25 (ref), v38 (copy), v14 (ref)
            local l_v25_0 = v25;
            l_v25_0.addPointModeCount = l_v25_0.addPointModeCount + 1;
            v38(v14());
        end, 
        dispatchToggleAddTangentTool = function() --[[ Line: 154 ]] --[[ Name: dispatchToggleAddTangentTool ]]
            -- upvalues: v25 (ref), v38 (copy), v15 (ref)
            local l_v25_1 = v25;
            l_v25_1.addTangentModeCount = l_v25_1.addTangentModeCount + 1;
            v38(v15());
        end, 
        dispatchToggleDone = function() --[[ Line: 158 ]] --[[ Name: dispatchToggleDone ]]
            -- upvalues: v38 (copy), v16 (ref)
            v38(v16());
        end, 
        dispatchToggleMoveTool = function() --[[ Line: 161 ]] --[[ Name: dispatchToggleMoveTool ]]
            -- upvalues: v25 (ref), v38 (copy), v18 (ref)
            local l_v25_2 = v25;
            l_v25_2.selectModeCount = l_v25_2.selectModeCount + 1;
            v38(v18());
        end, 
        dispatchRemoveControlPoint = function() --[[ Line: 165 ]] --[[ Name: dispatchRemoveControlPoint ]]
            -- upvalues: v38 (copy), v23 (ref)
            v38(v23());
        end, 
        dispatchClearControlPointTangent = function(v42, v43) --[[ Line: 168 ]] --[[ Name: dispatchClearControlPointTangent ]]
            -- upvalues: v38 (copy), v22 (ref)
            v38(v22(v42, v43));
        end, 
        dispatchClearControlPointTangents = function(v44) --[[ Line: 171 ]] --[[ Name: dispatchClearControlPointTangents ]]
            -- upvalues: v38 (copy), v22 (ref)
            v38(v22(v44, "Left"));
            v38(v22(v44, "Right"));
        end, 
        dispatchToolbarHovered = function(v45) --[[ Line: 175 ]] --[[ Name: dispatchToolbarHovered ]]
            -- upvalues: v38 (copy), v19 (ref)
            v38(v19(v45));
        end, 
        dispatchAddControlPointTangent = function(v46) --[[ Line: 178 ]] --[[ Name: dispatchAddControlPointTangent ]]
            -- upvalues: v38 (copy), v21 (ref)
            v38(v21(v46));
        end, 
        dispatchToggleMirrored = function(v47) --[[ Line: 181 ]] --[[ Name: dispatchToggleMirrored ]]
            -- upvalues: v38 (copy), v17 (ref)
            v38(v17(v47));
        end
    };
end)(v28);