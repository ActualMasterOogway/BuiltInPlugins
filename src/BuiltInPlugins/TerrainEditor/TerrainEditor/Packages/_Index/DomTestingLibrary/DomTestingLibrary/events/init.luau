local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local v5 = require(script.Parent.jsHelpers.dispatchEvent);
local v6 = {};
local l_getConfig_0 = require(script.Parent.config).getConfig;
local _ = require(script.Parent.helpers).getWindowFromNode;
local v9 = require(script.Parent["event-map"]);
local l_eventMap_0 = v9.eventMap;
local _ = v9.eventAliasMap;
local v16 = setmetatable({}, {
    __call = function(_, v13, v14, v15) --[[ Line: 20 ]] --[[ Name: _fireEvent ]]
        -- upvalues: l_getConfig_0 (copy), l_Error_0 (copy), v5 (copy)
        return l_getConfig_0().eventWrapper(function() --[[ Line: 21 ]]
            -- upvalues: v14 (copy), l_Error_0 (ref), v13 (copy), v5 (ref), v15 (copy)
            if not v14 then
                error(l_Error_0.new("Unable to fire an event - please provide an event object."));
            end;
            if not v13 then
                error(l_Error_0.new(("Unable to fire a \"%s\" event - please provide an Instance."):format(v14)));
            end;
            return v5(v13, v14, v15);
        end);
    end
});
l_Array_0.forEach(l_Object_0.keys(l_eventMap_0), function(v17) --[[ Line: 106 ]]
    -- upvalues: v16 (copy)
    v16[v17] = function(v18, v19) --[[ Line: 118 ]]
        -- upvalues: v16 (ref), v17 (copy)
        return v16(v18, v17, v19);
    end;
end);
v6.fireEvent = v16;
return v6;