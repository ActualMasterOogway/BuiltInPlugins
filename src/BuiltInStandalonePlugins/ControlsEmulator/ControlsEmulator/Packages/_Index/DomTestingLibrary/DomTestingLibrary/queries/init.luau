local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = {};
l_Object_0.assign(v2, require(script["placeholder-text"]));
l_Object_0.assign(v2, require(script.text));
l_Object_0.assign(v2, require(script["display-value"]));
l_Object_0.assign(v2, require(script["test-id"]));
return v2;