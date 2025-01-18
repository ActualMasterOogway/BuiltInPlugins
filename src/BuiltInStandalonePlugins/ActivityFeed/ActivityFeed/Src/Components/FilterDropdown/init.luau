local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.ReactUtils);
local v3 = require(l_Parent_0.Packages.Framework);
local l_joinTags_0 = v3.Styling.joinTags;
local l_useToggleState_0 = v2.useToggleState;
local v6 = v3.Util.LayoutOrderIterator.new();
local l_DropdownMenu_0 = v3.UI.DropdownMenu;
return function(v8) --[[ Line: 23 ]] --[[ Name: FilterDropdown ]]
    -- upvalues: v1 (copy), l_useToggleState_0 (copy), l_joinTags_0 (copy), v6 (copy), l_DropdownMenu_0 (copy)
    local v9, v10 = v1.useState(false);
    local v11 = l_useToggleState_0();
    local v12, v13 = v1.useState(Vector2.new(0, 0));
    local v14 = v1.useMemo(function() --[[ Line: 30 ]]
        -- upvalues: v12 (copy)
        return v12.X;
    end, {
        v12
    });
    local v18 = v1.useMemo(function() --[[ Line: 34 ]]
        -- upvalues: v8 (copy)
        local v15 = {};
        for v16, v17 in pairs(v8.items) do
            v15[v17] = v16;
        end;
        return v15;
    end, {
        v8.items
    });
    local v22 = v1.useMemo(function() --[[ Line: 42 ]]
        -- upvalues: v8 (copy)
        local v19 = {};
        for _, v21 in pairs(v8.items) do
            table.insert(v19, v21);
        end;
        return v19;
    end, {
        v8.items
    });
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("Component-FilterDropdown", v11.enabled and "ContentHovered" or nil), 
        [v1.Event.MouseEnter] = v11.enable, 
        [v1.Event.MouseLeave] = v11.disable, 
        [v1.Change.AbsoluteSize] = function(v23) --[[ Line: 67 ]]
            -- upvalues: v13 (copy)
            v13(v23.AbsoluteSize);
        end, 
        LayoutOrder = v8.layoutOrder
    }, {
        Content = v1.createElement("TextButton", {
            [v1.Tag] = l_joinTags_0("X-Row", "CX-Invisible"), 
            [v1.Event.Activated] = function() --[[ Line: 59 ]]
                -- upvalues: v10 (copy)
                v10(true);
            end, 
            Text = ""
        }, {
            Selected = v1.createElement("TextLabel", {
                [v1.Tag] = l_joinTags_0("X-Fit", "CX-Invisible"), 
                Text = v22[v8.selectedItemIndex], 
                LayoutOrder = v6:getNextOrder()
            }), 
            DropdownIconContainer = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("CX-Invisible"), 
                LayoutOrder = v6:getNextOrder()
            }, {
                DropdownIcon = v1.createElement("ImageLabel", {})
            })
        }), 
        Menu = v1.createElement(l_DropdownMenu_0, {
            Items = v22, 
            Width = v14, 
            Hide = not v9, 
            OnItemActivated = function(v24, _) --[[ Line: 50 ]]
                -- upvalues: v10 (copy), v8 (copy), v18 (copy)
                v10(false);
                v8.onChanged(v18[v24]);
            end, 
            OnFocusLost = function() --[[ Line: 55 ]]
                -- upvalues: v10 (copy)
                v10(false);
            end
        })
    });
end;