local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_StudioService_0 = game:GetService("StudioService");
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_Separator_0 = l_UI_0.Separator;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_UploadWidgets_0 = l_script_FirstAncestor_0.Src.Components.Dialogs.UploadWidgets;
local v13 = require(l_UploadWidgets_0.SuccessWidget);
local v14 = require(l_UploadWidgets_0.FailureWidget);
local v15 = require(l_UploadWidgets_0.ProgressWidget_DEPRECATED);
local v16 = require(l_script_FirstAncestor_0.Src.Controllers.FileController);
local v17 = require(l_script_FirstAncestor_0.Src.Actions.SetShowProgress);
local v18 = require(l_script_FirstAncestor_0.Src.Actions.SetShowUploadWidget);
local v19 = require(l_script_FirstAncestor_0.Src.Actions.SetUploading);
local v20 = require(l_script_FirstAncestor_0.Src.Thunks.ShowImportPreview);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableImportQueueModal);
local v23 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportDialogButtonsAndStyling);
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAssetImportPlugin);
local v25 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportErrorMessageDialog);
local v26 = v2.PureComponent:extend("UploadWidget");
v26.init = function(v27) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: v22 (copy), v21 (copy), l_StudioService_0 (copy), v2 (copy), v15 (copy), v13 (copy), v23 (copy), v14 (copy)
    v27.state = {
        uploadResults = {}, 
        progressValue = 0, 
        errorMap = {}
    };
    v27.onClose = function() --[[ Line: 46 ]]
        -- upvalues: v27 (copy), v22 (ref), v21 (ref)
        local l_props_0 = v27.props;
        if v22() then
            l_props_0.SetShowUploadWidget(false);
        elseif v21() then
            l_props_0.SetShowUploadWidget(false);
            l_props_0.SetShowProgress(false);
        else
            l_props_0.SetShowProgress(false);
        end;
        l_props_0.FileController:DEPRECATED_cleanupPreview();
    end;
    v27.getRootAssetId = function() --[[ Line: 62 ]]
        -- upvalues: v27 (copy), v21 (ref)
        local l_props_1 = v27.props;
        local v30 = if v21() then l_props_1.UploadWidgetItem.uploadResults else v27.state.uploadResults;
        local v31 = nil;
        if v30 and v30.Succeeded then
            local v32 = if v21() then l_props_1.UploadWidgetItem.session:GetImportTree().Id else l_props_1.RootImportData.Id;
            v31 = v30.AssetIds[v32];
        end;
        return v31;
    end;
    v27.copyMeshIds = function() --[[ Line: 78 ]]
        -- upvalues: v27 (copy), v21 (ref), l_StudioService_0 (ref)
        local l_props_2 = v27.props;
        local v34 = if v21() then l_props_2.UploadWidgetItem.uploadResults else v27.state.uploadResults;
        if not v34 or not v34.Succeeded then
            return;
        else
            local l_Instance_0 = v34.Instance;
            local v36 = {};
            if l_Instance_0:IsA("MeshPart") then
                table.insert(v36, l_Instance_0.MeshId);
            end;
            for _, v38 in l_Instance_0:GetDescendants() do
                if v38:IsA("MeshPart") then
                    table.insert(v36, v38.MeshId);
                end;
            end;
            local v39 = "[" .. table.concat(v36, ", ") .. "]";
            l_StudioService_0:CopyToClipboard((tostring(v39)));
            return;
        end;
    end;
    v27.returnToPreview = function() --[[ Line: 104 ]]
        -- upvalues: v27 (copy), v21 (ref)
        local l_props_3 = v27.props;
        if v21() then
            l_props_3.FileController:requestPreview(l_props_3.UploadWidgetItem);
            return;
        else
            l_props_3.ShowImportPreview(l_props_3.AssetImportSession, function(_, _) --[[ Line: 109 ]]

            end);
            return;
        end;
    end;
    v27.onButtonPressed = function(v43) --[[ Line: 113 ]]
        -- upvalues: v27 (copy)
        if v43 == "Close" then
            v27.onClose();
            return;
        elseif v43 == "CopyMeshID" then
            v27.copyMeshIds();
            return;
        else
            if v43 == "Retry" then
                v27.onClose();
                v27.returnToPreview();
            end;
            return;
        end;
    end;
    v27.onImportCompleted = function(v44) --[[ Line: 124 ]]
        -- upvalues: v27 (copy)
        v27:setState({
            uploadResults = v44
        });
        v27.props.SetUploading(false);
    end;
    v27.isErrorsExpanded = function(v45) --[[ Line: 129 ]]
        if not v45 then
            return false;
        else
            for _, v47 in pairs(v45) do
                if v47 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    v27.getWidgetContent = function(v48) --[[ Line: 141 ]]
        -- upvalues: v27 (copy), v21 (ref), v22 (ref), v2 (ref), v15 (ref), v13 (ref), v23 (ref), v14 (ref)
        local l_props_4 = v27.props;
        if if v21() then l_props_4.ShowUploadWidget else l_props_4.ShowProgress then
            if not v22() and l_props_4.Uploading then
                return v2.createElement(v15, {
                    OnImportCompleted = v27.onImportCompleted
                });
            elseif v48 and v48.Succeeded then
                local v50 = if v21() then l_props_4.UploadWidgetItem.session:GetImportTree() else l_props_4.RootImportData;
                return v2.createElement(v13, {
                    AddedToInventory = v50.AddModelToInventory, 
                    AssetId = if v23() then v27.getRootAssetId() else nil
                });
            elseif v48 and v48.Succeeded ~= nil and not v48.Succeeded then
                local v51 = if v21() then l_props_4.UploadWidgetItem.session:GetImportTree() else nil;
                return v2.createElement(v14, {
                    LayoutOrder = 1, 
                    ErrorMap = v48.ErrorMessages, 
                    ExistingPackageId = if v21() then v51.ExistingPackageId else nil
                });
            end;
        end;
        return nil;
    end;
end;
v26.render = function(v52) --[[ Line: 179 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy), v23 (copy), v25 (copy), v2 (copy), l_StyledDialog_0 (copy), v24 (copy), l_Separator_0 (copy)
    local l_props_5 = v52.props;
    local l_state_0 = v52.state;
    local l_Localization_1 = l_props_5.Localization;
    local l_UploadWidget_0 = l_props_5.Stylizer.UploadWidget;
    local v57 = if v21() then l_props_5.UploadWidgetItem.uploadResults else l_state_0.uploadResults;
    local v58 = {
        Key = "Close", 
        Text = l_Localization_1:getText("Plugin", "Close"), 
        Style = "RoundPrimary"
    };
    local v59 = {
        Key = "CopyMeshID", 
        Text = l_Localization_1:getText("Upload", "CopyMeshId"), 
        Style = "CopyMeshID", 
        Tooltip = l_Localization_1:getText("Upload", "CopyMeshIdTooltip")
    };
    local v60 = {
        Key = "Retry", 
        Text = l_Localization_1:getText("Upload", "Retry")
    };
    local v61 = {};
    if v23() then
        if l_props_5.Uploading then
            v61 = {};
        elseif v57 and v57.Succeeded then
            v61 = {
                v59, 
                v58
            };
        elseif v57 and v57.Succeeded ~= nil and not v57.Succeeded then
            v61 = {
                v60, 
                v58
            };
        end;
    else
        v61 = if not v21() and l_props_5.Uploading then {} else {
            {
                Key = "Close", 
                Text = l_Localization_1:getText("Plugin", "Close")
            }
        };
    end;
    local v62 = nil;
    v62 = if v25() and v52.isErrorsExpanded(l_props_5.UploadWidgetItem.uploadErrorsExpanded) then Vector2.new(l_UploadWidget_0.ExpandedWidth, l_UploadWidget_0.ExpandedHeight) else Vector2.new(l_UploadWidget_0.Width, l_UploadWidget_0.Height);
    return v2.createElement(l_StyledDialog_0, {
        Enabled = if v21() then l_props_5.ShowUploadWidget else l_props_5.ShowProgress, 
        MinContentSize = v62, 
        Modal = if v23() then not v24() else false, 
        Resizable = true, 
        Title = l_props_5.Title, 
        Buttons = v61, 
        ButtonHorizontalAlignment = if v23() then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Center, 
        OnClose = v52.onClose, 
        OnButtonPressed = v52.onButtonPressed, 
        Style = v23() and "ImportDialog" or nil
    }, {
        Layout = if v23() then v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical
        }) else nil, 
        ContentInfo = v52.getWidgetContent(v57), 
        Separator = if not v23() or l_props_5.Uploading then nil else v2.createElement(l_Separator_0, {
            DominantAxis = Enum.DominantAxis.Width, 
            LayoutOrder = 2
        })
    });
end;
v26 = l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    FileController = v16
})(v26);
return v3.connect(function(v63) --[[ Line: 289 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v21 (copy), v22 (copy)
    return {
        ShowUploadWidget = if v21() then v63.Dialogs.showUploadWidget else nil, 
        UploadWidgetItem = if v21() then v63.Dialogs.uploadWidgetItem else nil, 
        Uploading = v63.Dialogs.uploading, 
        RootImportData = if not v21() then v63.Preview.importTree else nil, 
        ShowProgress = if not v22() then v63.Dialogs.showProgress else nil, 
        AssetImportSession = if not v21() then v63.Preview.assetImportSession else nil
    };
end, function(v64) --[[ Line: 266 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v22 (copy), v17 (copy), v19 (copy), v21 (copy), v18 (copy), v23 (copy), v20 (copy)
    return {
        SetShowProgress = not v22() and function(v65) --[[ Line: 269 ]]
            -- upvalues: v64 (copy), v17 (ref)
            v64(v17(v65));
        end or nil, 
        SetUploading = function(v66) --[[ Line: 273 ]] --[[ Name: SetUploading ]]
            -- upvalues: v64 (copy), v19 (ref)
            v64(v19(v66));
        end, 
        SetShowUploadWidget = v21() and function(v67) --[[ Line: 277 ]]
            -- upvalues: v64 (copy), v18 (ref)
            v64(v18(v67));
        end or nil, 
        ShowImportPreview = v23() and function(v68, v69) --[[ Line: 282 ]]
            -- upvalues: v64 (copy), v20 (ref)
            v64(v20(v68, v69));
        end or nil
    };
end)(v26);