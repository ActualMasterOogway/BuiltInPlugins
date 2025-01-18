local v0 = {};
local l_Parent_0 = script.Parent;
local l_default_0 = require(l_Parent_0.CustomConsole).default;
local v3 = setmetatable({}, {
    __index = l_default_0
});
v3.__index = v3;
v3.new = function(...) --[[ Line: 34 ]] --[[ Name: new ]]
    -- upvalues: l_default_0 (copy), v3 (copy)
    return (setmetatable(l_default_0.new(...), v3));
end;
v3.assert = function(_) --[[ Line: 39 ]] --[[ Name: assert ]]

end;
v3.debug = function(_) --[[ Line: 40 ]] --[[ Name: debug ]]

end;
v3.dir = function(_) --[[ Line: 41 ]] --[[ Name: dir ]]

end;
v3.error = function(_) --[[ Line: 42 ]] --[[ Name: error ]]

end;
v3.info = function(_) --[[ Line: 43 ]] --[[ Name: info ]]

end;
v3.log = function(_) --[[ Line: 44 ]] --[[ Name: log ]]

end;
v3.time = function(_) --[[ Line: 45 ]] --[[ Name: time ]]

end;
v3.timeEnd = function(_) --[[ Line: 46 ]] --[[ Name: timeEnd ]]

end;
v3.timeLog = function(_) --[[ Line: 47 ]] --[[ Name: timeLog ]]

end;
v3.trace = function(_) --[[ Line: 48 ]] --[[ Name: trace ]]

end;
v3.warn = function(_) --[[ Line: 49 ]] --[[ Name: warn ]]

end;
v3.group = function(_) --[[ Line: 50 ]] --[[ Name: group ]]

end;
v3.groupCollapsed = function(_) --[[ Line: 51 ]] --[[ Name: groupCollapsed ]]

end;
v3.groupEnd = function(_) --[[ Line: 52 ]] --[[ Name: groupEnd ]]

end;
v0.default = v3;
return v0;