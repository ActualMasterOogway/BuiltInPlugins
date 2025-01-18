local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v13 = require(l_script_FirstAncestor_0.Src.Components.Properties.PropertyStatus);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.UpdatePreviewInstance);
local v15 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateSessionInfo);
local l_shallowEqual_0 = v4.shallowEqual;
local l_Utility_0 = l_script_FirstAncestor_0.Src.Utility;
local v18 = require(l_Utility_0.createCalloutComponents);
local v19 = require(l_Utility_0.GetEditorFromType);
local v20 = require(l_Utility_0.GetErrorChecked);
local v21 = require(l_script_FirstAncestor_0.Src.Actions.SetErrorNodeChecked);
local v22 = require(l_script_FirstAncestor_0.Src.Actions.SetSettingsChanged);
local v23 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagChooseAnimationForRestPose);
local v25 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagUnlinkImporterAndAvatarPreview);
local v26 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportUploadWidgetCleanup);
local v27 = v1.PureComponent:extend("PropertyView");
local function v33(v28, v29) --[[ Line: 74 ]] --[[ Name: getDependentValues ]]
    if v29 == nil then
        return {};
    else
        local v30 = {};
        for _, v32 in ipairs(v29) do
            v30[v32] = v28[v32];
        end;
        return v30;
    end;
end;
local function _(v34, v35) --[[ Line: 86 ]] --[[ Name: dependentValuesDiffer ]]
    for v36, v37 in v34 do
        if v35[v36] ~= v37 then
            return true;
        end;
    end;
    return false;
end;
v27._connect = function(v39) --[[ Line: 95 ]] --[[ Name: _connect ]]
    -- upvalues: v33 (copy)
    if v39.props.Instance then
        local l_props_0 = v39.props;
        v39._changedConnection = l_props_0.Instance.Changed:Connect(function(v41) --[[ Line: 99 ]]
            -- upvalues: l_props_0 (copy), v39 (copy), v33 (ref)
            if v41 == l_props_0.PropertyMetadata.Name or v39.state.dependencies and v39.state.dependencies[v41] ~= nil then
                v39:setState({
                    value = l_props_0.Instance[l_props_0.PropertyMetadata.Name], 
                    dependencies = v33(l_props_0.Instance, l_props_0.PropertyMetadata.Dependencies)
                });
            end;
        end);
    end;
end;
v27._disconnect = function(v42) --[[ Line: 114 ]] --[[ Name: _disconnect ]]
    if v42._changedConnection then
        v42._changedConnection:Disconnect();
        v42._changedConnection = nil;
    end;
end;
v27.init = function(v43) --[[ Line: 121 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy), v26 (copy), v23 (copy), v24 (copy), v33 (copy)
    local function _() --[[ Line: 122 ]] --[[ Name: updatePreviewInstance ]]
        -- upvalues: v43 (copy)
        v43.props.UpdatePreviewInstance(v43.props.Instance:GetPreview());
    end;
    v43.onToggleItem = function() --[[ Line: 126 ]]
        -- upvalues: v43 (copy), v20 (ref), v26 (ref), v23 (ref)
        local l_props_1 = v43.props;
        local l_PropertyMetadata_0 = l_props_1.PropertyMetadata;
        l_props_1.Instance[l_PropertyMetadata_0.Name] = not l_props_1.Instance[l_PropertyMetadata_0.Name];
        v43.props.UpdatePreviewInstance(v43.props.Instance:GetPreview());
        l_props_1.SetErrorNodeChecked(v20(l_props_1.ImportTree));
        if v26() then
            l_props_1.UpdateSessionInfo(v23.update(l_props_1.ActiveQueueItem, {
                settingsChanged = true
            }));
        else
            l_props_1.SetSettingsChanged(true);
        end;
        l_props_1.OnInteract();
        v43:setState({});
    end;
    v43.onSetItem = function(v47) --[[ Line: 142 ]]
        -- upvalues: v43 (copy), v26 (ref), v23 (ref), v24 (ref), v20 (ref)
        local l_props_2 = v43.props;
        local l_PropertyMetadata_1 = l_props_2.PropertyMetadata;
        if l_PropertyMetadata_1.Name == "ImportName" and l_props_2.Instance.ImportName ~= v47 then
            if v26() then
                l_props_2.UpdateSessionInfo(v23.update(l_props_2.ActiveQueueItem, {
                    settingsChanged = true
                }));
            else
                l_props_2.SetSettingsChanged(true);
            end;
        end;
        l_props_2.Instance[l_PropertyMetadata_1.Name] = v47;
        if v24() then
            v43.props.UpdatePreviewInstance(v43.props.Instance:GetPreview());
        end;
        l_props_2.SetErrorNodeChecked(v20(l_props_2.ImportTree));
        l_props_2.OnInteract();
    end;
    v43.onSelectItem = function(v50) --[[ Line: 161 ]]
        -- upvalues: v43 (copy), v20 (ref), v26 (ref), v23 (ref)
        local l_props_3 = v43.props;
        local l_PropertyMetadata_2 = l_props_3.PropertyMetadata;
        local v53 = l_props_3.Instance[l_PropertyMetadata_2.Name].EnumType[v50];
        if v53 == l_props_3.Instance[l_PropertyMetadata_2.Name] then
            return;
        else
            l_props_3.Instance[l_PropertyMetadata_2.Name] = v53;
            v43.props.UpdatePreviewInstance(v43.props.Instance:GetPreview());
            l_props_3.SetErrorNodeChecked(v20(l_props_3.ImportTree));
            if v26() then
                l_props_3.UpdateSessionInfo(v23.update(l_props_3.ActiveQueueItem, {
                    settingsChanged = true
                }));
            else
                l_props_3.SetSettingsChanged(true);
            end;
            l_props_3.OnInteract();
            return;
        end;
    end;
    v43:setState({
        value = v43.props.Instance[v43.props.PropertyMetadata.Name], 
        dependencies = v33(v43.props.Instance, v43.props.PropertyMetadata.Dependencies)
    });
end;
v27.didMount = function(v54) --[[ Line: 185 ]] --[[ Name: didMount ]]
    v54:_connect();
end;
v27.willUnmount = function(v55) --[[ Line: 189 ]] --[[ Name: willUnmount ]]
    v55.state.connections = nil;
    v55:_disconnect();
end;
v27.didUpdate = function(v56, v57, _) --[[ Line: 194 ]] --[[ Name: didUpdate ]]
    if v57.Instance ~= v56.props.Instance then
        v56:_disconnect();
        v56:_connect();
    end;
end;
v27.getDerivedStateFromProps = function(v59, _) --[[ Line: 201 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v33 (copy)
    return {
        value = v59.Instance[v59.PropertyMetadata.Name], 
        dependencies = v33(v59.Instance, v59.PropertyMetadata.Dependencies)
    };
end;
v27.render = function(v61) --[[ Line: 208 ]] --[[ Name: render ]]
    -- upvalues: v33 (copy), v19 (copy), v25 (copy), v18 (copy), v1 (copy), l_Tooltip_0 (copy), l_Pane_0 (copy), v13 (copy), l_TextLabel_0 (copy)
    local l_props_4 = v61.props;
    local l_Localization_1 = l_props_4.Localization;
    local l_Stylizer_1 = l_props_4.Stylizer;
    local l_PropertyMetadata_3 = l_props_4.PropertyMetadata;
    local l_Instance_0 = l_props_4.Instance;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    if l_props_4.Status then
        v67 = l_props_4.Status.Level;
        v68 = l_props_4.Status.Type;
        v69 = l_props_4.Status.Context;
    end;
    local l_Editable_0 = l_PropertyMetadata_3.Editable;
    local l_Name_0 = l_PropertyMetadata_3.Name;
    local l_AllowPickFile_0 = l_PropertyMetadata_3.AllowPickFile;
    local v73 = l_Instance_0[l_Name_0];
    local v74 = nil;
    if l_PropertyMetadata_3.Dependencies then
        v74 = v33(l_Instance_0, l_PropertyMetadata_3.Dependencies);
    end;
    local v75 = nil;
    v75 = if l_PropertyMetadata_3.ComponentFactory then l_PropertyMetadata_3.ComponentFactory else v19(v73);
    local l_IconSize_0 = l_Stylizer_1.PropertyView.IconSize;
    local l_Spacing_0 = l_Stylizer_1.PropertyView.Spacing;
    local v78 = l_IconSize_0 + l_Spacing_0;
    local v79 = {};
    if not v25() and l_PropertyMetadata_3.Callouts then
        v79 = v18(l_PropertyMetadata_3.Callouts, l_Name_0, v61.props.AssetImportSession);
    end;
    v79.Tooltip = v1.createElement(l_Tooltip_0, {
        Text = l_Localization_1:getText("PropertiesTooltip", l_Name_0)
    });
    return v1.createElement(l_Pane_0, {
        LayoutOrder = l_props_4.LayoutOrder, 
        Size = UDim2.new(1, -l_Stylizer_1.PropertyView.ScrollBarOffset, 0, l_Stylizer_1.PropertyView.Height), 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Spacing = l_Spacing_0
    }, {
        StatusArea = v1.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = 3, 
            Size = UDim2.new(0, v78, 1, 0), 
            Padding = {
                Left = l_Spacing_0
            }
        }, {
            Icon = if v67 then v1.createElement(v13, {
                StatusLevel = v67, 
                StatusMessage = v68, 
                StatusContext = v69
            }) else nil
        }), 
        Label = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = l_Localization_1:getText("Properties", l_Name_0), 
            TextWrapped = false, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 1, 
            Size = UDim2.new(0.5, -v78, 0, 0)
        }, v79), 
        Editor = v1.createElement(v75, {
            DependentValues = v74, 
            Editable = l_Editable_0, 
            LayoutOrder = 2, 
            Name = l_Name_0, 
            OnSelectItem = v61.onSelectItem, 
            OnSetItem = v61.onSetItem, 
            OnToggleItem = v61.onToggleItem, 
            Size = UDim2.new(0.5, -l_Stylizer_1.PropertyView.ScrollBarOffset, 0, l_Stylizer_1.PropertyView.EditorHeight), 
            Value = v73, 
            Localization = l_Localization_1, 
            PropertyMetadata = l_PropertyMetadata_3, 
            AllowPickFile = l_AllowPickFile_0, 
            Instance = l_Instance_0, 
            AssetImportSession = v61.props.AssetImportSession
        })
    });
end;
v27.shouldUpdate = function(v80, v81, v82) --[[ Line: 307 ]] --[[ Name: shouldUpdate ]]
    -- upvalues: l_shallowEqual_0 (copy)
    local v83 = false;
    local l_state_0 = v80.state;
    if l_state_0.value ~= v82.value then
        return true;
    else
        local l_dependencies_0 = l_state_0.dependencies;
        local l_dependencies_1 = v82.dependencies;
        local v87;
        for v88, v89 in l_dependencies_0 do
            if l_dependencies_1[v88] ~= v89 then
                v87 = true;
                v83 = true;
            end;
            if v83 then
                break;
            end;
        end;
        if not v83 then
            v87 = false;
        end;
        v83 = false;
        if v87 then
            return true;
        else
            return not l_shallowEqual_0(v80.props, v81);
        end;
    end;
end;
v27 = l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v27);
return v2.connect(function(v90) --[[ Line: 328 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v26 (copy)
    return {
        AssetImportSession = v90.Preview.assetImportSession, 
        ImportTree = v90.Preview.importTree, 
        ActiveQueueItem = if v26() then v90.Preview.activeQueueItem else nil
    };
end, function(v91) --[[ Line: 336 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v26 (copy), v22 (copy), v14 (copy), v21 (copy), v15 (copy)
    return {
        SetSettingsChanged = not v26() and function(v92) --[[ Line: 339 ]]
            -- upvalues: v91 (copy), v22 (ref)
            v91(v22(v92));
        end or nil, 
        UpdatePreviewInstance = function(v93) --[[ Line: 343 ]] --[[ Name: UpdatePreviewInstance ]]
            -- upvalues: v91 (copy), v14 (ref)
            v91(v14(v93));
        end, 
        SetErrorNodeChecked = function(v94) --[[ Line: 346 ]] --[[ Name: SetErrorNodeChecked ]]
            -- upvalues: v91 (copy), v21 (ref)
            v91(v21(v94));
        end, 
        UpdateSessionInfo = function(v95) --[[ Line: 349 ]] --[[ Name: UpdateSessionInfo ]]
            -- upvalues: v91 (copy), v15 (ref)
            v91(v15(v95));
        end
    };
end)(v27);