local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_Button_0 = l_UI_0.Button;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v16 = require(l_script_FirstAncestor_0.Src.Controllers.FileController);
local v17 = require(l_script_FirstAncestor_0.Src.Controllers.QueueController);
local v18 = require(l_script_FirstAncestor_0.Src.Actions.SetSearchTerm);
local v19 = require(l_script_FirstAncestor_0.Src.Actions.SetShowWarning);
local v20 = v1.PureComponent:extend("QueueControls");
v20.init = function(v21) --[[ Line: 33 ]] --[[ Name: init ]]
    v21.openFile = function() --[[ Line: 34 ]]
        -- upvalues: v21 (copy)
        v21.props.FileController:requestFilePicker();
    end;
    v21.cleanUp = function() --[[ Line: 37 ]]
        -- upvalues: v21 (copy)
        v21.props.QueueController:removeAllQueuedFiles();
    end;
    v21.startImport = function() --[[ Line: 40 ]]
        -- upvalues: v21 (copy)
        local l_props_0 = v21.props;
        if l_props_0.Uploading then
            l_props_0.Analytics:report("ImportQueueHalted");
            l_props_0.QueueController:stopImportQueue();
            return;
        else
            l_props_0.Analytics:report("ImportQueueStarted", l_props_0.ActiveSessionCount);
            l_props_0.QueueController:beginImportQueue();
            return;
        end;
    end;
    v21.onSearchRequested = function(v23) --[[ Line: 51 ]]
        -- upvalues: v21 (copy)
        v21.props.SetSearchTerm(v23);
    end;
end;
v20._createIconButton = function(v24, v25, v26, v27) --[[ Line: 56 ]] --[[ Name: _createIconButton ]]
    -- upvalues: v1 (copy), l_IconButton_0 (copy)
    local l_props_1 = v24.props;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_IconButtonSize_0 = l_Stylizer_1.ImportQueue.IconButtonSize;
    local l_SmallLength_0 = l_Stylizer_1.Icons.SmallLength;
    local l_DisabledTransparancy_0 = l_Stylizer_1.ImportQueue.DisabledTransparancy;
    local v33 = l_props_1.Uploading or l_props_1.Parsing;
    return v1.createElement(l_IconButton_0, {
        OnClick = v26, 
        LeftIcon = {
            Image = v25, 
            ImageTransparency = if v33 then l_DisabledTransparancy_0 else 0, 
            Size = UDim2.fromOffset(l_SmallLength_0, l_SmallLength_0)
        }, 
        Size = UDim2.fromOffset(l_IconButtonSize_0, l_IconButtonSize_0), 
        LayoutOrder = 2, 
        Disabled = v33, 
        TooltipText = v27 or nil, 
        Style = "IconOnly"
    });
end;
v20.render = function(v34) --[[ Line: 81 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_SearchBar_0 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy), l_Tooltip_0 (copy)
    local l_props_2 = v34.props;
    local l_ActiveSessionCount_0 = l_props_2.ActiveSessionCount;
    local l_SessionCount_0 = l_props_2.SessionCount;
    local l_ImportQueue_0 = l_props_2.Stylizer.ImportQueue;
    local l_Padding_0 = l_ImportQueue_0.Padding;
    local l_ImportButtonWidth_0 = l_ImportQueue_0.ImportButtonWidth;
    local l_IconButtonSize_1 = l_ImportQueue_0.IconButtonSize;
    local v42 = UDim2.new(0, l_ImportButtonWidth_0, 1, 0);
    local v43 = l_Padding_0 * 4 + l_IconButtonSize_1 * 2 + l_ImportButtonWidth_0;
    local l_Uploading_0 = l_props_2.Uploading;
    local v45 = l_props_2.Parsing or not l_Uploading_0 and l_ActiveSessionCount_0 == 0;
    local l_Localization_1 = l_props_2.Localization;
    local v47 = l_Localization_1:getText("ImportQueue", "AddFile");
    local v48 = l_Localization_1:getText("ImportQueue", "ClearQueue");
    local v49 = l_Localization_1:getText("ImportQueue", "StartQueue2", {
        filesImporting = tostring(l_ActiveSessionCount_0), 
        totalFiles = tostring(l_SessionCount_0)
    });
    local v50 = if l_Uploading_0 then l_Localization_1:getText("ImportQueue", "StopQueue") else l_Localization_1:getText("Plugin", "Upload");
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    return v1.createElement(l_Pane_0, {
        Size = l_props_2.Size, 
        LayoutOrder = l_LayoutOrder_0, 
        Layout = Enum.FillDirection.Horizontal, 
        Spacing = l_Padding_0, 
        Padding = l_Padding_0, 
        Style = "SubtleBox"
    }, {
        OpenFileButton = v34:_createIconButton(l_ImportQueue_0.OpenImage, v34.openFile, v47), 
        CleanupButton = v34:_createIconButton(l_ImportQueue_0.CleanupImage, v34.cleanUp, v48), 
        SearchBar = v1.createElement(l_SearchBar_0, {
            Size = UDim2.new(1, -v43, 1, 0), 
            OnSearchRequested = v34.onSearchRequested, 
            LayoutOrder = 3, 
            ShowSearchIcon = true, 
            ShowSearchButton = false, 
            IncrementalTextSearch = true
        }), 
        StartImportButton = v1.createElement(l_Button_0, {
            OnClick = v34.startImport, 
            Style = "RoundPrimary", 
            Text = v50, 
            Size = v42, 
            StyleModifier = if v45 then l_StyleModifier_0.Disabled else nil, 
            LayoutOrder = 4
        }, {
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = v49
            })
        })
    });
end;
v20 = l_withContext_0({
    FileController = v16, 
    QueueController = v17, 
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v20);
return v2.connect(function(v52) --[[ Line: 152 ]] --[[ Name: mapStateToProps ]]
    return {
        ActiveSessionCount = v52.Sessions.activeSessionCount, 
        Parsing = v52.Sessions.parsing, 
        SessionCount = v52.Sessions.sessionCount, 
        SessionQueue = v52.Sessions.sessionQueue, 
        Uploading = v52.Dialogs.uploading
    };
end, function(v53) --[[ Line: 162 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy), v19 (copy)
    return {
        SetSearchTerm = function(v54) --[[ Line: 164 ]] --[[ Name: SetSearchTerm ]]
            -- upvalues: v53 (copy), v18 (ref)
            v53(v18(v54));
        end, 
        SetShowWarning = function(v55) --[[ Line: 167 ]] --[[ Name: SetShowWarning ]]
            -- upvalues: v53 (copy), v19 (ref)
            v53(v19(v55));
        end
    };
end)(v20);