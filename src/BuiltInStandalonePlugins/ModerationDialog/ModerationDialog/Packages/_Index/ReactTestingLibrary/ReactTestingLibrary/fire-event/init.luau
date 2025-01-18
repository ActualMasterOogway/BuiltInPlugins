local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = {};
local l_fireEvent_0 = require(l_Parent_0.DomTestingLibrary).fireEvent;
local v7 = setmetatable({}, {
    __call = function(_, ...) --[[ Line: 17 ]] --[[ Name: _fireEvent ]]
        -- upvalues: l_fireEvent_0 (copy)
        return l_fireEvent_0(...);
    end
});
l_Array_0.forEach(l_Object_0.keys(l_fireEvent_0), function(v8) --[[ Line: 23 ]]
    -- upvalues: v7 (copy), l_fireEvent_0 (copy)
    v7[v8] = function(...) --[[ Line: 24 ]]
        -- upvalues: l_fireEvent_0 (ref), v8 (copy)
        return l_fireEvent_0[v8](...);
    end;
end);
local l_mouseEnter_0 = v7.mouseEnter;
local l_mouseLeave_0 = v7.mouseLeave;
v7.mouseEnter = function(...) --[[ Line: 34 ]]
    -- upvalues: l_mouseEnter_0 (copy), v7 (copy)
    l_mouseEnter_0(...);
    return v7.mouseOver(...);
end;
v7.mouseLeave = function(...) --[[ Line: 38 ]]
    -- upvalues: l_mouseLeave_0 (copy), v7 (copy)
    l_mouseLeave_0(...);
    return v7.mouseOut(...);
end;
local l_pointerEnter_0 = v7.pointerEnter;
local l_pointerLeave_0 = v7.pointerLeave;
v7.pointerEnter = function(...) --[[ Line: 45 ]]
    -- upvalues: l_pointerEnter_0 (copy), v7 (copy)
    l_pointerEnter_0(...);
    return v7.pointerOver(...);
end;
v7.pointerLeave = function(...) --[[ Line: 49 ]]
    -- upvalues: l_pointerLeave_0 (copy), v7 (copy)
    l_pointerLeave_0(...);
    return v7.pointerOut(...);
end;
local l_blur_0 = v7.blur;
local l_focus_0 = v7.focus;
v7.blur = function(...) --[[ Line: 78 ]]
    -- upvalues: v7 (copy), l_blur_0 (copy)
    v7.focusOut(...);
    return l_blur_0(...);
end;
v7.focus = function(...) --[[ Line: 82 ]]
    -- upvalues: v7 (copy), l_focus_0 (copy)
    v7.focusIn(...);
    return l_focus_0(...);
end;
v4.fireEvent = v7;
return v4;