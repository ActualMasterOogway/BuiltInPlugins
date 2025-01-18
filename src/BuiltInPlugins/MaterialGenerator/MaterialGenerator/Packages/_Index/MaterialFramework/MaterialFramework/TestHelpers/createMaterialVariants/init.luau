local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_MaterialService_0 = game:GetService("MaterialService");
local function _() --[[ Line: 8 ]] --[[ Name: getOrCreateFlagstone ]]
    -- upvalues: l_MaterialService_0 (copy)
    local l_Flagstone_0 = l_MaterialService_0:FindFirstChild("Flagstone");
    if l_Flagstone_0 then
        return l_Flagstone_0;
    else
        local l_MaterialVariant_0 = Instance.new("MaterialVariant");
        l_MaterialVariant_0.Name = "Flagstone";
        l_MaterialVariant_0.BaseMaterial = Enum.Material.Pavement;
        l_MaterialVariant_0.StudsPerTile = 8;
        l_MaterialVariant_0.ColorMap = "rbxassetid://9809148719";
        l_MaterialVariant_0.MetalnessMap = "rbxassetid://8602642017";
        l_MaterialVariant_0.NormalMap = "rbxassetid://9809147846";
        l_MaterialVariant_0.RoughnessMap = "rbxassetid://9809147255";
        l_MaterialVariant_0.Archivable = false;
        l_MaterialVariant_0.Parent = l_MaterialService_0;
        return l_MaterialVariant_0;
    end;
end;
local function _() --[[ Line: 27 ]] --[[ Name: getOrCreateWallpaper ]]
    -- upvalues: l_MaterialService_0 (copy)
    local l_Wallpaper_0 = l_MaterialService_0:FindFirstChild("Wallpaper");
    if l_Wallpaper_0 then
        return l_Wallpaper_0;
    else
        local l_MaterialVariant_1 = Instance.new("MaterialVariant");
        l_MaterialVariant_1.Name = "Wallpaper";
        l_MaterialVariant_1.BaseMaterial = Enum.Material.Wood;
        l_MaterialVariant_1.StudsPerTile = 4;
        l_MaterialVariant_1.ColorMap = "rbxassetid://8602640896";
        l_MaterialVariant_1.MetalnessMap = "rbxassetid://8474851245";
        l_MaterialVariant_1.NormalMap = "rbxassetid://8602641773";
        l_MaterialVariant_1.RoughnessMap = "rbxassetid://8602641137";
        l_MaterialVariant_1.Archivable = false;
        l_MaterialVariant_1.Parent = l_MaterialService_0;
        return l_MaterialVariant_1;
    end;
end;
return function() --[[ Line: 46 ]]
    -- upvalues: l_MaterialService_0 (copy)
    local v14 = {};
    local l_Flagstone_1 = l_MaterialService_0:FindFirstChild("Flagstone");
    local v16;
    if l_Flagstone_1 then
        v16 = l_Flagstone_1;
    else
        local l_MaterialVariant_2 = Instance.new("MaterialVariant");
        l_MaterialVariant_2.Name = "Flagstone";
        l_MaterialVariant_2.BaseMaterial = Enum.Material.Pavement;
        l_MaterialVariant_2.StudsPerTile = 8;
        l_MaterialVariant_2.ColorMap = "rbxassetid://9809148719";
        l_MaterialVariant_2.MetalnessMap = "rbxassetid://8602642017";
        l_MaterialVariant_2.NormalMap = "rbxassetid://9809147846";
        l_MaterialVariant_2.RoughnessMap = "rbxassetid://9809147255";
        l_MaterialVariant_2.Archivable = false;
        l_MaterialVariant_2.Parent = l_MaterialService_0;
        v16 = l_MaterialVariant_2;
    end;
    local l_Wallpaper_1 = l_MaterialService_0:FindFirstChild("Wallpaper");
    if l_Wallpaper_1 then
        l_Flagstone_1 = l_Wallpaper_1;
    else
        local l_MaterialVariant_3 = Instance.new("MaterialVariant");
        l_MaterialVariant_3.Name = "Wallpaper";
        l_MaterialVariant_3.BaseMaterial = Enum.Material.Wood;
        l_MaterialVariant_3.StudsPerTile = 4;
        l_MaterialVariant_3.ColorMap = "rbxassetid://8602640896";
        l_MaterialVariant_3.MetalnessMap = "rbxassetid://8474851245";
        l_MaterialVariant_3.NormalMap = "rbxassetid://8602641773";
        l_MaterialVariant_3.RoughnessMap = "rbxassetid://8602641137";
        l_MaterialVariant_3.Archivable = false;
        l_MaterialVariant_3.Parent = l_MaterialService_0;
        l_Flagstone_1 = l_MaterialVariant_3;
    end;
    v6(v14, 1, v16, l_Flagstone_1);
    return v14;
end;