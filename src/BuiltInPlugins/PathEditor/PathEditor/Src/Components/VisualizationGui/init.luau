local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v4.UI.Pane;
local l_withContext_0 = v4.ContextServices.withContext;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v8 = require(l_Actions_0.PathChanged);
local v9 = require(l_Actions_0.ToggleMoveTool);
local v10 = require(l_Parent_0.Src.Util.getAbsolutePosition);
local l_Components_0 = l_Parent_0.Src.Components;
local v12 = require(l_Components_0.ControlPoint);
local v13 = require(l_Components_0.GuiShim);
local v14 = require(l_Components_0.Line);
local v15 = v2.PureComponent:extend("VisualizationGui");
v15.render = function(v16) --[[ Line: 42 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v2 (copy), v12 (copy), v13 (copy), l_Pane_0 (copy), v14 (copy)
    local l_props_0 = v16.props;
    if not l_props_0.SelectedObject then
        return nil;
    else
        local v18 = v10(l_props_0.SelectedObject.Parent);
        local v19 = {};
        local l_ControlPoints_0 = l_props_0.ControlPoints;
        if l_props_0.Path2DToolMode == "AddPoint" then
            for v21, v22 in l_ControlPoints_0 do
                v19[v21] = v2.createElement(v12, {
                    index = v21, 
                    point = v22, 
                    showTangentsPhantom = l_props_0.IsDraggingPoint and l_props_0.SelectedControlPointIndex == v21, 
                    isSelected = l_props_0.SelectedControlPointIndex == v21, 
                    Disabled = true
                });
            end;
        end;
        local v23 = l_props_0.SelectedObject.Visible == false;
        local v24 = l_props_0.Path2DToolMode ~= "DoneEditing";
        return v2.createElement(if game:GetFastFlag("PathEditorSurfaceGui") then v13 else "ScreenGui", {
            DisplayOrder = 1
        }, {
            EmptySpaceInputBlocker = v24 and v2.createElement(l_Pane_0, {
                Size = UDim2.fromScale(1, 1), 
                OnClick = function() --[[ Line: 73 ]] --[[ Name: OnClick ]]

                end
            }), 
            LineFrame = v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                Position = UDim2.fromOffset(v18.X, v18.Y)
            }, {
                Line = v23 and v2.createElement(v14, {
                    Style = "Visualization", 
                    ControlPoints = l_props_0.ControlPoints
                })
            }), 
            PointFrame = v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, v19)
        });
    end;
end;
v15 = l_withContext_0({})(v15);
return v3.connect(function(v25, _) --[[ Line: 96 ]]
    return {
        Refreshed = v25.PathReducer.Refreshed, 
        SelectedObject = v25.PathReducer.SelectedObject, 
        Path2DToolMode = v25.PathReducer.Path2DToolMode, 
        ControlPoints = v25.PathReducer.ControlPoints, 
        SelectedControlPointIndex = v25.PathReducer.SelectedControlPointIndex, 
        IsDraggingPoint = v25.PathReducer.IsDraggingPoint
    };
end, function(v27) --[[ Line: 105 ]]
    -- upvalues: v8 (copy), v9 (copy)
    return {
        dispatchPathChanged = function(v28) --[[ Line: 107 ]] --[[ Name: dispatchPathChanged ]]
            -- upvalues: v27 (copy), v8 (ref)
            v27(v8(v28));
        end, 
        dispatchToggleMoveTool = function() --[[ Line: 110 ]] --[[ Name: dispatchToggleMoveTool ]]
            -- upvalues: v27 (copy), v9 (ref)
            v27(v9());
        end
    };
end)(v15);