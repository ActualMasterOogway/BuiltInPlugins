local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utility.Signal);
local v2 = {};
v2.__index = v2;
local v3 = 0;
v2.new = function(v4) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (ref)
    local v5 = setmetatable({
        _selectionObject = v4, 
        _selection = v4:Get(), 
        _isSettingSelection = false, 
        _destroyed = false
    }, v2);
    v5.onSelectionExternallyChanged = v1.new();
    v5._selectionChangedConnection = v4.SelectionChanged:Connect(function() --[[ Line: 28 ]]
        -- upvalues: v5 (copy)
        v5:_handleSelectionChanged();
    end);
    v3 = v3 + 1;
    if v3 > 1 then
        warn("More than one SelectionWrapper created at once, this is probably a mistake!");
    end;
    return v5;
end;
v2.get = function(v6) --[[ Line: 40 ]] --[[ Name: get ]]
    return v6._selection;
end;
v2.set = function(v7, v8, v9) --[[ Line: 44 ]] --[[ Name: set ]]
    v7._selection = v8;
    v7._isSettingSelection = true;
    v7._selectionObject:Set(v8, v9);
    v7._isSettingSelection = false;
end;
v2.destroy = function(v10) --[[ Line: 51 ]] --[[ Name: destroy ]]
    -- upvalues: v3 (ref)
    assert(not v10._destroyed);
    v10._selectionChangedConnection:Disconnect();
    v3 = v3 - 1;
    v10._destroyed = true;
end;
v2.flush = function(v11) --[[ Line: 58 ]] --[[ Name: flush ]]
    v11._selectionObject:flush();
end;
v2._handleSelectionChanged = function(v12) --[[ Line: 62 ]] --[[ Name: _handleSelectionChanged ]]
    if not v12._isSettingSelection then
        v12._selection = v12._selectionObject:Get();
        v12.onSelectionExternallyChanged:Fire();
    end;
end;
v2.getActiveSelectable = function(v13) --[[ Line: 69 ]] --[[ Name: getActiveSelectable ]]
    return v13._selection[#v13._selection];
end;
return v2;