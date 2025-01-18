local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TruncatedTextLabel_0 = l_UI_0.TruncatedTextLabel;
local v16 = require(l_Parent_0.Src.Controllers.GeneralServiceController);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v19 = require(l_Actions_0.SetMaterialVariant);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v21 = require(l_Constants_0.getFullMaterialType);
local v22 = require(l_Constants_0.getMaterialName);
local v23 = require(l_Constants_0.getSupportedMaterials);
local l_game_FastInt_0 = game:GetFastInt("InfluxReportMaterialManagerHundrethPercent2");
local v25 = v23();
local v26 = v2.PureComponent:extend("MaterialInformation");
v26.init = function(v27) --[[ Line: 66 ]] --[[ Name: init ]]
    -- upvalues: v22 (copy), l_game_FastInt_0 (copy)
    v27.delete = function() --[[ Line: 67 ]]
        -- upvalues: v27 (copy)
        local l_props_0 = v27.props;
        local l_Material_0 = l_props_0.Material;
        if l_Material_0 and l_Material_0.MaterialVariant then
            l_props_0.GeneralServiceController:destroyWithUndo(l_Material_0.MaterialVariant);
            l_props_0.Analytics:report("deleteMaterialVariant");
        end;
    end;
    v27.createVariant = function() --[[ Line: 77 ]]
        -- upvalues: v27 (copy), v22 (ref), l_game_FastInt_0 (ref)
        local l_props_1 = v27.props;
        local l_Material_1 = l_props_1.Material;
        if l_Material_1 and not l_Material_1.MaterialVariant then
            local v32 = l_props_1.GeneralServiceController:createMaterialVariant(l_Material_1.Material);
            local v33 = {
                BaseMaterial = v22(l_Material_1.Material)
            };
            l_props_1.Analytics:report("newMaterialVariant", v33, l_game_FastInt_0);
            l_props_1.Analytics:report("newMaterialVariantCounter");
            l_props_1.dispatchSetMaterialVariant(v32);
        end;
    end;
    v27.applyToSelection = function() --[[ Line: 92 ]]
        -- upvalues: v27 (copy)
        local l_props_2 = v27.props;
        if l_props_2.Material then
            l_props_2.GeneralServiceController:ApplyToSelection(l_props_2.Material.Material, if l_props_2.Material.MaterialVariant then l_props_2.Material.MaterialVariant.Name else nil);
            l_props_2.Analytics:report("applyToSelectionButton");
        end;
    end;
end;
v26.render = function(v35) --[[ Line: 105 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), v22 (copy), v21 (copy), v25 (copy), l_TruncatedTextLabel_0 (copy), l_Button_0 (copy), l_Image_0 (copy), l_Tooltip_0 (copy)
    local l_props_3 = v35.props;
    local l_MaterialInformation_0 = l_props_3.Stylizer.MaterialInformation;
    local l_Localization_1 = l_props_3.Localization;
    local l_Material_2 = l_props_3.Material;
    if not l_Material_2 then
        return v2.createElement(l_Pane_0);
    else
        local v40 = not l_Material_2.MaterialVariant;
        local v41 = if v40 then l_Localization_1:getText("Materials", v22(l_Material_2.Material)) else l_Material_2.MaterialVariant.Name;
        local v42 = v21(l_Material_2, l_Localization_1);
        local l_MaterialPath_0 = l_Material_2.MaterialPath;
        local v44 = {};
        for v45, v46 in ipairs(l_MaterialPath_0) do
            v44[v45] = l_Localization_1:getText("Categories", v46);
        end;
        local v47 = table.concat(v44, " > ");
        local v48 = 1;
        if v25[l_Material_2.Material] then
            v48 = 2;
        end;
        local v49 = UDim2.new(1, -(v48 * l_MaterialInformation_0.ButtonSize.X.Offset), 1, 0);
        return v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = l_props_3.LayoutOrder, 
            Padding = 10
        }, {
            Title = v2.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = 1, 
                Size = l_MaterialInformation_0.LabelRowSize
            }, {
                Name = v2.createElement(l_TruncatedTextLabel_0, {
                    LayoutOrder = 1, 
                    Font = l_MaterialInformation_0.HeaderFont, 
                    Size = v49, 
                    Text = v41, 
                    TextSize = l_MaterialInformation_0.TitleTextSize, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                ApplyToSelection = v2.createElement(l_Button_0, {
                    LayoutOrder = 2, 
                    OnClick = v35.applyToSelection, 
                    Size = l_MaterialInformation_0.ButtonSize, 
                    Style = l_MaterialInformation_0.ButtonStyle
                }, {
                    Image = v2.createElement(l_Image_0, {
                        Style = l_MaterialInformation_0.ApplyToSelection, 
                        Size = l_MaterialInformation_0.ImageSize, 
                        Position = l_MaterialInformation_0.ImagePosition
                    }), 
                    Tooltip = v2.createElement(l_Tooltip_0, {
                        Text = l_Localization_1:getText("TopBar", "Apply")
                    })
                }), 
                CreateVariant = if v40 and v25[l_Material_2.Material] then v2.createElement(l_Button_0, {
                    LayoutOrder = 3, 
                    OnClick = v35.createVariant, 
                    Size = l_MaterialInformation_0.ButtonSize, 
                    Style = l_MaterialInformation_0.ButtonStyle
                }, {
                    Image = v2.createElement(l_Image_0, {
                        Style = l_MaterialInformation_0.CreateVariant, 
                        Size = l_MaterialInformation_0.ImageSize, 
                        Position = l_MaterialInformation_0.ImagePosition
                    }), 
                    Tooltip = v2.createElement(l_Tooltip_0, {
                        Text = l_Localization_1:getText("MaterialInformation", "CreateVariant")
                    })
                }) else nil, 
                Delete = if not v40 then v2.createElement(l_Button_0, {
                    LayoutOrder = 3, 
                    OnClick = v35.delete, 
                    Size = l_MaterialInformation_0.ButtonSize, 
                    Style = l_MaterialInformation_0.ButtonStyle
                }, {
                    Image = v2.createElement(l_Image_0, {
                        Style = l_MaterialInformation_0.Delete, 
                        Size = l_MaterialInformation_0.ImageSize, 
                        Position = l_MaterialInformation_0.ImagePosition
                    }), 
                    Tooltip = v2.createElement(l_Tooltip_0, {
                        Text = l_Localization_1:getText("MaterialInformation", "Delete")
                    })
                }) else nil
            }), 
            MaterialType = v2.createElement(l_TruncatedTextLabel_0, {
                LayoutOrder = 2, 
                Size = l_MaterialInformation_0.LabelRowSize, 
                Text = v42, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            Category = v2.createElement(l_TruncatedTextLabel_0, {
                LayoutOrder = 3, 
                Size = l_MaterialInformation_0.LabelRowSize, 
                Text = v47, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        });
    end;
end;
v26 = l_withContext_0({
    Analytics = l_Analytics_0, 
    GeneralServiceController = v16, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v26);
return v3.connect(function(v50, v51) --[[ Line: 227 ]]
    return {
        Material = v51.MaterialMock or v50.MaterialBrowserReducer.Material
    };
end, function(v52) --[[ Line: 231 ]]
    -- upvalues: v19 (copy)
    return {
        dispatchSetMaterialVariant = function(v53) --[[ Line: 233 ]] --[[ Name: dispatchSetMaterialVariant ]]
            -- upvalues: v52 (copy), v19 (ref)
            v52(v19(v53));
        end
    };
end)(v26);