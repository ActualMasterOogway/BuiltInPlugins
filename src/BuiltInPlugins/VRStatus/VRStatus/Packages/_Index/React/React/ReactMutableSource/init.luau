local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Shared);
return function(v2, v3) --[[ Line: 17 ]] --[[ Name: createMutableSource ]]
    local v4 = {
        _getVersion = v3, 
        _source = v2, 
        _workInProgressVersionPrimary = nil, 
        _workInProgressVersionSecondary = nil
    };
    if _G.__DEV__ then
        v4._currentPrimaryRenderer = nil;
        v4._currentSecondaryRenderer = nil;
    end;
    return v4;
end;