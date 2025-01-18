local function _(v0) --[[ Line: 1 ]] --[[ Name: assetify ]]
    if string.match(v0, "^%d+$") then
        return string.format("rbxassetid://%s", v0);
    else
        return v0;
    end;
end;
return function(v2) --[[ Line: 8 ]] --[[ Name: createSurfaceAppearance ]]
    local l_PluginReducer_0 = v2:getState().PluginReducer;
    local l_colorMap_0 = l_PluginReducer_0.colorMap;
    local l_metalnessMap_0 = l_PluginReducer_0.metalnessMap;
    local l_normalMap_0 = l_PluginReducer_0.normalMap;
    local l_roughnessMap_0 = l_PluginReducer_0.roughnessMap;
    if l_colorMap_0 == "" and l_metalnessMap_0 == "" and l_normalMap_0 == "" and l_roughnessMap_0 == "" then
        return nil;
    else
        local l_SurfaceAppearance_0 = Instance.new("SurfaceAppearance");
        l_SurfaceAppearance_0.ColorMap = if string.match(l_colorMap_0, "^%d+$") then string.format("rbxassetid://%s", l_colorMap_0) else l_colorMap_0;
        l_SurfaceAppearance_0.MetalnessMap = if string.match(l_metalnessMap_0, "^%d+$") then string.format("rbxassetid://%s", l_metalnessMap_0) else l_metalnessMap_0;
        l_SurfaceAppearance_0.NormalMap = if string.match(l_normalMap_0, "^%d+$") then string.format("rbxassetid://%s", l_normalMap_0) else l_normalMap_0;
        l_SurfaceAppearance_0.RoughnessMap = if string.match(l_roughnessMap_0, "^%d+$") then string.format("rbxassetid://%s", l_roughnessMap_0) else l_roughnessMap_0;
        return l_SurfaceAppearance_0;
    end;
end;