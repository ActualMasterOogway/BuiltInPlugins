local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local l_filter_0 = v1.filter;
local l_includes_0 = v1.includes;
local v4 = require(l_Parent_0.Styling.createDesign);
local v5 = require(l_Parent_0.Styling.createStyleSheet);
local v6 = require(l_Parent_0.Styling.shouldOrderStyleRulesByInsertion);
local l_Components_0 = l_Parent_0.UI.Components;
local v8 = require(l_Parent_0.Styling.StudioPalette);
local v9 = require(l_Parent_0.Styling.StudioMixins);
local v10 = require(l_Parent_0.Styling.LightThemeTokens);
local v11 = require(l_Parent_0.Styling.DarkThemeTokens);
local v12 = require(l_Parent_0.SharedFlags.getFFlagSelectRendererOnRenderItem)();
local l_StyleRulePriorityOrderRefactor_0 = game:GetFastFlag("StyleRulePriorityOrderRefactor");
local v14 = require(l_Parent_0.Util.getStudioSettings);
local v15 = {
    "Image", 
    "Pane", 
    v12 and "TextLabel" or nil
};
local function v21(v16, v17) --[[ Line: 29 ]] --[[ Name: registerComponent ]]
    local l_styles_0 = v17:FindFirstChild("styles");
    if l_styles_0 then
        local v19 = require(l_styles_0);
        local l_Design_0 = v16:FindFirstChild("Design");
        if l_Design_0 and l_Design_0:IsA("StyleSheet") then
            l_Design_0:InsertStyleRule(v19);
        end;
    end;
end;
return function() --[[ Line: 42 ]] --[[ Name: createStudioDesign ]]
    -- upvalues: v14 (copy), v4 (copy), v5 (copy), v8 (copy), v10 (copy), v11 (copy), l_Components_0 (copy), l_filter_0 (copy), l_includes_0 (copy), v15 (copy), v21 (copy), v6 (copy), v9 (copy), l_StyleRulePriorityOrderRefactor_0 (copy)
    local v22 = v14();
    local v23 = if v22 then v22.Theme.Name else "Dark";
    local v24 = v4("StudioDesign");
    local v25 = v5("Palette", {}, v8, {});
    v25.Parent = v24;
    local v26 = {
        Light = v5("Light", {}, v10, {
            v25
        }), 
        Dark = v5("Dark", {}, v11, {
            v25
        })
    };
    for v27, v28 in v26 do
        v28.Parent = v24.Themes;
        v28:SetAttribute("StyleCategory", "Theme");
        if v27 == v23 then
            v24.Design:SetDerives({
                v28
            });
        end;
    end;
    local l_l_Components_0_Children_0 = l_Components_0:GetChildren();
    local v31 = l_filter_0(l_l_Components_0_Children_0, function(v30) --[[ Line: 63 ]]
        -- upvalues: l_includes_0 (ref), v15 (ref)
        return not l_includes_0(v15, v30.Name);
    end);
    table.sort(v31, function(v32, v33) --[[ Line: 66 ]]
        return v32.Name < v33.Name;
    end);
    for _, v35 in v15 do
        v21(v24, l_Components_0:FindFirstChild(v35));
    end;
    for _, v37 in v31 do
        v21(v24, v37);
    end;
    local v38 = nil;
    if not pcall(function() --[[ Line: 77 ]]
        -- upvalues: v38 (ref), v6 (ref), v9 (ref)
        v38 = v6(v9);
    end) then
        error("Zero priorities mixed with non-zero priorities in Studio Mixins");
    end;
    for v39, v40 in v9 do
        if l_StyleRulePriorityOrderRefactor_0 and v38 then
            v40.Priority = v39 - 1;
        end;
        v24.Design:InsertStyleRule(v40);
    end;
    local v41 = nil;
    if v22 ~= nil then
        v41 = v22.ThemeChanged:Connect(function() --[[ Line: 92 ]]
            -- upvalues: v14 (ref), v24 (copy), v26 (copy)
            local v42 = v14();
            if not v42 then
                return;
            else
                local l_Name_0 = v42.Theme.Name;
                v24.Design:SetDerives({
                    v26[l_Name_0]
                });
                return;
            end;
        end);
    end;
    return v24, v41;
end;