local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local _ = require(l_Parent_0.Src.Types);
local l_withContext_0 = v3.ContextServices.withContext;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_prioritize_0 = v3.Util.prioritize;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local v11 = require(l_Parent_0.Src.Flags);
local l_getFFlagBetterMaterialManagerPreviews_0 = v11.getFFlagBetterMaterialManagerPreviews;
local l_getFFlagEnableSkyForMetalBalls_0 = v11.getFFlagEnableSkyForMetalBalls;
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v16 = require(l_Controllers_0.GeneralServiceController);
local v17 = require(l_Controllers_0.MaterialServiceController);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v19 = require(l_Constants_0.getMaterialColor);
local v20 = require(l_Constants_0.BASE_MATERIALS_WITH_METALNESS);
local v21 = v1.Component:extend("MaterialPreview");
v21.defaultProps = {
    InitialDistance = 6.3, 
    Material = Enum.Material.Plastic
};
v21.shouldUpdate = function(v22, v23) --[[ Line: 70 ]] --[[ Name: shouldUpdate ]]
    if v23.MaterialWrapper ~= v22.props.MaterialWrapper or v23.MaterialOverride ~= v22.props.MaterialOverride or v23.MaterialOverrides ~= v22.props.MaterialOverrides or v23.Use2022Materials ~= v22.props.Use2022Materials then
        return true;
    else
        return false;
    end;
end;
v21.render = function(v24) --[[ Line: 83 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_getFFlagBetterMaterialManagerPreviews_0 (copy), v19 (copy), v20 (copy), l_AssetRenderModel_0 (copy), l_prioritize_0 (copy), l_getFFlagEnableSkyForMetalBalls_0 (copy)
    local l_props_0 = v24.props;
    local l_MaterialPreview_0 = l_props_0.Stylizer.MaterialPreview;
    local l_MaterialWrapper_0 = l_props_0.MaterialWrapper;
    if not l_MaterialWrapper_0 then
        return v1.createElement(l_Pane_0, {
            BackgroundColor = l_props_0.BackgroundColor, 
            Position = l_props_0.Position, 
            Size = l_props_0.Size, 
            LayoutOrder = l_props_0.LayoutOrder
        });
    else
        local v28 = if l_MaterialWrapper_0.MaterialVariant then l_MaterialWrapper_0.MaterialVariant.Name else nil;
        local l_Material_0 = l_MaterialWrapper_0.Material;
        if not v24.materialModel then
            v24.materialModel = l_props_0.GeneralServiceController:LoadLocalAsset("rbxasset://models/MaterialManager/smooth_material_model.rbxm");
        end;
        v24.model = v24.materialModel:Clone();
        v24.model.MeshPart.Material = l_Material_0;
        if l_getFFlagBetterMaterialManagerPreviews_0() then
            v24.model.MeshPart.CFrame = CFrame.Angles(0, 0.7853981633974483, 0) * CFrame.Angles(0.7853981633974483, 0, 0);
        end;
        if v28 then
            v24.model.MeshPart.MaterialVariant = v28;
        elseif l_props_0.MaterialOverrides and l_props_0.MaterialOverride and l_props_0.MaterialServiceController:hasDefaultMaterial(l_Material_0, l_props_0.MaterialOverrides[l_props_0.MaterialOverride]) then
            v24.model.MeshPart.Color = v19(l_Material_0, l_props_0.Use2022Materials) or Color3.fromRGB(163, 162, 165);
        end;
        local v30 = if l_props_0.Hover then l_MaterialPreview_0.BackgroundColorHover else l_MaterialPreview_0.BackgroundColor;
        local v31 = v20[l_Material_0] and not v28;
        return v1.createElement(l_Pane_0, {
            BackgroundColor = l_props_0.BackgroundColor, 
            Position = l_props_0.Position, 
            Size = l_props_0.Size, 
            LayoutOrder = l_props_0.LayoutOrder
        }, {
            AssetRenderModel = v1.createElement(l_AssetRenderModel_0, {
                Ambient = l_MaterialPreview_0.Ambient, 
                BackgroundColor3 = l_prioritize_0(l_props_0.BackgroundColor, v30), 
                DisablePan = true, 
                DisableZoom = l_props_0.DisableZoom, 
                EnableSky = if l_getFFlagEnableSkyForMetalBalls_0() then v31 else nil, 
                InitialDistance = l_props_0.InitialDistance, 
                LightColor = l_MaterialPreview_0.LightColor, 
                LightDirection = l_MaterialPreview_0.LightDirection, 
                Model = v24.model, 
                Size = UDim2.fromScale(1, 1), 
                Static = l_props_0.Static
            })
        });
    end;
end;
v21 = l_withContext_0({
    MaterialServiceController = v17, 
    GeneralServiceController = v16, 
    Stylizer = l_Stylizer_0
})(v21);
return v2.connect(function(v32, v33) --[[ Line: 159 ]]
    return {
        MaterialWrapper = if v33.MaterialVariant then v32.MaterialBrowserReducer.Materials[v33.MaterialVariant] else v32.MaterialBrowserReducer.Materials[v33.Material], 
        MaterialOverride = if not v33.MaterialVariant then v32.MaterialBrowserReducer.MaterialOverride[v33.Material] else nil, 
        MaterialOverrides = if not v33.MaterialVariant then v32.MaterialBrowserReducer.MaterialOverrides[v33.Material] else nil, 
        Use2022Materials = v32.MaterialBrowserReducer.Use2022Materials
    };
end, function(_) --[[ Line: 172 ]]
    return {};
end)(v21);