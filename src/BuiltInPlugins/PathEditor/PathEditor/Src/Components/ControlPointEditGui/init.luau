local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_withContext_0 = require(l_Parent_0.Packages.Framework).ContextServices.withContext;
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v6 = require(l_Thunks_0.AddControlPoint);
local l_Components_0 = l_Parent_0.Src.Components;
local v8 = require(l_Components_0.ControlPoint);
local v9 = require(l_Components_0.GuiShim);
local v10 = v2.PureComponent:extend("ControlPointEditGui");
v10.render = function(v11) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v8 (copy), v9 (copy)
    local l_props_0 = v11.props;
    local v13 = {};
    if not l_props_0.SelectedObject or l_props_0.Path2DToolMode == "DoneEditing" or l_props_0.Path2DToolMode == "AddPoint" then
        return nil;
    else
        for v14, v15 in pairs(l_props_0.ControlPoints) do
            local v16 = l_props_0.SelectedControlPointIndex == v14;
            local v17 = false;
            if l_props_0.SelectedControlPointIndex > 0 then
                v17 = l_props_0.SelectedControlPointIndex <= #l_props_0.ControlPoints;
            end;
            local v18 = v17 and (l_props_0.SelectedControlPointIndex - 1 == v14 or l_props_0.SelectedControlPointIndex + 1 == v14);
            v13[v14] = v2.createElement(v8, {
                index = v14, 
                point = v15, 
                showTangents = v16, 
                showTangentsPhantom = v18, 
                isSelected = l_props_0.SelectedControlPointIndex == v14
            });
        end;
        return v2.createElement(if game:GetFastFlag("PathEditorSurfaceGui") then v9 else "ScreenGui", {
            DisplayOrder = 2, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, v13);
    end;
end;
v10 = l_withContext_0({})(v10);
return v3.connect(function(v19, _) --[[ Line: 65 ]]
    return {
        Refreshed = v19.PathReducer.Refreshed, 
        SelectedObject = v19.PathReducer.SelectedObject, 
        Path2DToolMode = v19.PathReducer.Path2DToolMode, 
        ControlPoints = v19.PathReducer.ControlPoints, 
        SelectedControlPointIndex = v19.PathReducer.SelectedControlPointIndex
    };
end, function(v21) --[[ Line: 73 ]]
    -- upvalues: v6 (copy)
    return {
        dispatchAddControlPoint = function(v22) --[[ Line: 75 ]] --[[ Name: dispatchAddControlPoint ]]
            -- upvalues: v21 (copy), v6 (ref)
            v21(v6(v22));
        end
    };
end)(v10);