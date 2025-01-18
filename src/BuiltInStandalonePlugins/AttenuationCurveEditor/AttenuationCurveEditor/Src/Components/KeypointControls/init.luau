local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v1.useCallback;
local l_useContext_0 = v1.useContext;
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_IconButton_0 = v4.UI.IconButton;
local l_Pane_0 = v4.UI.Pane;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v9 = require(l_script_FirstAncestor_0.Src.Components.LabelCell);
local v10 = {
    Type = "Number", 
    Min = 0
};
local v11 = {
    Type = "Number", 
    Min = 0, 
    Max = 1
};
return function(v12) --[[ Line: 35 ]] --[[ Name: KeypointControls ]]
    -- upvalues: l_useContext_0 (copy), l_ContextServices_0 (copy), l_useCallback_0 (copy), v1 (copy), l_Pane_0 (copy), v9 (copy), v10 (copy), v11 (copy), l_IconButton_0 (copy)
    local v13 = l_useContext_0(l_ContextServices_0.Context.Consumer)[l_ContextServices_0.Localization.Key];
    local v18 = l_useCallback_0(function(v14) --[[ Line: 39 ]]
        -- upvalues: v12 (copy)
        if not v12.Keypoint then
            return function(_) --[[ Line: 41 ]]

            end;
        else
            return function(v16) --[[ Line: 44 ]]
                -- upvalues: v12 (ref), v14 (copy)
                local l_Keypoint_0 = v12.Keypoint;
                if v14 == "X" then
                    l_Keypoint_0 = Vector2.new(v16, l_Keypoint_0.Y);
                end;
                if v14 == "Y" then
                    l_Keypoint_0 = Vector2.new(l_Keypoint_0.X, v16);
                end;
                if v12.OnEdit then
                    v12.OnEdit(l_Keypoint_0);
                end;
            end;
        end;
    end, {
        v12.Keypoint, 
        v12.OnEdit
    });
    local v19 = nil;
    local v20 = nil;
    if v12.Keypoint then
        v19 = v12.Keypoint.X;
        v20 = v12.Keypoint.Y;
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = 2, 
        Size = UDim2.fromScale(1, 0), 
        [v1.Tag] = "X-Center X-Middle X-RowM X-Fit"
    }, {
        SequenceButtonsContainer = v1.createElement(l_Pane_0, {
            LayoutOrder = 1, 
            [v1.Tag] = "X-Left X-Pad X-RowM X-Fit"
        }, {
            X = v1.createElement(v9, {
                LayoutOrder = 1, 
                Text = v13:getText("Label", "Distance"), 
                Schema = v10, 
                Value = v19, 
                OnChanged = v18("X")
            }), 
            Y = v1.createElement(v9, {
                LayoutOrder = 2, 
                Text = v13:getText("Label", "Volume"), 
                Schema = v11, 
                Value = v20, 
                OnChanged = v18("Y")
            })
        }), 
        CommitButtonsContainer = v1.createElement(l_Pane_0, {
            LayoutOrder = 3, 
            [v1.Tag] = "X-Right X-Pad X-RowM X-Fit"
        }, {
            Delete = v1.createElement(l_IconButton_0, {
                LayoutOrder = 1, 
                Text = v13:getText("Control", "Delete"), 
                OnClick = v12.OnDelete
            })
        })
    });
end;