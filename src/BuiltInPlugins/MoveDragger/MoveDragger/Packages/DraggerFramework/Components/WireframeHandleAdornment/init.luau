local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = v1.PureComponent:extend("WireframeHandleAdornment");
v2.defaultProps = {
    ZIndex = 0, 
    Transparency = 0, 
    AlwaysOnTop = true, 
    Adornee = workspace.Terrain, 
    Scale = Vector3.one, 
    CFrame = CFrame.identity, 
    Color3 = Color3.new(1, 1, 1)
};
v2.init = function(v3) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v3._wireframeRef = v1.createRef();
end;
v2.didMount = function(v4) --[[ Line: 37 ]] --[[ Name: didMount ]]
    v4:_renderGrid();
end;
v2.didUpdate = function(v5) --[[ Line: 41 ]] --[[ Name: didUpdate ]]
    v5:_renderGrid();
end;
v2._renderGrid = function(v6) --[[ Line: 45 ]] --[[ Name: _renderGrid ]]
    local v7 = v6._wireframeRef:getValue();
    v7:Clear();
    v6.props.Render(v7);
end;
v2.render = function(v8) --[[ Line: 51 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v8.props;
    return v1.createElement("WireframeHandleAdornment", {
        AdornCullingMode = Enum.AdornCullingMode.Never, 
        ZIndex = l_props_0.ZIndex, 
        CFrame = l_props_0.CFrame, 
        Transparency = l_props_0.Transparency, 
        AlwaysOnTop = l_props_0.AlwaysOnTop, 
        Adornee = l_props_0.Adornee, 
        Color3 = l_props_0.Color3, 
        Scale = l_props_0.Scale, 
        [v1.Ref] = v8._wireframeRef
    });
end;
return v2;