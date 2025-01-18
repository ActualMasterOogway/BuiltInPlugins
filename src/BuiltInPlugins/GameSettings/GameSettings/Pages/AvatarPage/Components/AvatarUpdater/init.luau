local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_0.Util.LifetimeManagerAvatar);
local v4 = v2.Component:extend("ComponentAvatarUpdater");
v4.applyRigUpdates = function(v5) --[[ Line: 9 ]] --[[ Name: applyRigUpdates ]]
    -- upvalues: v3 (copy)
    if v5.props.StateTemplates and v5.props.StateTemplates.templates then
        v3.apply(v5.props.StateTemplates.templates);
    end;
end;
v4.didMount = function(v6) --[[ Line: 15 ]] --[[ Name: didMount ]]
    v6:applyRigUpdates();
end;
v4.render = function(_) --[[ Line: 19 ]] --[[ Name: render ]]
    return nil;
end;
v4.didUpdate = function(v8) --[[ Line: 23 ]] --[[ Name: didUpdate ]]
    v8:applyRigUpdates();
end;
v4.willUnmount = function(_) --[[ Line: 27 ]] --[[ Name: willUnmount ]]
    -- upvalues: v3 (copy)
    v3:destroy();
end;
return v4;