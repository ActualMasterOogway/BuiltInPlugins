local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_Localization_0 = v2.ContextServices.Localization;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v6 = require(l_Components_0.GenerationCard);
local l_Hooks_0 = l_script_FirstAncestor_0.Src.Hooks;
local v8 = require(l_Hooks_0.useSelectedMeshParts);
local l_UI_0 = v2.UI;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Pane_0 = l_UI_0.Pane;
local v12 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v13 = require(l_script_FirstAncestor_0.Src.Util.createHashFromMeshParts);
local v14 = require(l_script_FirstAncestor_0.Src.Util.GenerationsContext);
local v15 = require(l_script_FirstAncestor_0.Src.Util.sort);
local function v28(v16, v17, v18) --[[ Line: 25 ]] --[[ Name: createGenerationCards ]]
    -- upvalues: v15 (copy), v1 (copy), v12 (copy), v3 (copy), v6 (copy)
    local l_generations_0 = v16.generations;
    local v20 = {};
    local v24 = v15(v1.keys(l_generations_0), function(v21) --[[ Line: 29 ]]
        -- upvalues: l_generations_0 (copy), v12 (ref)
        local v22 = l_generations_0[v21];
        local l_layoutOrder_0 = l_generations_0[v21].layoutOrder;
        if v22.status == v12.STATUS.PENDING then
            return 1;
        elseif v22.status == v12.STATUS.FAILED then
            return 2;
        else
            return l_layoutOrder_0;
        end;
    end);
    for v25, v26 in l_generations_0 do
        if v26.status ~= v12.STATUS.COMPLETED or not v17 or (not v16.modelToGenerations[v17] or table.find(v16.modelToGenerations[v17], v25)) and (next(v18) == nil or v16.modelToGenerations[v17]) then
            local v27 = table.find(v24, v25);
            assert(v27 ~= nil, "Can't find generation id in sorted list");
            v20[v25] = v3.createElement(v6, {
                Generation = v26, 
                LayoutOrder = v27
            });
        end;
    end;
    return v20;
end;
return function(v29) --[[ Line: 62 ]] --[[ Name: Generations ]]
    -- upvalues: l_Localization_0 (copy), v8 (copy), v13 (copy), v3 (copy), v14 (copy), v28 (copy), l_ExpandablePane_0 (copy), l_Pane_0 (copy)
    local v30 = l_Localization_0:use();
    local v31 = v8();
    local v32 = v13(v31);
    local v33 = v3.useContext(v14);
    local v34 = v28(v33, v32, v31);
    local v35 = if next(v31) == nil then v30:getText("Generations", "TitleAll") else v30:getText("Generations", "TitleSelected");
    v3.useEffect(function() --[[ Line: 75 ]]
        -- upvalues: v31 (copy), v33 (copy)
        if next(v31) == nil then
            v33.setSelected(nil);
        end;
    end, {
        v31, 
        v33.setSelected
    });
    return v3.createElement(l_ExpandablePane_0, {
        AlwaysExpanded = true, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = v29.LayoutOrder, 
        Style = "Section", 
        Text = v35, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        GenerationsPane = v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = UDim.new(0, 4), 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, v34)
    });
end;