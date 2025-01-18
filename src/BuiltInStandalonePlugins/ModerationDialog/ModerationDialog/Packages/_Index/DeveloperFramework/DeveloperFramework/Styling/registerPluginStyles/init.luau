local l_Parent_0 = script.Parent.Parent;
local l_StylingService_0 = game:GetService("StylingService");
local v2 = require(script.Parent.createStudioDesign);
local v3 = require(l_Parent_0.Util.getStudioSettings);
local v4 = require(l_Parent_0.Style.StudioThemeFallback);
local function v12(v5, v6) --[[ Line: 9 ]] --[[ Name: getThemes ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 10 ]]
        -- upvalues: v5 (copy)
        return require(v5.Src.Resources.PluginStylesLightTheme);
    end);
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 14 ]]
        -- upvalues: v5 (copy)
        return require(v5.Src.Resources.PluginStylesDarkTheme);
    end);
    local v11 = {};
    if l_status_0 then
        l_result_0:SetDerives({
            v6
        });
        v11.Light = l_result_0;
    end;
    if l_status_1 then
        l_result_1:SetDerives({
            v6
        });
        v11.Dark = l_result_1;
    end;
    return v11;
end;
return function(v13, v14, v15) --[[ Line: 33 ]] --[[ Name: registerPluginStyles ]]
    -- upvalues: v3 (copy), v4 (copy), l_StylingService_0 (copy), v2 (copy), v12 (copy)
    local v16 = v3();
    local v17 = if v16 then v16.Theme.Name else v4;
    local l_StudioDesign_0 = l_StylingService_0:FindFirstChild("StudioDesign");
    if not l_StudioDesign_0 then
        l_StudioDesign_0 = v2();
        l_StudioDesign_0.Parent = l_StylingService_0;
    end;
    if not v14 then
        v14 = v13:FindFirstChildWhichIsA("Folder");
    end;
    local l_Name_0 = v14.Name;
    local l_l_StylingService_0_FirstChild_0 = l_StylingService_0:FindFirstChild(l_Name_0);
    if l_l_StylingService_0_FirstChild_0 then
        l_l_StylingService_0_FirstChild_0.Parent = nil;
    end;
    l_l_StylingService_0_FirstChild_0 = require(v14.Src.Resources.PluginStyles);
    local v21 = v12(v14, l_StudioDesign_0.Design);
    local l_Descendants_0 = v14.Src.Components:GetDescendants();
    for _, v24 in pairs(l_Descendants_0) do
        if v24:IsA("ModuleScript") and v24.Name == "styles" then
            l_l_StylingService_0_FirstChild_0:InsertStyleRule(require(v24));
        end;
    end;
    local v25 = {};
    if v21[v17] ~= nil then
        table.insert(v25, v21[v17]);
    end;
    table.insert(v25, l_StudioDesign_0.Design);
    if not v15 then
        v15 = l_StylingService_0;
    end;
    l_l_StylingService_0_FirstChild_0:SetDerives(v25);
    l_l_StylingService_0_FirstChild_0.Parent = v15;
    local v26 = nil;
    if v16 ~= nil then
        v26 = v16.ThemeChanged:Connect(function() --[[ Line: 83 ]]
            -- upvalues: v3 (ref), v21 (copy), l_StudioDesign_0 (ref), l_l_StylingService_0_FirstChild_0 (ref)
            local v27 = v3();
            if not v27 then
                return;
            else
                local l_Name_1 = v27.Theme.Name;
                local v29 = {};
                if v21[l_Name_1] ~= nil then
                    table.insert(v29, v21[l_Name_1]);
                end;
                table.insert(v29, l_StudioDesign_0.Design);
                l_l_StylingService_0_FirstChild_0:SetDerives(v29);
                return;
            end;
        end);
    end;
    return l_l_StylingService_0_FirstChild_0, v26;
end;