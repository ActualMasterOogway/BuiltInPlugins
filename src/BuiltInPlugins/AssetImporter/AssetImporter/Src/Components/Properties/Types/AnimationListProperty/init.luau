local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local v6 = require(l_script_FirstAncestor_0.Src.Utility.getAnimations);
local function v12(v7, v8, v9) --[[ Line: 13 ]] --[[ Name: getSelectedIndex ]]
    for v10, v11 in v9 do
        if tostring(v7) == v11 then
            return table.find(v8, v10);
        end;
    end;
    return 1;
end;
return function(v13) --[[ Line: 22 ]] --[[ Name: AnimationListProperty ]]
    -- upvalues: v6 (copy), v2 (copy), l_Pane_0 (copy), l_SelectInput_0 (copy), v12 (copy)
    local v14 = v6(v13.Instance);
    local v15 = {};
    local v16 = {};
    for _, v18 in pairs(v14) do
        v15[v18.ImportName] = v18.Id;
        table.insert(v16, v18.ImportName);
    end;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = v13.LayoutOrder, 
        Size = v13.Size
    }, {
        WrapperContents = v2.createElement(l_SelectInput_0, {
            OnItemActivated = function(_, v20) --[[ Line: 36 ]] --[[ Name: OnItemActivated ]]
                -- upvalues: v13 (copy), v15 (copy), v16 (copy)
                v13.OnSetItem(v15[v16[v20]]);
            end, 
            Items = v16, 
            SelectedIndex = v12(v13.Value, v16, v15), 
            Focus = v13.Value, 
            TextWrapped = true, 
            Size = UDim2.fromScale(1, 1)
        })
    });
end;