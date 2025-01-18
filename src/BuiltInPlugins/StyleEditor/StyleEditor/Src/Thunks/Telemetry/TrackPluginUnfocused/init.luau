local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v2 = require(l_Actions_0.SessionStats.PluginFocusEnd);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function() --[[ Line: 19 ]] --[[ Name: TrackPluginUnfocused ]]
    -- upvalues: v2 (copy)
    return function(v6, _) --[[ Line: 20 ]]
        -- upvalues: v2 (ref)
        local v8 = os.time();
        v6:dispatch(v2(v8));
    end;
end;