local v0 = require(script.Parent.Parent.Parent.Cryo);
local v1 = require(script.Parent.Parent.Parent.Roact);
local v2 = require(script.Parent.SceneView);
local v3 = {
    keepVisitedScreensMounted = false
};
local v4 = v1.Component:extend("SwitchView");
v4.getDerivedStateFromProps = function(v5, v6) --[[ Line: 11 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v0 (copy), v3 (copy)
    local l_state_0 = v5.navigation.state;
    local l_key_0 = l_state_0.routes[l_state_0.index].key;
    local l_descriptors_0 = v5.descriptors;
    local l_keepVisitedScreensMounted_0 = v0.Dictionary.join(v3, v5.navigationConfig or {}).keepVisitedScreensMounted;
    local v11 = {
        [l_key_0] = true
    };
    if l_keepVisitedScreensMounted_0 then
        local l_pairs_0 = pairs;
        local v13 = v6.visitedScreenKeys or {};
        for v14 in l_pairs_0(v13) do
            if l_descriptors_0[v14] ~= nil then
                v11[v14] = true;
            end;
        end;
    end;
    return {
        visitedScreenKeys = v11
    };
end;
v4.render = function(v15) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_state_1 = v15.props.navigation.state;
    local l_screenProps_0 = v15.props.screenProps;
    local l_descriptors_1 = v15.props.descriptors;
    local l_visitedScreenKeys_0 = v15.state.visitedScreenKeys;
    local l_key_1 = l_state_1.routes[l_state_1.index].key;
    local v21 = {};
    for v22, v23 in pairs(l_descriptors_1) do
        local v24 = v22 == l_key_1;
        if l_visitedScreenKeys_0[v22] == true then
            v21["card_" .. v22] = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                BorderSizePixel = 0, 
                Visible = v24
            }, {
                Content = v1.createElement(v2, {
                    component = v23.getComponent(), 
                    navigation = v23.navigation, 
                    screenProps = l_screenProps_0
                })
            });
        end;
    end;
    return v1.createElement("Folder", nil, v21);
end;
return v4;