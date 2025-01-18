local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.UGCValidation);
local v5 = require(l_script_FirstAncestor_0.Src.Components.DisambiguationMenu.DisambiguationMenuEntry);
local v6 = require(l_script_FirstAncestor_0.Src.Components.DisambiguationMenu.getChoosableAssetTypes);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
return function(v15) --[[ Line: 33 ]] --[[ Name: LoneMeshPartEntry ]]
    -- upvalues: l_Localization_0 (copy), l_Stylizer_0 (copy), l_LayoutOrderIterator_0 (copy), v6 (copy), v4 (copy), v3 (copy), v5 (copy), l_Pane_0 (copy), l_SelectInput_0 (copy), v1 (copy)
    local v16 = l_Localization_0:use();
    local v17 = l_Stylizer_0:use("DisambiguationMenu");
    local v18 = l_LayoutOrderIterator_0.new();
    local v19 = v15.MeshPart:FindFirstChildWhichIsA("WrapLayer") ~= nil;
    local v20, v21 = v6();
    for _, v23 in v20 do
        v23.Label = v16:getText("AssetType", v23.Label);
    end;
    table.sort(v20, function(v24, v25) --[[ Line: 46 ]]
        return v24.Label < v25.Label;
    end);
    table.insert(v20, 1, {
        Id = "Ignore", 
        Label = v16:getText("DisambiguationMenu", "Ignore")
    });
    local v26 = nil;
    if v15.Assignment ~= nil and v15.Assignment.assetType ~= nil then
        local function _(v27) --[[ Line: 58 ]] --[[ Name: localize ]]
            -- upvalues: v16 (copy), v15 (copy)
            return v16:getText("DisambiguationMenu", v27, {
                name = v16:getText("AssetType", v15.Assignment.assetType.Name)
            });
        end;
        if v19 and not v4.util.isLayeredClothingAllowed(v15.Assignment.assetType) then
            v26 = v16:getText("DisambiguationMenu", "LoneMeshPartBadMarketplaceLayeredClothing", {
                name = v16:getText("AssetType", v15.Assignment.assetType.Name)
            });
        elseif not v19 and not v4.util.isRigidAccessoryAllowed(v15.Assignment.assetType) then
            v26 = v16:getText("DisambiguationMenu", "LoneMeshPartBadMarketplaceRigidAccessories", {
                name = v16:getText("AssetType", v15.Assignment.assetType.Name)
            });
        end;
    end;
    return v3.createElement(v5, {
        Instance = v15.MeshPart, 
        Name = v15.MeshPart.Name, 
        Subtitle = if v19 then v16:getText("DisambiguationMenu", "LayeredClothing") else v16:getText("DisambiguationMenu", "RigidAccessory"), 
        WarningText = v26, 
        LayoutOrder = v15.LayoutOrder
    }, v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Horizontal, 
        Spacing = v17.HorizontalSpacing
    }, {
        AttachmentDropdown = v15.Assignment and v15.Assignment.assetType ~= nil and #v21[v15.Assignment.assetType] > 1 and not v19 and v3.createElement(l_SelectInput_0, {
            LayoutOrder = v18:getNextOrder(), 
            Width = v17.AttachmentDropdownWidth, 
            SelectedId = v15.Assignment.attachmentName, 
            Items = v1.map(v21[v15.Assignment.assetType], function(v29) --[[ Line: 99 ]]
                -- upvalues: v16 (copy)
                return {
                    Id = v29.attachmentName, 
                    Label = v16:getText("AccessoryAttachment", v29.label)
                };
            end), 
            OnItemActivated = function(v30) --[[ Line: 106 ]] --[[ Name: OnItemActivated ]]
                -- upvalues: v15 (copy)
                local v31 = table.clone(v15.Assignment);
                v31.attachmentName = v30.Id;
                v15.SetAssignment(v31);
            end
        }), 
        AssetTypeDropdown = v3.createElement(l_SelectInput_0, {
            LayoutOrder = v18:getNextOrder(), 
            PlaceholderText = v16:getText("DisambiguationMenu", "AssetTypeDropdownPlaceholder"), 
            Width = v17.DropdownWidth, 
            SelectedId = v15.Assignment ~= nil and v15.Assignment.assetType == nil and "Ignore" or if v15.Assignment ~= nil and v15.Assignment.assetType ~= nil then v15.Assignment.assetType.Name else nil, 
            Items = v20, 
            OnItemActivated = function(v32) --[[ Line: 125 ]] --[[ Name: OnItemActivated ]]
                -- upvalues: v15 (copy), v21 (copy)
                v15.SetAssignment({
                    meshPart = v15.MeshPart, 
                    assetType = if v32.Id == "Ignore" then nil else Enum.AssetType[v32.Id], 
                    attachmentName = v32.Id == "Ignore" and "Ignore" or v21[Enum.AssetType[v32.Id]][1].attachmentName
                });
            end
        })
    }));
end;