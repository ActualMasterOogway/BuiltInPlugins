local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_Pane_0 = l_UI_0.Pane;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v14 = require(l_Components_0.ImportQueue.AssetList);
local v15 = require(l_Components_0.ImportQueue.QueueControls);
local v16 = require(l_Components_0.ImportQueue.ImportProgressBar);
local v17 = require(l_script_FirstAncestor_0.Src.Actions.SetShowQueue);
local v18 = require(l_script_FirstAncestor_0.Src.Controllers.FileController);
local v19 = require(l_script_FirstAncestor_0.Src.Controllers.QueueController);
local v20 = v1.PureComponent:extend("ImportQueue");
v20.init = function(v21) --[[ Line: 32 ]] --[[ Name: init ]]
    v21.onClose = function() --[[ Line: 33 ]]
        -- upvalues: v21 (copy)
        local l_props_0 = v21.props;
        if l_props_0.Uploading then
            warn("Closing the importer and emptying import queue");
            l_props_0.QueueController:destroy();
        end;
        l_props_0.SetShowQueue(false);
    end;
end;
v20.didMount = function(v23) --[[ Line: 43 ]] --[[ Name: didMount ]]
    v23.props.Analytics:report("ImportQueueEnabled");
end;
v20.willUnmount = function(v24) --[[ Line: 47 ]] --[[ Name: willUnmount ]]
    v24.props.Analytics:report("ImportQueueDisabled");
end;
v20.render = function(v25) --[[ Line: 51 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_DockWidget_0 (copy), l_Pane_0 (copy), v15 (copy), v14 (copy), v16 (copy)
    local l_props_1 = v25.props;
    local l_ImportQueue_0 = l_props_1.Stylizer.ImportQueue;
    local l_ControlsHeight_0 = l_ImportQueue_0.ControlsHeight;
    local v29 = if l_props_1.ShowProgress then l_ImportQueue_0.ProgressBarHeight else 0;
    local v30 = l_ControlsHeight_0 + v29;
    return v1.createElement(l_DockWidget_0, {
        Title = l_props_1.Title, 
        Enabled = l_props_1.ShowQueue, 
        Size = l_ImportQueue_0.WindowSize, 
        InitialDockState = Enum.InitialDockState.Bottom, 
        MinSize = l_ImportQueue_0.WindowSize, 
        OnClose = v25.onClose
    }, {
        Queue = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Controls = v1.createElement(v15, {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, l_ControlsHeight_0)
            }), 
            AssetList = v1.createElement(v14, {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 1, -v30)
            }), 
            ImportProgressBar = v1.createElement(v16, {
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, v29)
            })
        })
    });
end;
v20 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    FileController = v18, 
    QueueController = v19
})(v20);
return v2.connect(function(v31) --[[ Line: 107 ]] --[[ Name: mapStateToProps ]]
    return {
        ShowQueue = v31.Dialogs.showQueue, 
        ShowProgress = v31.Dialogs.showProgress, 
        Uploading = v31.Dialogs.uploading
    };
end, function(v32) --[[ Line: 99 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v17 (copy)
    return {
        SetShowQueue = function(v33) --[[ Line: 101 ]] --[[ Name: SetShowQueue ]]
            -- upvalues: v32 (copy), v17 (ref)
            v32(v17(v33));
        end
    };
end)(v20);