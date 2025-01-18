local l_script_FirstAncestor_0 = script:FindFirstAncestor("ConstraintTool");
local l_StudioService_0 = game:GetService("StudioService");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_DraggerFramework_0.Components.TargetGridView);
local v5 = require(l_DraggerFramework_0.Components.TargetSoftSnapView);
local v6 = require(l_DraggerFramework_0.Components.HotkeyUsageInfo);
local v7 = require(l_DraggerFramework_0.Utility.HotkeyHelpBuilder);
local l_EnableConstraintToolPartPassthroughFeature_0 = game:GetFastFlag("EnableConstraintToolPartPassthroughFeature");
local l_SimMultipleConstraintMode_0 = game:GetFastFlag("SimMultipleConstraintMode");
local v10 = {};
v10.__index = v10;
v10.new = function(v11, v12, v13) --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy)
    return (setmetatable({
        _draggerContext = v11, 
        _draggerSchema = v12, 
        _constraintToolModel = v13, 
        _mouseCursor = ""
    }, v10));
end;
v10._renderSnapTarget = function(v14, v15) --[[ Line: 36 ]] --[[ Name: _renderSnapTarget ]]
    -- upvalues: v3 (copy), v5 (copy), v4 (copy)
    local l__draggerContext_0 = v14._draggerContext;
    if l__draggerContext_0:shouldShowTargetGrids() then
        if #v15.softSnaps > 0 then
            return v3.createElement(v5, {
                DragTarget = v15, 
                DraggerContext = l__draggerContext_0
            });
        else
            local v17 = if l__draggerContext_0:shouldGridSnap() then l__draggerContext_0:getGridSize() else nil;
            return v3.createElement(v4, {
                DragTarget = v15, 
                SourceSize = Vector3.zero, 
                Scale = l__draggerContext_0:getHandleScale(v15.targetMatrix.Position), 
                GridSize = v17, 
                Color = l__draggerContext_0:getGridColor(), 
                PrimaryColor = l__draggerContext_0:getChosenColor()
            });
        end;
    else
        return nil;
    end;
end;
v10._renderSnap = function(v18) --[[ Line: 62 ]] --[[ Name: _renderSnap ]]
    -- upvalues: v3 (copy)
    local l__lastDragTarget_0 = v18._constraintToolModel._lastDragTarget;
    if not v18._draggerContext:areConstraintsEnabled() and l__lastDragTarget_0 then
        return v3.createFragment({
            SnapTarget = v18:_renderSnapTarget(l__lastDragTarget_0)
        });
    else
        return nil;
    end;
end;
local v20 = table.freeze({
    Hotkey = "T", 
    LabelLocEntry = "DragTilt"
});
local v21 = table.freeze({
    Hotkey = "R", 
    LabelLocEntry = "DragRotate"
});
local v22 = table.freeze({
    [true] = {
        Hotkey = "G", 
        LabelLocEntry = "DisablePartPassthrough"
    }, 
    [false] = {
        Hotkey = "G", 
        LabelLocEntry = "EnablePartPassthrough"
    }
});
local v23 = table.freeze({
    [true] = {
        Hotkey = "M", 
        LabelLocEntry = "DisableMultipleConstraintMode"
    }, 
    [false] = {
        Hotkey = "M", 
        LabelLocEntry = "EnableMultipleConstraintMode"
    }
});
local v24 = table.freeze({
    [true] = {
        Hotkey = "Alt+W", 
        LabelLocEntry = "DisableWeldVisualization"
    }, 
    [false] = {
        Hotkey = "Alt+W", 
        LabelLocEntry = "EnableWeldVisualization"
    }
});
local v25 = table.freeze({
    [true] = {
        Hotkey = "Alt+D", 
        LabelLocEntry = "DisableConstraintVisualization"
    }, 
    [false] = {
        Hotkey = "Alt+D", 
        LabelLocEntry = "EnableConstraintVisualization"
    }
});
local v26 = table.freeze({
    Hotkey = "Esc", 
    LabelLocEntry = "Escape"
});
v10._getHotkeyList = function(v27) --[[ Line: 127 ]] --[[ Name: _getHotkeyList ]]
    -- upvalues: v26 (copy), v20 (copy), v21 (copy), v24 (copy), l_StudioService_0 (copy), v25 (copy), l_EnableConstraintToolPartPassthroughFeature_0 (copy), v22 (copy), l_SimMultipleConstraintMode_0 (copy), v23 (copy), v7 (copy)
    local l__draggerContext_1 = v27._draggerContext;
    local v29 = {
        v26, 
        v20, 
        v21, 
        v24[l_StudioService_0.ShowWeldDetails], 
        v25[l_StudioService_0.ShowConstraintDetails]
    };
    if l_EnableConstraintToolPartPassthroughFeature_0 then
        table.insert(v29, v22[v27._constraintToolModel._partPassthroughEnabled]);
    end;
    if l_SimMultipleConstraintMode_0 then
        table.insert(v29, v23[v27._constraintToolModel._addMultipleConstraintsEnabled]);
    end;
    v7.addGridSnap(v29, l__draggerContext_1);
    v7.addHelp(v29);
    return v29;
end;
v10.render = function(v30) --[[ Line: 152 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v31 = v30:_renderSnap();
    local v32 = nil;
    if not v30._draggerContext:getSetting("HotkeyUsageHidden") then
        v32 = v3.createElement(v6, {
            DraggerContext = v30._draggerContext, 
            HotkeyList = v30:_getHotkeyList()
        });
    end;
    return v3.createFragment({
        DraggerElements = v31, 
        HotkeyUsageInfo = v32
    });
end;
return v10;