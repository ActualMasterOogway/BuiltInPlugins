local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.AddHistoryItem);
local v5 = require(l_Actions_0.RemoveHistoryItem);
return v1.createReducer({
    HistoryItems = {}
}, {
    [v4.name] = function(v6, v7) --[[ Line: 16 ]]
        -- upvalues: v2 (copy)
        local v8 = v2.Dictionary.join(v6.HistoryItems, {
            [v7.item.Name] = v7.item
        });
        return v2.Dictionary.join(v6, {
            HistoryItems = v8
        });
    end, 
    [v5.name] = function(v9, v10) --[[ Line: 26 ]]
        -- upvalues: v2 (copy)
        local v11 = v2.Dictionary.join(v9.HistoryItems, {
            [v10.historyItem] = v2.None
        });
        return v2.Dictionary.join(v9, {
            HistoryItems = v11
        });
    end
});