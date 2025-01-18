local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.RigIK);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_Workspace_0 = game:GetService("Workspace");
local v6 = v1.PureComponent:extend("R15IKRig");
v6.buildConstraints = function(v7) --[[ Line: 19 ]] --[[ Name: buildConstraints ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v8 = v2.buildR15Constraints(v7.props.RootInstance);
    local v9 = {};
    for v10, v11 in pairs(v8) do
        v9[v10] = v1.createElement(v11.Type, v11.Props);
    end;
    return v9;
end;
v6.init = function(_) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: l_Workspace_0 (copy), v4 (copy)
    local l_l_Workspace_0_FirstChild_0 = l_Workspace_0:FindFirstChild(v4.TEMPORARY_CONSTRAINTS);
    if l_l_Workspace_0_FirstChild_0 then
        l_l_Workspace_0_FirstChild_0:Destroy();
    end;
end;
v6.render = function(v14) --[[ Line: 35 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Workspace_0 (copy), v4 (copy)
    return v1.createElement(v1.Portal, {
        target = l_Workspace_0
    }, {
        [v4.TEMPORARY_CONSTRAINTS] = v1.createElement("Folder", {}, v14:buildConstraints())
    });
end;
return v6;