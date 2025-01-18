local l_Parent_0 = script.Parent.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = {};
l_Object_0.assign(v2, require(script.Parent.Parent.matches));
l_Object_0.assign(v2, require(script.Parent.Parent["get-node-text"]));
l_Object_0.assign(v2, require(script.Parent.Parent["query-helpers"]));
l_Object_0.assign(v2, require(script.Parent.Parent.config));
return v2;