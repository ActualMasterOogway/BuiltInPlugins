local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Container_0 = l_UI_0.Container;
local l_LoadingBar_0 = l_UI_0.LoadingBar;
local v13 = require(l_script_FirstAncestor_0.Src.Utility.trimFilename);
local v14 = require(l_script_FirstAncestor_0.Src.Utility.openInAvatarPreviewer);
local v15 = require(l_script_FirstAncestor_0.Src.Thunks.InsertModelInWorkspace);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagUnlinkImporterAndAvatarPreview);
local v18 = v2.PureComponent:extend("ProgressWidget");
v18.init = function(v19) --[[ Line: 31 ]] --[[ Name: init ]]
    v19.state = {
        progressValue = 0
    };
    v19._updateImportProgressConnection = nil;
end;
v18.didMount = function(v20) --[[ Line: 39 ]] --[[ Name: didMount ]]
    -- upvalues: v16 (copy), v17 (copy), v14 (copy)
    local l_props_0 = v20.props;
    v20._updateImportProgress = function(v22) --[[ Line: 41 ]]
        -- upvalues: v20 (copy)
        if v20.state.progressValue < v22 then
            v20:setState({
                progressValue = v22
            });
        end;
    end;
    v20._updateImportProgressConnection = (if v16() then l_props_0.UploadWidgetItem.session else v20.props.AssetImportSession).UploadProgress:Connect(v20._updateImportProgress);
    if not v16() then
        v20._updateImportComplete = function(v23) --[[ Line: 54 ]]
            -- upvalues: v20 (copy), v17 (ref), v14 (ref)
            if v23.Succeeded then
                v20.props.InsertModelInWorkspace(v23, v20.props.RootImportData);
                if not v17() then
                    v14(v23, v20.props.RootImportData, v20.props.AssetImportSession);
                end;
            end;
            v20.props.OnImportCompleted(v23);
        end;
        v20._updateImportCompleteConnection = v20.props.AssetImportSession.UploadComplete:Connect(v20._updateImportComplete);
    end;
end;
v18.willUnmount = function(v24) --[[ Line: 70 ]] --[[ Name: willUnmount ]]
    -- upvalues: v16 (copy)
    v24._updateImportProgressConnection:Disconnect();
    if not v16() then
        v24._updateImportCompleteConnection:Disconnect();
    end;
end;
v18.render = function(v25) --[[ Line: 77 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v13 (copy), v2 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_Container_0 (copy), l_LoadingBar_0 (copy)
    local l_props_1 = v25.props;
    local l_state_0 = v25.state;
    local v28 = l_props_1.Localization:getText("Upload", "Uploading");
    local l_UploadWidget_0 = l_props_1.Stylizer.UploadWidget;
    local v30 = if v16() then v13(l_props_1.UploadWidgetItem.filepath) else v13(l_props_1.Filename);
    local v31 = l_state_0.progressValue or 0;
    local v32 = ("%* %* %*%%"):format(v28, v30, (tostring((math.floor(v31 * 100)))));
    return v2.createElement(l_Pane_0, {
        LayoutOrder = 1, 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = l_UploadWidget_0.TopPadding
    }, {
        LoadingText = v2.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 30), 
            Text = v32, 
            TextSize = l_UploadWidget_0.SubtextSize, 
            TextXAlignment = l_UploadWidget_0.TextAlignment, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), 
        LoadingBarContainer = v2.createElement(l_Container_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, l_UploadWidget_0.LoadingBarHeight)
        }, {
            LoadingBar = v2.createElement(l_LoadingBar_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 10), 
                Size = l_UploadWidget_0.LoadingBarContainerSize, 
                Progress = v31
            })
        })
    });
end;
v18 = l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v18);
return v3.connect(function(v33) --[[ Line: 138 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v16 (copy)
    return {
        AssetImportSession = if not v16() then v33.Preview.assetImportSession else nil, 
        Filename = if not v16() then v33.Preview.filename else nil, 
        RootImportData = if not v16() then v33.Preview.importTree else nil, 
        UploadWidgetItem = if v16() then v33.Dialogs.uploadWidgetItem else nil
    };
end, function(v34) --[[ Line: 128 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v16 (copy), v15 (copy)
    return {
        InsertModelInWorkspace = not v16() and function(v35, v36) --[[ Line: 131 ]]
            -- upvalues: v34 (copy), v15 (ref)
            v34(v15(v35, v36));
        end or nil
    };
end)(v18);