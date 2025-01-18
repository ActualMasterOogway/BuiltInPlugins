local _ = require(script.Parent.types.actions);
return function(v1, v2) --[[ Line: 10 ]] --[[ Name: makeActionCreator ]]
    assert(type(v1) == "string", "Bad argument #1: Expected a string name for the action creator");
    assert(type(v2) == "function", "Bad argument #2: Expected a function that creates action objects");
    return (setmetatable({
        name = v1
    }, {
        __call = function(_, ...) --[[ Line: 21 ]] --[[ Name: __call ]]
            -- upvalues: v2 (copy), v1 (copy)
            local v4 = v2(...);
            assert(type(v4) == "table", "Invalid action: An action creator must return a table");
            v4.type = v1;
            return v4;
        end
    }));
end;