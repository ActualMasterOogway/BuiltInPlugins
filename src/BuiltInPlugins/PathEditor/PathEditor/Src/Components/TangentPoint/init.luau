local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v11 = require(l_Actions_0.LockSelectedControlPoint);
local v12 = require(l_Actions_0.SelectTangentSide);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v14 = require(l_Thunks_0.RecordChangeHistory);
local v15 = require(l_Thunks_0.SelectControlPoint);
local v16 = require(l_Thunks_0.ClearControlPointTangent);
local v17 = require(l_Thunks_0.SetControlPointTangent);
local v18 = require(l_Thunks_0.OpenContextMenu);
local _ = require(l_Parent_0.Src.Resources.Constants);
local l_Components_0 = l_Parent_0.Src.Components;
local v21 = require(l_Components_0.DraggablePoint);
local l_LeftShift_0 = Enum.KeyCode.LeftShift;
local _ = Enum.KeyCode.LeftControl;
local v24 = v2.Component:extend("TangentPoint");
v24.render = function(v25) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v21 (copy), l_UserInputService_0 (copy), l_LeftShift_0 (copy)
    local l_props_0 = v25.props;
    local v27 = "Tangent";
    if l_props_0.isPhantom then
        v27 = "PhantomTangent";
    end;
    local v28 = l_props_0.SelectedTangentSide == l_props_0.side;
    return v2.createElement(v21, {
        ZIndex = 1, 
        AbsolutePosition = l_props_0.absolutePosition, 
        FollowCursorOnDrag = false, 
        Style = v27, 
        IsSelected = v28, 
        OnSelected = function() --[[ Line: 82 ]] --[[ Name: OnSelected ]]
            -- upvalues: l_props_0 (copy)
            l_props_0.dispatchSelectControlPoint(l_props_0.index);
            l_props_0.dispatchSelectTangentSide(l_props_0.side);
        end, 
        OnDoubleClicked = function() --[[ Line: 87 ]] --[[ Name: OnDoubleClicked ]]
            -- upvalues: l_props_0 (copy)
            l_props_0.dispatchClearControlPointTangent(l_props_0.index, l_props_0.side);
        end, 
        OnDragStart = function() --[[ Line: 91 ]] --[[ Name: OnDragStart ]]
            -- upvalues: l_props_0 (copy)
            l_props_0.dispatchRecordChangeHistory("Move Tangent");
            l_props_0.dispatchSelectControlPoint(l_props_0.index);
            l_props_0.dispatchLockSelectedControlPoint(true);
        end, 
        OnDragMoved = function(v29, v30) --[[ Line: 97 ]] --[[ Name: OnDragMoved ]]
            -- upvalues: l_UserInputService_0 (ref), l_LeftShift_0 (ref), l_props_0 (copy)
            local v31 = l_UserInputService_0:IsKeyDown(l_LeftShift_0);
            local v32 = v30 - v29;
            local v33 = l_props_0.position + v32;
            l_props_0.dispatchSetControlPointTangent(l_props_0.index, l_props_0.side, v33, false, v31);
        end, 
        OnDragEnd = function(_, _) --[[ Line: 105 ]] --[[ Name: OnDragEnd ]]
            -- upvalues: l_props_0 (copy)
            l_props_0.dispatchLockSelectedControlPoint(false);
            l_props_0.dispatchRecordChangeHistory();
        end, 
        OnRightClicked = function() --[[ Line: 109 ]] --[[ Name: OnRightClicked ]]
            -- upvalues: l_props_0 (copy)
            l_props_0.dispatchSelectControlPoint(l_props_0.index);
            l_props_0.dispatchSelectTangentSide(l_props_0.side);
            l_props_0.dispatchOpenContextMenu(l_props_0.PluginContext, l_props_0.Localization);
        end
    });
end;
v24 = l_withContext_0({
    PluginContext = l_Plugin_0, 
    Localization = l_Localization_0
})(v24);
return v3.connect(function(v36, _) --[[ Line: 122 ]]
    return {
        LockSelectedControlPoint = v36.PathReducer.LockSelectedControlPoint, 
        SelectedTangentSide = v36.PathReducer.SelectedTangentSide
    };
end, function(v38) --[[ Line: 127 ]]
    -- upvalues: v14 (copy), v16 (copy), v15 (copy), v12 (copy), v17 (copy), v11 (copy), v18 (copy)
    return {
        dispatchRecordChangeHistory = function(v39) --[[ Line: 129 ]] --[[ Name: dispatchRecordChangeHistory ]]
            -- upvalues: v38 (copy), v14 (ref)
            v38(v14(v39));
        end, 
        dispatchClearControlPointTangent = function(v40, v41) --[[ Line: 132 ]] --[[ Name: dispatchClearControlPointTangent ]]
            -- upvalues: v38 (copy), v16 (ref)
            v38(v16(v40, v41));
        end, 
        dispatchSelectControlPoint = function(v42) --[[ Line: 135 ]] --[[ Name: dispatchSelectControlPoint ]]
            -- upvalues: v38 (copy), v15 (ref)
            v38(v15(v42));
        end, 
        dispatchSelectTangentSide = function(v43) --[[ Line: 138 ]] --[[ Name: dispatchSelectTangentSide ]]
            -- upvalues: v38 (copy), v12 (ref)
            v38(v12(v43));
        end, 
        dispatchSetControlPointTangent = function(v44, v45, v46, v47, v48) --[[ Line: 141 ]] --[[ Name: dispatchSetControlPointTangent ]]
            -- upvalues: v38 (copy), v17 (ref)
            v38(v17(v44, v45, v46, v47, v48));
        end, 
        dispatchLockSelectedControlPoint = function(v49) --[[ Line: 150 ]] --[[ Name: dispatchLockSelectedControlPoint ]]
            -- upvalues: v38 (copy), v11 (ref)
            v38(v11(v49));
        end, 
        dispatchOpenContextMenu = function(v50, v51) --[[ Line: 153 ]] --[[ Name: dispatchOpenContextMenu ]]
            -- upvalues: v38 (copy), v18 (ref)
            v38(v18(v50, v51));
        end
    };
end)(v24);