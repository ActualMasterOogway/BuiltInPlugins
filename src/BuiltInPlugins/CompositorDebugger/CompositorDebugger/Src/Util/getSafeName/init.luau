local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v2) --[[ Line: 6 ]]
    return v2.name or v2.linkData and v2.linkData.key or v2.index and string.format("[%d]", v2.index) or v2.className and string.format("[%s]", v2.className);
end;