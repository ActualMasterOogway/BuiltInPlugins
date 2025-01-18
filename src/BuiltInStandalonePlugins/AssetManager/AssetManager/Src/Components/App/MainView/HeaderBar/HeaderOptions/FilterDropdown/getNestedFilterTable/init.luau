local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(script.Parent.ResetFilters);
local l_GetTextSize_0 = v2.Util.GetTextSize;
local v5 = require(l_script_FirstAncestor_0.Src.Types);
local _ = function(v6) --[[ Line: 16 ]] --[[ Name: getMaxTextWidth ]]
    -- upvalues: l_GetTextSize_0 (copy)
    local v7 = 0;
    for _, v9 in v6 do
        v7 = math.max(v7, l_GetTextSize_0(v9).X);
    end;
    return v7;
end;
return function(v11, v12) --[[ Line: 24 ]]
    -- upvalues: v5 (copy), l_GetTextSize_0 (copy), v1 (copy), v3 (copy)
    local v13 = {};
    local v14 = 0;
    local function _() --[[ Line: 27 ]] --[[ Name: getId ]]
        -- upvalues: v14 (ref)
        v14 = v14 + 1;
        return v14;
    end;
    local v16 = v12:getText("AssetProperty", v5.AssetInfoField.AssetType);
    local v17 = v12:getText("AssetProperty", v5.AssetInfoField.Creator);
    local v18 = {
        v16, 
        v17, 
        (v12:getText("Filters", "ResetFilters"))
    };
    local v19 = 0;
    for _, v21 in v18 do
        v19 = math.max(v19, l_GetTextSize_0(v21).X);
    end;
    local l_v19_0 = v19;
    v18 = {};
    v14 = v14 + 1;
    v18.Id = v14;
    v18.Text = v16;
    v18.Width = l_v19_0;
    v18.Items = {};
    v19 = v5.getEnumAsList(v5.AssetType);
    local v23 = 0;
    for _, v25 in v19 do
        v23 = math.max(v23, l_GetTextSize_0(v25).X);
    end;
    local l_v23_0 = v23;
    for _, v28 in v19 do
        local l_Items_0 = v18.Items;
        local v30 = {};
        v14 = v14 + 1;
        v30.Id = v14;
        v30.Text = v12:getText("AssetType", v28);
        v30.Width = l_v23_0;
        v30.OnClick = function() --[[ Line: 50 ]] --[[ Name: OnClick ]]
            -- upvalues: v11 (copy), v5 (ref), v28 (copy)
            v11:toggleFilter(v5.AssetInfoField.AssetType, v28);
        end;
        v30.Enabled = v11:hasFilter(v5.AssetInfoField.AssetType, v28);
        table.insert(l_Items_0, v30);
    end;
    v23 = {};
    v14 = v14 + 1;
    v23.Id = v14;
    v23.Text = v17;
    v23.Width = l_v19_0;
    v23.Items = {};
    local v31 = v11:getCreators();
    local v32 = 0;
    for _, v34 in v31 do
        v32 = math.max(v32, l_GetTextSize_0(v34).X);
    end;
    local l_v32_0 = v32;
    for _, v37 in v31 do
        local l_Items_1 = v23.Items;
        local v39 = {};
        v14 = v14 + 1;
        v39.Id = v14;
        v39.Text = v37;
        v39.Width = l_v32_0;
        v39.OnClick = function() --[[ Line: 70 ]] --[[ Name: OnClick ]]
            -- upvalues: v11 (copy), v5 (ref), v37 (copy)
            v11:toggleFilter(v5.AssetInfoField.Creator, v37);
        end;
        v39.Enabled = v11:hasFilter(v5.AssetInfoField.Creator, v37);
        table.insert(l_Items_1, v39);
    end;
    table.insert(v13, v18);
    table.insert(v13, v23);
    local v40 = {};
    v14 = v14 + 1;
    v40.Id = v14;
    v40.Text = "Reset";
    v40.Width = l_v19_0;
    v40.Component = function(v41, v42, v43) --[[ Line: 83 ]] --[[ Name: Component ]]
        -- upvalues: v1 (ref), v3 (ref)
        return v1.createElement(v3, {
            Item = v41, 
            LayoutOrder = v42, 
            OnHover = v43
        });
    end;
    table.insert(v13, v40);
    return v13;
end;