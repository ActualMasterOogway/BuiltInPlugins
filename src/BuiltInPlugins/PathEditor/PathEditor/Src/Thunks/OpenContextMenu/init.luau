local l_Parent_0 = script.Parent.Parent.Parent;
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local _ = l_ContextServices_0.Localization;
local _ = l_ContextServices_0.Plugin;
local l_Actions_0 = l_Parent_0.Src.Actions;
local _ = require(l_Actions_0.ToggleAddPointTool);
local _ = require(l_Actions_0.ToggleAddTangentTool);
local _ = require(l_Actions_0.ToggleDone);
local v8 = require(l_Actions_0.ToggleMirrored);
local _ = require(l_Actions_0.ToggleMoveTool);
local _ = require(l_Actions_0.ToolbarHovered);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v12 = require(l_Thunks_0.AddControlPointTangent);
local v13 = require(l_Thunks_0.ClearControlPointTangent);
local v14 = require(l_Thunks_0.RemoveControlPoint);
local v15 = require(l_Thunks_0.ToggleClosed);
local v16 = require(l_Parent_0.Src.Util.createContextMenu);
local _ = require(l_Parent_0.Src.Util.getShortcuts)();
local l_PathEditorPathClosedApiUpdate_0 = game:GetFastFlag("PathEditorPathClosedApiUpdate");
return function(v19, v20) --[[ Line: 27 ]]
    -- upvalues: v8 (copy), v12 (copy), v13 (copy), v14 (copy), l_PathEditorPathClosedApiUpdate_0 (copy), v15 (copy), v16 (copy)
    return function(v21) --[[ Line: 28 ]]
        -- upvalues: v8 (ref), v20 (copy), v12 (ref), v13 (ref), v14 (ref), l_PathEditorPathClosedApiUpdate_0 (ref), v15 (ref), v16 (ref), v19 (copy)
        local l_PathReducer_0 = v21:getState().PathReducer;
        if l_PathReducer_0.SelectedObject == nil then
            return l_PathReducer_0;
        else
            local l_SelectedControlPointIndex_0 = l_PathReducer_0.SelectedControlPointIndex;
            if l_SelectedControlPointIndex_0 == 0 then
                return l_PathReducer_0;
            else
                local v24 = {};
                local v25 = l_PathReducer_0.ControlPointStates[l_SelectedControlPointIndex_0];
                if l_PathReducer_0.SelectedTangentSide == nil then
                    if v25.Mirrored then
                        table.insert(v24, {
                            Icon = "", 
                            OnClick = function() --[[ Line: 47 ]] --[[ Name: OnClick ]]
                                -- upvalues: v21 (copy), v8 (ref), l_SelectedControlPointIndex_0 (copy)
                                v21:dispatch(v8(l_SelectedControlPointIndex_0));
                            end, 
                            Text = v20:getText("ContextMenu", "BreakTangents")
                        });
                    else
                        table.insert(v24, {
                            Icon = "", 
                            OnClick = function() --[[ Line: 55 ]] --[[ Name: OnClick ]]
                                -- upvalues: v21 (copy), v8 (ref), l_SelectedControlPointIndex_0 (copy)
                                v21:dispatch(v8(l_SelectedControlPointIndex_0));
                            end, 
                            Text = v20:getText("ContextMenu", "MirrorTangents")
                        });
                    end;
                    if v25.Sharp then
                        table.insert(v24, {
                            Icon = "", 
                            OnClick = function() --[[ Line: 65 ]] --[[ Name: OnClick ]]
                                -- upvalues: v21 (copy), v12 (ref), l_SelectedControlPointIndex_0 (copy)
                                v21:dispatch(v12(l_SelectedControlPointIndex_0));
                            end, 
                            Text = v20:getText("ContextMenu", "AddTangents")
                        });
                    else
                        table.insert(v24, {
                            Icon = "", 
                            OnClick = function() --[[ Line: 73 ]] --[[ Name: OnClick ]]
                                -- upvalues: v21 (copy), v13 (ref), l_SelectedControlPointIndex_0 (copy)
                                v21:dispatch(v13(l_SelectedControlPointIndex_0, "Left"));
                                v21:dispatch(v13(l_SelectedControlPointIndex_0, "Right"));
                            end, 
                            Text = v20:getText("ContextMenu", "ClearTangents")
                        });
                    end;
                    table.insert(v24, {
                        Icon = "", 
                        OnClick = function() --[[ Line: 83 ]] --[[ Name: OnClick ]]
                            -- upvalues: v21 (copy), v14 (ref), l_SelectedControlPointIndex_0 (copy)
                            v21:dispatch(v14(l_SelectedControlPointIndex_0));
                        end, 
                        Text = v20:getText("ContextMenu", "DeletePoint")
                    });
                    if l_PathEditorPathClosedApiUpdate_0 then
                        table.insert(v24, {
                            Icon = "", 
                            OnClick = function() --[[ Line: 92 ]] --[[ Name: OnClick ]]
                                -- upvalues: v21 (copy), v15 (ref)
                                v21:dispatch(v15());
                            end, 
                            Text = v20:getText("ContextMenu", "ToggleClosed")
                        });
                    end;
                else
                    table.insert(v24, {
                        Icon = "", 
                        OnClick = function() --[[ Line: 101 ]] --[[ Name: OnClick ]]
                            -- upvalues: v25 (copy), v21 (copy), v8 (ref), l_SelectedControlPointIndex_0 (copy), v13 (ref), l_PathReducer_0 (copy)
                            if v25.Mirrored then
                                v21:dispatch(v8(l_SelectedControlPointIndex_0));
                            end;
                            v21:dispatch(v13(l_SelectedControlPointIndex_0, l_PathReducer_0.SelectedTangentSide));
                        end, 
                        Text = v20:getText("ContextMenu", "DeleteTangent")
                    });
                end;
                v16(v19:get(), v24, "BaseMenu");
                return l_PathReducer_0;
            end;
        end;
    end;
end;