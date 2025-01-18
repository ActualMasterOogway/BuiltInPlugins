local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Signal_0 = v1.Util.Signal;
local v4 = l_ContextItem_0:extend("EditingItemContext");
v4.new = function() --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), l_Signal_0 (copy)
    local v5 = {};
    setmetatable(v5, v4);
    v5.sourceItemChangedSignal = l_Signal_0.new();
    v5.editingItemChangedSignal = l_Signal_0.new();
    return v5;
end;
v4.setSourceItem = function(v6, v7) --[[ Line: 27 ]] --[[ Name: setSourceItem ]]
    v6.item = v7;
    v6.sourceItemChangedSignal:Fire(v7);
end;
v4.setSourceItemWithUniqueDeformerNames = function(v8, v9) --[[ Line: 32 ]] --[[ Name: setSourceItemWithUniqueDeformerNames ]]
    v8.sourceItemWithUniqueDeformerNames = v9;
end;
v4.setEditingItem = function(v10, v11) --[[ Line: 36 ]] --[[ Name: setEditingItem ]]
    v10.editingItem = v11;
    v10.editingItemChangedSignal:Fire(v11);
end;
v4.clear = function(v12) --[[ Line: 41 ]] --[[ Name: clear ]]
    v12.item = nil;
    v12:setEditingItem(nil);
end;
v4.getItem = function(v13) --[[ Line: 46 ]] --[[ Name: getItem ]]
    return v13.editingItem;
end;
v4.getSourceItem = function(v14) --[[ Line: 50 ]] --[[ Name: getSourceItem ]]
    return v14.item;
end;
v4.getSourceItemWithUniqueDeformerNames = function(v15) --[[ Line: 54 ]] --[[ Name: getSourceItemWithUniqueDeformerNames ]]
    return v15.sourceItemWithUniqueDeformerNames;
end;
v4.getSourceItemChangedSignal = function(v16) --[[ Line: 58 ]] --[[ Name: getSourceItemChangedSignal ]]
    return v16.sourceItemChangedSignal;
end;
v4.getEditingItemChangedSignal = function(v17) --[[ Line: 62 ]] --[[ Name: getEditingItemChangedSignal ]]
    return v17.editingItemChangedSignal;
end;
return v4;