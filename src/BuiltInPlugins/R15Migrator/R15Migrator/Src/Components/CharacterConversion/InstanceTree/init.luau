local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v2.ContextServices;
local l_InstanceTreeView_0 = v2.UI.InstanceTreeView;
local v6 = v3.PureComponent:extend("CharacterInstanceTree");
v6.isValidDisplayInstance = function(v7) --[[ Line: 13 ]] --[[ Name: isValidDisplayInstance ]]
    if v7:IsA("Accoutrement") then
        return true;
    elseif v7:IsA("BasePart") then
        return true;
    else
        return false;
    end;
end;
local function v8(v9, v10) --[[ Line: 25 ]] --[[ Name: cloneWithFilter ]]
    -- upvalues: v8 (copy)
    local v11 = {};
    for _, v13 in v9:GetChildren() do
        if v10(v13) then
            v11[#v11 + 1] = v8(v13, v10);
        end;
    end;
    local v14 = v9:Clone();
    v14:ClearAllChildren();
    for _, v16 in v11 do
        v16.Parent = v14;
    end;
    return v14;
end;
v6.getInstanceTreeRoot = function(v17) --[[ Line: 43 ]] --[[ Name: getInstanceTreeRoot ]]
    -- upvalues: v8 (copy), v6 (ref)
    if not v17 then
        return nil;
    else
        return (v8(v17:GetChildren()[1], v6.isValidDisplayInstance));
    end;
end;
v6.init = function(v18) --[[ Line: 54 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v18.instanceTreeRoot = v18.getInstanceTreeRoot(v18.props.Instance);
    v18.state = {
        Expansion = {
            [v18.instanceTreeRoot] = true
        }, 
        Selection = {}
    };
    v18.onSelectionChanged = function(v19) --[[ Line: 64 ]]
        -- upvalues: v18 (copy)
        for v20, v21 in v18.state.Selection do
            if v19[v20] and v21 then
                v19[v20] = false;
            end;
        end;
        v18:setState({
            Selection = v19
        });
        if v18.props.OnSelectionChange then
            v18.props.OnSelectionChange(v19);
        end;
    end;
    v18.onExpansionChanged = function(v22) --[[ Line: 81 ]]
        -- upvalues: v18 (copy), v1 (ref)
        v18:setState({
            Expansion = v1.Dictionary.join(v18.state.Expansion, v22)
        });
    end;
end;
v6.render = function(v23) --[[ Line: 88 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_InstanceTreeView_0 (copy)
    local l_Stylizer_0 = v23.props.Stylizer;
    return v3.createElement(l_InstanceTreeView_0, {
        Size = UDim2.fromScale(1, 1), 
        LayoutOrder = v23.props.LayoutOrder, 
        Instances = {
            v23.instanceTreeRoot
        }, 
        Selection = v23.state.Selection, 
        Expansion = v23.state.Expansion, 
        OnSelectionChange = v23.onSelectionChanged, 
        OnExpansionChange = v23.onExpansionChanged, 
        Style = l_Stylizer_0.CompactNoBorder
    });
end;
v6.didUpdate = function(v25, v26) --[[ Line: 103 ]] --[[ Name: didUpdate ]]
    if v26.Instance ~= v25.props.Instance then
        v25.instanceTreeRoot = v25.getInstanceTreeRoot(v25.props.Instance);
        v25:setState({
            Expansion = {
                [v25.instanceTreeRoot] = true
            }, 
            Selection = {}
        });
        return;
    else
        if v26.Selection ~= v25.props.Selection then
            local v27 = {};
            for v28 in v25.props.Selection do
                local l_FirstChild_0 = v25.instanceTreeRoot:FindFirstChild(v28, true);
                if l_FirstChild_0 then
                    v27[l_FirstChild_0] = true;
                end;
            end;
            v25:setState({
                Selection = v27
            });
        end;
        return;
    end;
end;
v6 = l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v6);
return v6;