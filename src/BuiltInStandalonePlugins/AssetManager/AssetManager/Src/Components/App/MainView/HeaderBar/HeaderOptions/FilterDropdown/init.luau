local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_UI_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI;
local l_Pane_0 = l_UI_0.Pane;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local v5 = require(script.DropdownExpandItem);
local v6 = require(script.FlyoutToggleItem);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Shared.MinimalButton);
local l_useState_0 = v1.useState;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v10) --[[ Line: 26 ]] --[[ Name: FilterDropdown ]]
    -- upvalues: l_useState_0 (copy), v1 (copy), v6 (copy), v5 (copy), l_Pane_0 (copy), l_DropdownMenu_0 (copy), v7 (copy)
    local v11, v12 = l_useState_0(false);
    local v13, v14 = l_useState_0(0);
    local function v15() --[[ Line: 29 ]] --[[ Name: expand ]]
        -- upvalues: v12 (copy)
        v12(true);
    end;
    local function v16() --[[ Line: 33 ]] --[[ Name: focusLost ]]
        -- upvalues: v14 (copy), v12 (copy)
        v14(0);
        v12(false);
    end;
    local function v21(v17, v18, _, _) --[[ Line: 38 ]] --[[ Name: onRenderItem ]]
        -- upvalues: v14 (copy), v1 (ref), v6 (ref), v5 (ref), v13 (copy), v16 (copy)
        if v17.Component then
            return v17:Component(v18, function() --[[ Line: 40 ]]
                -- upvalues: v14 (ref), v17 (copy)
                v14(v17.Id);
            end);
        elseif v17.Items == nil then
            return v1.createElement(v6, {
                Item = v17, 
                LayoutOrder = v18
            });
        else
            return v1.createElement(v5, {
                Item = v17, 
                LayoutOrder = v18, 
                Hovered = v13 == v17.Id, 
                OnHover = function() --[[ Line: 58 ]] --[[ Name: OnHover ]]
                    -- upvalues: v14 (ref), v17 (copy)
                    v14(v17.Id);
                end, 
                OnFocusLost = v16
            });
        end;
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v10.LayoutOrder, 
        [v1.Tag] = "FilterDropdown"
    }, {
        Menu = v1.createElement(l_DropdownMenu_0, {
            UseAutoWidth = true, 
            Hide = not v11, 
            OnRenderItem = v21, 
            OnFocusLost = v16, 
            OnItemActivated = function() --[[ Line: 76 ]] --[[ Name: OnItemActivated ]]

            end, 
            Items = v10.Items
        }), 
        Button = v1.createElement(v7, {
            LayoutOrder = v10.LayoutOrder, 
            OnClick = v15, 
            Tooltip = "Filter items", 
            [v1.Tag] = "FilterIcon"
        }, {})
    });
end;