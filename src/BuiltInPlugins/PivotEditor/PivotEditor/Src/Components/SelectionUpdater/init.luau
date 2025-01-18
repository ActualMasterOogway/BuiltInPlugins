local l_Parent_0 = script.Parent.Parent.Parent;
local l_Selection_0 = game:GetService("Selection");
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Src.Utility.StatusMessage);
local function _(v4) --[[ Line: 9 ]] --[[ Name: isValidTarget ]]
    return v4 and v4:IsA("PVInstance") and v4 ~= workspace and v4 ~= workspace.Terrain;
end;
local v6 = v2.PureComponent:extend("SelectionUpdater");
v6.init = function(v7) --[[ Line: 15 ]] --[[ Name: init ]]
    assert(v7.props.selectObjectForEditing, "selectObjectForEditing is required");
    assert(v7.props.selectInvalidSelection, "selectInvalidSelection is required");
end;
v6.didMount = function(v8) --[[ Line: 20 ]] --[[ Name: didMount ]]
    -- upvalues: l_Selection_0 (copy)
    v8._connection = l_Selection_0.SelectionChanged:Connect(function() --[[ Line: 21 ]]
        -- upvalues: v8 (copy)
        v8:_update();
    end);
    v8:_update();
end;
v6.willUnmount = function(v9) --[[ Line: 27 ]] --[[ Name: willUnmount ]]
    v9._connection:Disconnect();
end;
v6.render = function(_) --[[ Line: 31 ]] --[[ Name: render ]]

end;
v6._update = function(v11) --[[ Line: 33 ]] --[[ Name: _update ]]
    -- upvalues: l_Selection_0 (copy), v3 (copy)
    local v12 = l_Selection_0:Get();
    if #v12 == 1 then
        local v13 = v12[1];
        if v11.props.targetObject ~= v13 then
            if v13 and v13:IsA("PVInstance") and v13 ~= workspace and v13 ~= workspace.Terrain then
                v11.props.selectObjectForEditing(v13);
                return;
            else
                v11.props.selectInvalidSelection(v3.InvalidTarget);
                return;
            end;
        end;
    elseif #v12 > 1 then
        v11.props.selectInvalidSelection(v3.MultipleSelection);
        return;
    else
        v11.props.selectInvalidSelection(v3.NoSelection);
    end;
end;
return v6;