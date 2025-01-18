local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local l_filter_0 = v1.filter;
local l_includes_0 = v1.includes;
local v4 = require(l_Parent_0.Style.StudioThemeFallback);
local v5 = require(l_Parent_0.Styling.createDesign);
local v6 = require(l_Parent_0.Styling.createStyleSheet);
local v7 = require(l_Parent_0.Styling.shouldOrderStyleRulesByInsertion);
local l_Components_0 = l_Parent_0.UI.Components;
local v9 = require(l_Parent_0.Styling.StudioPalette);
local v10 = require(l_Parent_0.Styling.StudioMixins);
local v11 = require(l_Parent_0.Styling.LightThemeTokens);
local v12 = require(l_Parent_0.Styling.DarkThemeTokens);
local v13 = require(l_Parent_0.SharedFlags.getFFlagSelectRendererOnRenderItem)();
local l_StyleRulePriorityOrderRefactor_0 = game:GetFastFlag("StyleRulePriorityOrderRefactor");
local v15 = require(l_Parent_0.Util.getStudioSettings);
local v16 = {
    "Image", 
    "Pane", 
    v13 and "TextLabel" or nil
};
local function v22(v17, v18) --[[ Line: 30 ]] --[[ Name: registerComponent ]]
    local l_styles_0 = v18:FindFirstChild("styles");
    if l_styles_0 then
        local v20 = require(l_styles_0);
        local l_Design_0 = v17:FindFirstChild("Design");
        if l_Design_0 and l_Design_0:IsA("StyleSheet") then
            l_Design_0:InsertStyleRule(v20);
        end;
    end;
end;
return function() --[[ Line: 43 ]] --[[ Name: createStudioDesign ]]
    -- upvalues: v15 (copy), v4 (copy), v5 (copy), v6 (copy), v9 (copy), v11 (copy), v12 (copy), l_Components_0 (copy), l_filter_0 (copy), l_includes_0 (copy), v16 (copy), v22 (copy), v7 (copy), v10 (copy), l_StyleRulePriorityOrderRefactor_0 (copy)
    local v23 = v15();
    local v24 = if v23 then v23.Theme.Name else v4;
    local v25 = v5("StudioDesign");
    local v26 = v6("Palette", {}, v9, {});
    v26.Parent = v25;
    local v27 = {
        Light = v6("Light", {}, v11, {
            v26
        }), 
        Dark = v6("Dark", {}, v12, {
            v26
        })
    };
    for v28, v29 in v27 do
        v29.Parent = v25.Themes;
        v29:SetAttribute("StyleCategory", "Theme");
        if v28 == v24 then
            v25.Design:SetDerives({
                v29
            });
        end;
    end;
    local l_l_Components_0_Children_0 = l_Components_0:GetChildren();
    local v32 = l_filter_0(l_l_Components_0_Children_0, function(v31) --[[ Line: 64 ]]
        -- upvalues: l_includes_0 (ref), v16 (ref)
        return not l_includes_0(v16, v31.Name);
    end);
    table.sort(v32, function(v33, v34) --[[ Line: 67 ]]
        return v33.Name < v34.Name;
    end);
    for _, v36 in v16 do
        v22(v25, l_Components_0:FindFirstChild(v36));
    end;
    for _, v38 in v32 do
        v22(v25, v38);
    end;
    local v39 = nil;
    if not pcall(function() --[[ Line: 78 ]]
        -- upvalues: v39 (ref), v7 (ref), v10 (ref)
        v39 = v7(v10);
    end) then
        error("Zero priorities mixed with non-zero priorities in Studio Mixins");
    end;
    for v40, v41 in v10 do
        if l_StyleRulePriorityOrderRefactor_0 and v39 then
            v41.Priority = v40 - 1;
        end;
        v25.Design:InsertStyleRule(v41);
    end;
    local v42 = nil;
    if v23 ~= nil then
        v42 = v23.ThemeChanged:Connect(function() --[[ Line: 93 ]]
            -- upvalues: v15 (ref), v25 (copy), v27 (copy)
            local v43 = v15();
            if not v43 then
                return;
            else
                local l_Name_0 = v43.Theme.Name;
                v25.Design:SetDerives({
                    v27[l_Name_0]
                });
                return;
            end;
        end);
    end;
    return v25, v42;
end;