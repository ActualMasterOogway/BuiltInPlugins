local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v1.useCallback;
local l_useContext_0 = v1.useContext;
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_IconButton_0 = v4.UI.IconButton;
local l_Pane_0 = v4.UI.Pane;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v10 = require(l_script_FirstAncestor_0.Src.Components.LabelCell);
local v11 = {
    Type = "Number", 
    Min = 0
};
local v12 = {
    Type = "Number", 
    Min = 0, 
    Max = 1
};
return function(v13) --[[ Line: 35 ]] --[[ Name: CurveControls ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), l_useContext_0 (copy), l_ContextServices_0 (copy), l_useCallback_0 (copy), v1 (copy), l_Pane_0 (copy), v10 (copy), v11 (copy), v12 (copy), l_IconButton_0 (copy)
    local v14 = l_LayoutOrderIterator_0.new();
    local v15 = l_useContext_0(l_ContextServices_0.Context.Consumer)[l_ContextServices_0.Localization.Key];
    local v16 = v13.CurveHook.getSelectedKeypoint();
    local v17 = if v16 then v16.X else nil;
    local v18 = if v16 then v16.Y else nil;
    local v21 = l_useCallback_0(function(v19) --[[ Line: 45 ]]
        -- upvalues: v18 (copy), v13 (copy)
        local v20 = Vector2.new(v19, v18);
        v13.CurveHook.update(v20, true);
    end, {
        v13.CurveHook
    });
    local v24 = l_useCallback_0(function(v22) --[[ Line: 50 ]]
        -- upvalues: v17 (copy), v13 (copy)
        local v23 = Vector2.new(v17, v22);
        v13.CurveHook.update(v23, true);
    end, {
        v13.CurveHook
    });
    local v25 = l_useCallback_0(function() --[[ Line: 55 ]]
        -- upvalues: v13 (copy)
        v13.CurveHook.remove();
    end, {
        v13.CurveHook
    });
    return v1.createElement(l_Pane_0, {
        LayoutOrder = 2, 
        Size = UDim2.fromScale(1, 0), 
        [v1.Tag] = "X-Center X-Middle X-RowM X-Fit"
    }, {
        X = v1.createElement(v10, {
            LayoutOrder = v14:getNextOrder(), 
            Text = v15:getText("Label", "Angle"), 
            Schema = v11, 
            Value = v17, 
            OnChanged = v21
        }), 
        Y = v1.createElement(v10, {
            LayoutOrder = v14:getNextOrder(), 
            Text = v15:getText("Label", "Volume"), 
            Schema = v12, 
            Value = v18, 
            OnChanged = v24
        }), 
        Delete = v1.createElement(l_IconButton_0, {
            LayoutOrder = v14:getNextOrder(), 
            Text = v15:getText("Control", "Delete"), 
            OnClick = v25
        })
    });
end;