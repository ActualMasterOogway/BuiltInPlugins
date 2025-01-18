local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioActions");
local v1 = require(l_script_FirstAncestor_0.Packages.React).PureComponent:extend("MainPlugin");
v1.init = function(v2, _) --[[ Line: 6 ]] --[[ Name: init ]]
    v2.state = {
        enabled = false
    };
end;
v1.render = function(_) --[[ Line: 12 ]] --[[ Name: render ]]
    return nil;
end;
return v1;