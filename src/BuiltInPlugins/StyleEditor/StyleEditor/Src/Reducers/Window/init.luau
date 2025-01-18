local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Dash);
local l_join_0 = v2.join;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.Window.DeselectItem);
local v6 = require(l_Actions_0.Window.SelectItem);
local v7 = require(l_Actions_0.Window.SetDesignSheet);
local v8 = require(l_Actions_0.Window.SetIsDirty);
local v9 = require(l_Actions_0.Window.SetItemsExpanded);
local v10 = require(l_Actions_0.Window.SetRootRoute);
local v11 = require(l_Actions_0.Window.SetSearch);
local v12 = {
    DesignSheet = nil, 
    IsDirty = false, 
    SearchTerm = "", 
    RootRoute = "Onboarding", 
    SelectedItemId = nil, 
    ExpandedItems = {}
};
return v1.createReducer(v12, {
    [v7.name] = function(v13, v14) --[[ Line: 36 ]]
        -- upvalues: v2 (copy), l_join_0 (copy)
        local v15 = if v13.DesignSheet ~= v14.designSheet then v2.None else v13.SelectedItemId;
        return l_join_0(v13, {
            DesignSheet = v14.designSheet, 
            SelectItem = v15
        });
    end, 
    [v8.name] = function(v16, v17) --[[ Line: 45 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v16, {
            IsDirty = v17.isDirty
        });
    end, 
    [v11.name] = function(v18, v19) --[[ Line: 51 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v18, {
            SearchTerm = v19.searchTerm
        });
    end, 
    [v10.name] = function(v20, v21) --[[ Line: 57 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v20, {
            RootRoute = v21.route
        });
    end, 
    [v6.name] = function(v22, v23) --[[ Line: 63 ]]
        -- upvalues: l_join_0 (copy), v2 (copy)
        if not v23.itemId then
            return l_join_0(v22, {
                SelectedItemId = v2.None
            });
        else
            local v24 = v22.SelectedItemId == v23.itemId;
            local v25 = v22.ExpandedItems[v23.itemId] or false;
            return l_join_0(v22, {
                SelectedItemId = v23.itemId, 
                ExpandedItems = l_join_0(v22.ExpandedItems, {
                    [v23.itemId] = not v24 or not v25
                })
            });
        end;
    end, 
    [v5.name] = function(v26, v27) --[[ Line: 81 ]]
        -- upvalues: l_join_0 (copy), v2 (copy)
        if v26.SelectedItemId ~= v27.itemId then
            return v26;
        else
            return l_join_0(v26, {
                SelectedItemId = v2.None
            });
        end;
    end, 
    [v9.name] = function(v28, v29) --[[ Line: 91 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v28, {
            ExpandedItems = l_join_0(v28.ExpandedItems, v29.expandedItems)
        });
    end
});