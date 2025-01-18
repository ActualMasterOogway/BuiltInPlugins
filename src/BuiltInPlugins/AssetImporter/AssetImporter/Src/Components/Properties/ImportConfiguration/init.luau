local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_TextLabel_0 = v2.UI.TextLabel;
local v8 = require(script.Parent.PropertyListView);
local v9 = v1.PureComponent:extend("ImportConfiguration");
local function v12(v10) --[[ Line: 19 ]] --[[ Name: NoSelectedItem ]]
    -- upvalues: v1 (copy), l_TextLabel_0 (copy)
    local l_Localization_1 = v10.Localization;
    return v1.createFragment({
        Image = v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(32, 32)
        }), 
        Label = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 2, 
            Text = l_Localization_1:getText("Plugin", "ImportConfiguration"), 
            TextWrapped = true
        })
    });
end;
local function v15(v13) --[[ Line: 38 ]] --[[ Name: ItemSelected ]]
    -- upvalues: v1 (copy), v8 (copy)
    local l_Localization_2 = v13.Localization;
    return v1.createFragment({
        PropertyList = v1.createElement(v8, {
            Instance = v13.ImportItem, 
            AssetImportSession = v13.AssetImportSession, 
            Localization = l_Localization_2
        })
    });
end;
v9.render = function(v16) --[[ Line: 49 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v15 (copy), v12 (copy)
    local l_props_0 = v16.props;
    local l_Localization_3 = l_props_0.Localization;
    if l_props_0.ImportItem then
        return (v1.createElement(v15, {
            ImportItem = l_props_0.ImportItem, 
            AssetImportSession = l_props_0.AssetImportSession
        }));
    else
        return (v1.createElement(v12, {
            Localization = l_Localization_3
        }));
    end;
end;
return (l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v9));