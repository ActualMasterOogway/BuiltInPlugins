local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Src.Utility.AlignmentMode);
local v4 = require(l_Parent_0.Src.Utility.AlignmentSpace);
local v5 = require(l_Parent_0.Src.Utility.RelativeTo);
local l_join_0 = v1.join;
local v7 = {
    toolEnabled = false, 
    alignEnabled = false, 
    disabledReason = {}, 
    alignableObjects = {}, 
    alignmentMode = v3.Center, 
    alignmentSpace = v4.World, 
    enabledAxes = {
        X = false, 
        Y = false, 
        Z = false
    }, 
    relativeTo = v5.Selection, 
    previewVisible = false
};
return (v2.createReducer(v7, {
    SetToolEnabled = function(v8, v9) --[[ Line: 32 ]] --[[ Name: SetToolEnabled ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v8, {
            toolEnabled = v9.toolEnabled
        });
    end, 
    SetAlignEnabled = function(v10, v11) --[[ Line: 38 ]] --[[ Name: SetAlignEnabled ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v10, {
            alignEnabled = v11.alignEnabled, 
            disabledReason = v11.disabledReason
        });
    end, 
    SetAlignableObjects = function(v12, v13) --[[ Line: 45 ]] --[[ Name: SetAlignableObjects ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v12, {
            alignableObjects = v13.alignableObjects
        });
    end, 
    SetAlignmentMode = function(v14, v15) --[[ Line: 51 ]] --[[ Name: SetAlignmentMode ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v14, {
            alignmentMode = v15.alignmentMode
        });
    end, 
    SetAlignmentSpace = function(v16, v17) --[[ Line: 57 ]] --[[ Name: SetAlignmentSpace ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v16, {
            alignmentSpace = v17.alignmentSpace
        });
    end, 
    SetEnabledAxes = function(v18, v19) --[[ Line: 63 ]] --[[ Name: SetEnabledAxes ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v18, {
            enabledAxes = v19.enabledAxes
        });
    end, 
    SetRelativeTo = function(v20, v21) --[[ Line: 69 ]] --[[ Name: SetRelativeTo ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v20, {
            relativeTo = v21.relativeTo
        });
    end, 
    SetPreviewVisible = function(v22, v23) --[[ Line: 75 ]] --[[ Name: SetPreviewVisible ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v22, {
            previewVisible = v23.visible
        });
    end
}));