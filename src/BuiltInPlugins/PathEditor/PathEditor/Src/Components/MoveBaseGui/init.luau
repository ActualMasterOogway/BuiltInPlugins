local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_withContext_0 = require(l_Parent_0.Packages.Framework).ContextServices.withContext;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v6 = require(l_Actions_0.PathChanged);
local v7 = require(l_Actions_0.ToggleMoveTool);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v9 = require(l_Thunks_0.SetPathPosition);
local l_Util_0 = l_Parent_0.Src.Util;
local v11 = require(l_Util_0.getAbsolutePosition);
local v12 = require(l_Util_0.rotatePoint);
local v13 = require(l_Parent_0.Src.Util.getUDim2ScaleFromOffset);
local l_Components_0 = l_Parent_0.Src.Components;
local v15 = require(l_Components_0.DraggablePoint);
local v16 = require(l_Components_0.GuiShim);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
local v18 = v2.PureComponent:extend("MoveBaseGui");
v18.render = function(v19) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), l_PathEditorRotation_0 (copy), v2 (copy), v15 (copy), v12 (copy), v13 (copy), v16 (copy)
    local l_props_0 = v19.props;
    if not l_props_0.SelectedObject or l_props_0.Path2DToolMode ~= "DoneEditing" then
        return nil;
    else
        local v21 = v11(l_props_0.SelectedObject.Parent);
        local v22 = if l_PathEditorRotation_0 then nil else v11(l_props_0.SelectedObject);
        local l_BoundingRect_0 = l_props_0.SelectedObject:GetBoundingRect();
        local l_Min_0 = l_BoundingRect_0.Min;
        local v25 = Vector2.new(l_BoundingRect_0.Width, l_BoundingRect_0.Height);
        local v26 = if l_PathEditorRotation_0 then nil else v22;
        local v35 = {
            RubberbandPane = v2.createElement(v15, {
                AbsoluteSize = v25, 
                AbsolutePosition = l_Min_0, 
                Style = "RubberBand", 
                FollowCursorOnDrag = not l_PathEditorRotation_0 and nil, 
                OnSelected = function() --[[ Line: 69 ]] --[[ Name: OnSelected ]]

                end, 
                OnHover = function() --[[ Line: 70 ]] --[[ Name: OnHover ]]

                end, 
                OnDeselected = function() --[[ Line: 71 ]] --[[ Name: OnDeselected ]]

                end, 
                OnDragStart = function(_) --[[ Line: 72 ]] --[[ Name: OnDragStart ]]
                    -- upvalues: l_PathEditorRotation_0 (ref), v12 (ref), v21 (copy), l_props_0 (copy), v19 (copy), v26 (copy)
                    if l_PathEditorRotation_0 then
                        local v28 = v12(v21, v21 + 0.5 * l_props_0.ParentAbsSize, 1 * l_props_0.ParentAbsRotation);
                        v19:setState({
                            startingParentPos = v28
                        });
                        return;
                    else
                        v19:setState({
                            extentsOffset = v26
                        });
                        return;
                    end;
                end, 
                OnDragMoved = function(_, v30) --[[ Line: 85 ]] --[[ Name: OnDragMoved ]]
                    -- upvalues: l_PathEditorRotation_0 (ref), v19 (copy), l_props_0 (copy), v21 (copy), v13 (ref)
                    if l_PathEditorRotation_0 then
                        if v19.state.startingParentPos ~= nil then
                            l_props_0.dispatchSetPathPosition(v30, v19.state.startingParentPos);
                            return;
                        end;
                    elseif v19.state.extentsOffset ~= nil then
                        v30 = v30 - v21 + v19.state.extentsOffset;
                        local v31 = v13(UDim2.fromOffset(v30.X, v30.Y), l_props_0.SelectedObject.Parent);
                        l_props_0.dispatchSetPathPosition(v31);
                    end;
                end, 
                OnDragEnd = function(_, v33) --[[ Line: 100 ]] --[[ Name: OnDragEnd ]]
                    -- upvalues: l_PathEditorRotation_0 (ref), v19 (copy), l_props_0 (copy), v21 (copy), v13 (ref)
                    if l_PathEditorRotation_0 then
                        if v19.state.startingParentPos ~= nil then
                            l_props_0.dispatchSetPathPosition(v33, v19.state.startingParentPos, true);
                            return;
                        end;
                    elseif v19.state.extentsOffset ~= nil then
                        v33 = v33 - v21 + v19.state.extentsOffset;
                        local v34 = v13(UDim2.fromOffset(v33.X, v33.Y), l_props_0.SelectedObject.Parent);
                        l_props_0.dispatchSetPathPosition(v34, true);
                    end;
                end, 
                OnDoubleClicked = function() --[[ Line: 115 ]] --[[ Name: OnDoubleClicked ]]
                    -- upvalues: l_props_0 (copy)
                    l_props_0.dispatchToggleMoveTool();
                end
            })
        };
        return v2.createElement(if game:GetFastFlag("PathEditorSurfaceGui") then v16 else "ScreenGui", {
            DisplayOrder = 2
        }, v35);
    end;
end;
v18 = l_withContext_0({})(v18);
return v3.connect(function(v36, _) --[[ Line: 127 ]]
    return {
        Refreshed = v36.PathReducer.Refreshed, 
        SelectedObject = v36.PathReducer.SelectedObject, 
        Path2DToolMode = v36.PathReducer.Path2DToolMode, 
        ParentAbsRotation = v36.PathReducer.ParentAbsRotation, 
        ParentAbsSize = v36.PathReducer.ParentAbsSize
    };
end, function(v38) --[[ Line: 135 ]]
    -- upvalues: v6 (copy), v7 (copy), l_PathEditorRotation_0 (copy), v9 (copy)
    return {
        dispatchPathChanged = function(v39) --[[ Line: 137 ]] --[[ Name: dispatchPathChanged ]]
            -- upvalues: v38 (copy), v6 (ref)
            v38(v6(v39));
        end, 
        dispatchToggleMoveTool = function() --[[ Line: 140 ]] --[[ Name: dispatchToggleMoveTool ]]
            -- upvalues: v38 (copy), v7 (ref)
            v38(v7());
        end, 
        dispatchSetPathPosition = l_PathEditorRotation_0 and function(v40, v41, v42) --[[ Line: 144 ]]
            -- upvalues: v38 (copy), v9 (ref)
            v38(v9(v40, v41, v42));
        end or function(v43, v44) --[[ Line: 147 ]]
            -- upvalues: v38 (copy), v9 (ref)
            v38(v9(v43, v44));
        end
    };
end)(v18);