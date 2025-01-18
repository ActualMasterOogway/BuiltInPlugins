local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_UI_0 = v3.UI;
local l_Separator_0 = l_UI_0.Separator;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local v12 = require(l_script_FirstAncestor_0.Src.Components.AssetImporterUI);
local v13 = require(l_script_FirstAncestor_0.Src.Controllers.FileController);
local v14 = require(l_script_FirstAncestor_0.Src.Controllers.QueueController);
local v15 = require(l_script_FirstAncestor_0.Src.Thunks.ClosePreview);
local v16 = require(l_script_FirstAncestor_0.Src.Utility.isAssetNameValid);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAssetImportPlugin);
local v19 = v1.PureComponent:extend("MeshImportDialog");
local function _(v20) --[[ Line: 34 ]] --[[ Name: isImportEnabled ]]
    -- upvalues: v16 (copy)
    local v21 = if v20.ImportTree then v20.ImportTree.ImportName else nil;
    return not v20.HasInvalidPackageId and v20.ImportDataCheckedCount ~= 0 and not v20.ErrorNodeChecked and v16(v21);
end;
v19.init = function(v23) --[[ Line: 42 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), v16 (copy)
    v23.state = {
        assetName = ""
    };
    v23._importNameChangedConnection = nil;
    v23.onClose = function() --[[ Line: 49 ]]
        -- upvalues: v23 (copy)
        v23.props.ClosePreview();
    end;
    v23.onImport = function() --[[ Line: 53 ]]
        -- upvalues: v23 (copy)
        local l_props_0 = v23.props;
        local v25 = l_props_0.SessionQueue[l_props_0.Filename];
        l_props_0.ClosePreview();
        l_props_0.QueueController:uploadItem(v25);
    end;
    v23.onButtonPressed = function(v26) --[[ Line: 63 ]]
        -- upvalues: v17 (ref), v23 (copy), v16 (ref)
        if v17() then
            if v26 == "Close" then
                v23.onClose();
                return;
            elseif v26 == "Import" then
                v23.onImport();
                return;
            end;
        else
            local l_props_1 = v23.props;
            if v26 == "Cancel" then
                l_props_1.FileController:DEPRECATED_onSessionCanceled(l_props_1.AssetImportSession);
                return;
            elseif v26 == "Import" then
                local v28 = if l_props_1.ImportTree then l_props_1.ImportTree.ImportName else nil;
                if not l_props_1.HasInvalidPackageId and l_props_1.ImportDataCheckedCount ~= 0 and not l_props_1.ErrorNodeChecked and v16(v28) then
                    l_props_1.FileController:DEPRECATED_onImport(l_props_1.AssetImportSession);
                end;
            end;
        end;
    end;
end;
v19.render = function(v29) --[[ Line: 84 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v17 (copy), l_StyleModifier_0 (copy), v1 (copy), l_StyledDialog_0 (copy), v18 (copy), v12 (copy), l_Separator_0 (copy)
    local l_props_2 = v29.props;
    local l_Localization_1 = l_props_2.Localization;
    local v32 = if l_props_2.ImportTree then l_props_2.ImportTree.ImportName else nil;
    local v33 = not l_props_2.HasInvalidPackageId and l_props_2.ImportDataCheckedCount ~= 0 and not l_props_2.ErrorNodeChecked and v16(v32);
    v32 = nil;
    v32 = if v17() then {
        {
            Key = "Close", 
            Text = l_Localization_1:getText("Plugin", "Close")
        }, 
        {
            Key = "Import", 
            Text = l_Localization_1:getText("Plugin", "Import"), 
            Style = "RoundPrimary", 
            StyleModifier = not v33 and l_StyleModifier_0.Disabled or nil
        }
    } else {
        {
            Key = "Cancel", 
            Text = l_Localization_1:getText("Plugin", "Cancel")
        }, 
        {
            Key = "Import", 
            Text = l_Localization_1:getText("Plugin", "Import"), 
            Style = "RoundPrimary", 
            StyleModifier = not v33 and l_StyleModifier_0.Disabled or nil
        }
    };
    local v34 = nil;
    v34 = if v17() then v29.onClose else function() --[[ Line: 121 ]]
        -- upvalues: l_props_2 (copy)
        l_props_2.FileController:DEPRECATED_onSessionCanceled(l_props_2.AssetImportSession);
    end;
    return v1.createElement(l_StyledDialog_0, {
        Enabled = l_props_2.ShowPreview, 
        MinContentSize = Vector2.new(800, 650), 
        Modal = if v17() then not v18() else false, 
        Resizable = true, 
        Title = l_props_2.Title, 
        Buttons = v32, 
        OnClose = v34, 
        OnButtonPressed = v29.onButtonPressed, 
        Style = "FullBleed"
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical
        }), 
        AssetImporterUI = if l_props_2.ShowPreview then v1.createElement(v12, {
            LayoutOrder = 1
        }) else nil, 
        Separator = v1.createElement(l_Separator_0, {
            DominantAxis = Enum.DominantAxis.Width, 
            LayoutOrder = 2
        })
    });
end;
v19.didMount = function(v35) --[[ Line: 152 ]] --[[ Name: didMount ]]
    v35:_connect();
end;
v19._connect = function(v36) --[[ Line: 156 ]] --[[ Name: _connect ]]
    local l_ImportTree_0 = v36.props.ImportTree;
    if l_ImportTree_0 ~= nil then
        v36._importNameChangedConnection = l_ImportTree_0.Changed:Connect(function(v38) --[[ Line: 160 ]]
            -- upvalues: v36 (copy), l_ImportTree_0 (copy)
            if v38 == "ImportName" then
                v36:setState({
                    assetName = l_ImportTree_0.ImportName
                });
            end;
        end);
    end;
end;
v19.willUnmount = function(v39) --[[ Line: 170 ]] --[[ Name: willUnmount ]]
    v39:_disconnect();
end;
v19._disconnect = function(v40) --[[ Line: 174 ]] --[[ Name: _disconnect ]]
    if v40._importNameChangedConnection then
        v40._importNameChangedConnection:Disconnect();
        v40._importNameChangedConnection = nil;
    end;
end;
v19.didUpdate = function(v41, v42, _) --[[ Line: 181 ]] --[[ Name: didUpdate ]]
    if v42.ImportTree ~= v41.props.ImportTree then
        v41:_disconnect();
        v41:_connect();
    end;
end;
v19.getDerivedStateFromProps = function(v44, _) --[[ Line: 188 ]] --[[ Name: getDerivedStateFromProps ]]
    return {
        assetName = if v44.ImportTree then v44.ImportTree.ImportName else nil
    };
end;
v19 = l_withContext_0({
    FileController = v13, 
    QueueController = if v17() then v14 else nil, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v19);
return v2.connect(function(v46) --[[ Line: 201 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v17 (copy)
    return {
        ImportTree = v46.Preview.importTree, 
        AssetImportSession = v46.Preview.assetImportSession, 
        ImportDataCheckedCount = v46.Preview.importDataCheckedCount, 
        ErrorNodeChecked = v46.Preview.errorNodeChecked, 
        HasInvalidPackageId = v46.Preview.hasInvalidPackageId, 
        ShowPreview = v46.Dialogs.showPreview, 
        SessionQueue = if v17() then v46.Sessions.sessionQueue else nil, 
        Filename = if v17() then v46.Preview.filename else nil
    };
end, function(v47) --[[ Line: 214 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v15 (copy)
    return {
        ClosePreview = function() --[[ Line: 216 ]] --[[ Name: ClosePreview ]]
            -- upvalues: v47 (copy), v15 (ref)
            v47(v15());
        end
    };
end)(v19);