local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_Components_0 = l_Parent_0.Src.Components;
local v4 = require(l_Components_0.Dialogs.MeshImportDialog);
local v5 = require(l_Components_0.Dialogs.UploadWidget);
local v6 = require(l_Components_0.Dialogs.ErrorWidget);
local v7 = require(l_Components_0.Dialogs.ImportQueue);
local v8 = require(l_Components_0.Dialogs.ParseWidget);
local v9 = require(l_Parent_0.Src.Resources.CalloutList);
local v10 = require(l_Parent_0.Src.Utility.GetLocalizedString);
local v11 = require(l_Parent_0.Src.Flags.getFFlagAssetImportEnableImportQueueModal);
local v12 = require(l_Parent_0.Src.Flags.getFFlagAssetImportParseDialog);
local v13 = v1.PureComponent:extend("MainPlugin");
local function v20(v14, v15) --[[ Line: 29 ]] --[[ Name: setupCallouts ]]
    -- upvalues: v9 (copy), v10 (copy)
    for v16, v17 in v9 do
        local v18 = v10(v15, "Callouts", v17.Title);
        local v19 = v10(v15, "Callouts", v17.Description);
        if v18 and v19 then
            v14:defineCallout(v16, v18, v19, v17.Link);
        end;
    end;
end;
v13.init = function(v21, v22) --[[ Line: 39 ]] --[[ Name: init ]]
    v22.PluginLoaderContextItem.mainButtonClickedSignal:Connect(function() --[[ Line: 40 ]]
        -- upvalues: v21 (copy)
        v21.props.FileController:onPluginButtonClicked();
    end);
end;
v13.didUpdate = function(v23) --[[ Line: 45 ]] --[[ Name: didUpdate ]]
    local l_props_0 = v23.props;
    local l_showPreview_0 = l_props_0.Store:getState().showPreview;
    l_props_0.PluginLoaderContextItem.mainButton:SetActive(l_showPreview_0);
end;
v13.render = function(v26) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v20 (copy), l_ContextServices_0 (copy), v11 (copy), v1 (copy), v7 (copy), v4 (copy), v5 (copy), v6 (copy), v12 (copy), v8 (copy)
    local l_props_1 = v26.props;
    local l_Localization_0 = l_props_1.Localization;
    local v29 = {
        l_props_1.Plugin, 
        l_props_1.Mouse, 
        l_props_1.Store, 
        l_props_1.Theme, 
        l_Localization_0, 
        l_props_1.Analytics, 
        l_props_1.CalloutController, 
        l_props_1.PresetController, 
        l_props_1.FileController, 
        l_props_1.QueueController
    };
    v20(l_props_1.CalloutController, l_Localization_0);
    return l_ContextServices_0.provide(v29, {
        ImportQueue = if v11() then v1.createElement(v7, {
            Title = l_Localization_0:getText("ImportQueue", "WindowTitle")
        }) else nil, 
        Preview = v1.createElement(v4, {
            Title = l_Localization_0:getText("Plugin", "WindowTitle")
        }), 
        UploadWidget = v1.createElement(v5, {
            Title = l_Localization_0:getText("Upload", "WindowTitle")
        }), 
        ErrorWidget = if not v11() then v1.createElement(v6, {
            Title = l_Localization_0:getText("Error", "WindowTitle")
        }) else nil, 
        ParseWidget = if v12() then v1.createElement(v8, {
            Title = l_Localization_0:getText("Parse", "WindowTitle")
        }) else nil
    });
end;
return v13;