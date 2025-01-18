local l_Parent_0 = script.Parent.Parent;
local l_StylingService_0 = game:GetService("StylingService");
local v2 = require(script.Parent.createStudioDesign);
local v3 = require(l_Parent_0.Util.getStudioSettings);
local function v11(v4, v5) --[[ Line: 8 ]] --[[ Name: getThemes ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 9 ]]
        -- upvalues: v4 (copy)
        return require(v4.Src.Resources.PluginStylesLightTheme);
    end);
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 13 ]]
        -- upvalues: v4 (copy)
        return require(v4.Src.Resources.PluginStylesDarkTheme);
    end);
    local v10 = {};
    if l_status_0 then
        l_result_0:SetDerives({
            v5
        });
        v10.Light = l_result_0;
    end;
    if l_status_1 then
        l_result_1:SetDerives({
            v5
        });
        v10.Dark = l_result_1;
    end;
    return v10;
end;
return function(v12, v13, v14) --[[ Line: 32 ]] --[[ Name: registerPluginStyles ]]
    -- upvalues: v3 (copy), l_StylingService_0 (copy), v2 (copy), v11 (copy)
    local v15 = v3();
    local v16 = if v15 then v15.Theme.Name else "Dark";
    local l_StudioDesign_0 = l_StylingService_0:FindFirstChild("StudioDesign");
    if not l_StudioDesign_0 then
        l_StudioDesign_0 = v2();
        l_StudioDesign_0.Parent = l_StylingService_0;
    end;
    if not v13 then
        v13 = v12:FindFirstChildWhichIsA("Folder");
    end;
    local l_Name_0 = v13.Name;
    local l_l_StylingService_0_FirstChild_0 = l_StylingService_0:FindFirstChild(l_Name_0);
    if l_l_StylingService_0_FirstChild_0 then
        l_l_StylingService_0_FirstChild_0.Parent = nil;
    end;
    l_l_StylingService_0_FirstChild_0 = require(v13.Src.Resources.PluginStyles);
    local v20 = v11(v13, l_StudioDesign_0.Design);
    local l_Descendants_0 = v13.Src.Components:GetDescendants();
    for _, v23 in pairs(l_Descendants_0) do
        if v23:IsA("ModuleScript") and v23.Name == "styles" then
            l_l_StylingService_0_FirstChild_0:InsertStyleRule(require(v23));
        end;
    end;
    local v24 = {};
    if v20[v16] ~= nil then
        table.insert(v24, v20[v16]);
    end;
    table.insert(v24, l_StudioDesign_0.Design);
    if not v14 then
        v14 = l_StylingService_0;
    end;
    l_l_StylingService_0_FirstChild_0:SetDerives(v24);
    l_l_StylingService_0_FirstChild_0.Parent = v14;
    local v25 = nil;
    if v15 ~= nil then
        v25 = v15.ThemeChanged:Connect(function() --[[ Line: 82 ]]
            -- upvalues: v3 (ref), v20 (copy), l_StudioDesign_0 (ref), l_l_StylingService_0_FirstChild_0 (ref)
            local v26 = v3();
            if not v26 then
                return;
            else
                local l_Name_1 = v26.Theme.Name;
                local v28 = {};
                if v20[l_Name_1] ~= nil then
                    table.insert(v28, v20[l_Name_1]);
                end;
                table.insert(v28, l_StudioDesign_0.Design);
                l_l_StylingService_0_FirstChild_0:SetDerives(v28);
                return;
            end;
        end);
    end;
    return l_l_StylingService_0_FirstChild_0, v25;
end;