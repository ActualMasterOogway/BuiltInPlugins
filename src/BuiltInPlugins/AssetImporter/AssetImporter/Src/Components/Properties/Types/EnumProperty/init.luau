local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_filter_0 = v3.filter;
local v8 = require(l_script_FirstAncestor_0.Src.Utility.DependencyHandler);
local function _(v9) --[[ Line: 16 ]] --[[ Name: getItemsForEnum ]]
    local l_EnumItems_0 = v9.EnumType:GetEnumItems();
    for v11, v12 in ipairs(l_EnumItems_0) do
        l_EnumItems_0[v11] = v12.Name;
    end;
    return l_EnumItems_0;
end;
local function _(v14, v15) --[[ Line: 24 ]] --[[ Name: getSelectedIndex ]]
    for v16, v17 in ipairs(v15) do
        if v17 == v14.Name then
            return v16;
        end;
    end;
    return nil;
end;
return function(v19) --[[ Line: 34 ]] --[[ Name: EnumProperty ]]
    -- upvalues: v8 (copy), l_filter_0 (copy), v2 (copy), l_Pane_0 (copy), l_SelectInput_0 (copy)
    local v20 = false;
    local l_EnumItems_1 = v19.Value.EnumType:GetEnumItems();
    for v22, v23 in ipairs(l_EnumItems_1) do
        l_EnumItems_1[v22] = v23.Name;
    end;
    local l_l_EnumItems_1_0 = l_EnumItems_1;
    local v25 = v8(v19.Name, v19.DependentValues, v19.AssetImportSession);
    l_l_EnumItems_1_0 = l_filter_0(l_l_EnumItems_1_0, function(v26) --[[ Line: 37 ]]
        -- upvalues: v25 (copy)
        if v25 and v25[v26] then
            return false;
        else
            return true;
        end;
    end);
    l_EnumItems_1 = {};
    for v27, v28 in ipairs(l_l_EnumItems_1_0) do
        l_EnumItems_1[v27] = v19.Localization:getText("EnumItem", v28);
    end;
    local l_createElement_0 = v2.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v31 = {
        LayoutOrder = v19.LayoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = v19.Size
    };
    local v32 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_SelectInput_0_0 = l_SelectInput_0;
    local v37 = {
        OnItemActivated = function(_, v36) --[[ Line: 55 ]] --[[ Name: OnItemActivated ]]
            -- upvalues: v19 (copy), l_l_EnumItems_1_0 (ref)
            v19.OnSelectItem(l_l_EnumItems_1_0[v36]);
        end, 
        Items = l_EnumItems_1
    };
    local l_Value_0 = v19.Value;
    local v39;
    for v40, v41 in ipairs(l_l_EnumItems_1_0) do
        if v41 == l_Value_0.Name then
            v39 = v40;
            v20 = true;
        end;
        if v20 then
            break;
        end;
    end;
    if not v20 then
        v39 = nil;
    end;
    v20 = false;
    v37.SelectedIndex = v39;
    v37.Focus = v19.Value.Name;
    v37.Size = UDim2.fromScale(1, 1);
    v37.TextWrapped = true;
    v32.WrapperContents = l_createElement_1(l_l_SelectInput_0_0, v37);
    return l_createElement_0(l_l_Pane_0_0, v31, v32);
end;