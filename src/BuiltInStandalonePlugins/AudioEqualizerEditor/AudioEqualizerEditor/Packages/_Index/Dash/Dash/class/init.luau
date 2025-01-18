local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local function _(v2) --[[ Line: 32 ]] --[[ Name: throwNotImplemented ]]
    -- upvalues: l_Parent_0 (copy)
    require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v2);
end;
local function v4(v5, v6) --[[ Line: 40 ]] --[[ Name: class ]]
    -- upvalues: v4 (copy), l_Parent_0 (copy)
    v6 = v6 or function() --[[ Line: 41 ]]
        return {};
    end;
    local v7 = {
        name = v5
    };
    v7.new = function(...) --[[ Line: 58 ]] --[[ Name: new ]]
        -- upvalues: v6 (ref), v7 (copy)
        local v8 = v6(...);
        setmetatable(v8, {
            __index = v7, 
            __tostring = v7.toString, 
            __eq = v7.equals, 
            __lt = v7.__lt, 
            __le = v7.__le, 
            __add = v7.__add, 
            __sub = v7.__sub, 
            __mul = v7.__mul, 
            __div = v7.__div, 
            __mod = v7.__mod
        });
        v8.Class = v7;
        v8:_init(...);
        return v8;
    end;
    v7._init = function(_) --[[ Line: 110 ]] --[[ Name: _init ]]

    end;
    v7.isInstance = function(v10) --[[ Line: 130 ]] --[[ Name: isInstance ]]
        -- upvalues: v7 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 131 ]]
            -- upvalues: v10 (copy), v7 (ref)
            local v11 = getmetatable(v10);
            while true do
                if v11 then
                    if v11.__index == v7 then
                        return true;
                    else
                        v11 = getmetatable(v11.__index);
                    end;
                else
                    return false;
                end;
            end;
        end);
        return l_status_0 and l_result_0;
    end;
    v7.extend = function(v14, v15, v16) --[[ Line: 181 ]] --[[ Name: extend ]]
        -- upvalues: v4 (ref), v7 (copy)
        local v17 = v4(v15, v16 or v7.new);
        setmetatable(v17, {
            __index = v14
        });
        return v17;
    end;
    v7.toString = function(v18) --[[ Line: 219 ]] --[[ Name: toString ]]
        return v18.name;
    end;
    v7.equals = function(v19, v20) --[[ Line: 227 ]] --[[ Name: equals ]]
        return (rawequal(v19, v20));
    end;
    v7.__lt = function(_, _) --[[ Line: 235 ]] --[[ Name: __lt ]]
        -- upvalues: v5 (copy), l_Parent_0 (ref)
        local v23 = {
            methodName = "__lt", 
            className = v5
        };
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v23);
    end;
    v7.__le = function(_, _) --[[ Line: 247 ]] --[[ Name: __le ]]
        -- upvalues: v5 (copy), l_Parent_0 (ref)
        local v26 = {
            methodName = "__le", 
            className = v5
        };
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v26);
    end;
    v7.__add = function(_) --[[ Line: 254 ]] --[[ Name: __add ]]
        -- upvalues: v5 (copy), l_Parent_0 (ref)
        local v28 = {
            methodName = "__add", 
            className = v5
        };
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v28);
    end;
    v7.__sub = function(_) --[[ Line: 260 ]] --[[ Name: __sub ]]
        -- upvalues: v5 (copy), l_Parent_0 (ref)
        local v30 = {
            methodName = "__sub", 
            className = v5
        };
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v30);
    end;
    v7.__mul = function(_) --[[ Line: 266 ]] --[[ Name: __mul ]]
        -- upvalues: v5 (copy), l_Parent_0 (ref)
        local v32 = {
            methodName = "__mul", 
            className = v5
        };
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v32);
    end;
    v7.__div = function(_) --[[ Line: 272 ]] --[[ Name: __div ]]
        -- upvalues: v5 (copy), l_Parent_0 (ref)
        local v34 = {
            methodName = "__div", 
            className = v5
        };
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v34);
    end;
    v7.__mod = function(_) --[[ Line: 278 ]] --[[ Name: __mod ]]
        -- upvalues: v5 (copy), l_Parent_0 (ref)
        local v36 = {
            methodName = "__mod", 
            className = v5
        };
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v36);
    end;
    return v7;
end;
return v4;