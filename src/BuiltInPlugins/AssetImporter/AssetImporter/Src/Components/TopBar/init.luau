local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local v12 = require(l_script_FirstAncestor_0.Src.Components.Presets.PresetMenu);
local v13 = require(l_script_FirstAncestor_0.Src.Components.Presets.PresetSelector);
local v14 = require(l_script_FirstAncestor_0.Src.Controllers.PresetController);
local v15 = require(l_script_FirstAncestor_0.Src.Controllers.FileController);
local v16 = require(l_script_FirstAncestor_0.Src.Actions.SetCurrentPreset);
local v17 = require(l_script_FirstAncestor_0.Src.Actions.SetSettingsChanged);
local v18 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateChecked);
local v19 = require(l_script_FirstAncestor_0.Src.Thunks.UpdatePreviewInstance);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportUploadWidgetCleanup);
local v22 = v1.PureComponent:extend("TopBar");
v22.init = function(v23) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy)
    v23.onBrowse = function() --[[ Line: 35 ]]
        -- upvalues: v23 (copy), v20 (ref)
        local l_props_0 = v23.props;
        if v20() then
            l_props_0.FileController:requestFileSwap(l_props_0.FileName);
            return;
        else
            l_props_0.FileController:requestFilePicker();
            return;
        end;
    end;
end;
v22.render = function(v25) --[[ Line: 45 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_Button_0 (copy), l_TextInput_0 (copy), v13 (copy), v20 (copy), v12 (copy)
    local l_props_1 = v25.props;
    local l_Localization_1 = l_props_1.Localization;
    local l_TopBar_0 = l_props_1.Stylizer.TopBar;
    local l_MenuButtonSize_0 = l_TopBar_0.MenuButtonSize;
    local v30 = l_TopBar_0.ButtonSize.X.Offset + l_MenuButtonSize_0.X.Offset + l_TopBar_0.TemplateDropDown.X.Offset + l_TopBar_0.Spacing * 3;
    return v1.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        Padding = l_TopBar_0.Padding, 
        Size = l_props_1.Size, 
        Spacing = l_TopBar_0.Spacing
    }, {
        BrowseButton = v1.createElement(l_Button_0, {
            LayoutOrder = 1, 
            Size = l_TopBar_0.ButtonSize, 
            Style = "Round", 
            Text = l_Localization_1:getText("Plugin", "Browse"), 
            OnClick = v25.onBrowse
        }), 
        TextInput = v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, -v30, 1, 0), 
            LayoutOrder = 2
        }, {
            FilePath = v1.createElement(l_TextInput_0, {
                AutomaticSize = Enum.AutomaticSize.None, 
                Disabled = true, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = l_props_1.FileName
            })
        }), 
        PresetDropdown = v1.createElement(v13, {
            LayoutOrder = 3, 
            QueueItem = if v20() then l_props_1.ActiveQueueItem else nil, 
            Size = if v20() then l_TopBar_0.TemplateDropDown else nil
        }), 
        PresetMenu = v1.createElement(v12, {
            LayoutOrder = 4
        })
    });
end;
v22 = l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    PresetController = v14, 
    FileController = v15
})(v22);
return v2.connect(function(v31) --[[ Line: 100 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v20 (copy), v21 (copy)
    return {
        ActiveQueueItem = if v20() then v31.Preview.activeQueueItem else nil, 
        AssetImportSession = v31.Preview.assetImportSession, 
        CurrentPreset = if not v20() then v31.Preview.currentPreset else nil, 
        SettingsChanged = if not v21() then v31.Preview.settingsChanged else nil, 
        SelectedImportItem = v31.Preview.selectedImportItem, 
        Checked = v31.Preview.importDataChecked or {}
    };
end, function(v32) --[[ Line: 111 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v20 (copy), v16 (copy), v21 (copy), v17 (copy), v18 (copy), v19 (copy)
    return {
        SetCurrentPreset = not v20() and function(v33) --[[ Line: 114 ]]
            -- upvalues: v32 (copy), v16 (ref)
            v32(v16(v33));
        end or nil, 
        SetSettingsChanged = not v21() and function(v34) --[[ Line: 119 ]]
            -- upvalues: v32 (copy), v17 (ref)
            v32(v17(v34));
        end or nil, 
        UpdateChecked = function(v35) --[[ Line: 123 ]] --[[ Name: UpdateChecked ]]
            -- upvalues: v32 (copy), v18 (ref)
            v32(v18(v35));
        end, 
        UpdatePreviewInstance = function(v36) --[[ Line: 126 ]] --[[ Name: UpdatePreviewInstance ]]
            -- upvalues: v32 (copy), v19 (ref)
            v32(v19(v36));
        end
    };
end)(v22);