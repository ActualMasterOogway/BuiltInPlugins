local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.MainReducer);
return function() --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.Store.new(v2, nil, {
        v1.thunkMiddleware
    });
end;