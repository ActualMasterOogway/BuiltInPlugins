local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_withContext_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.withContext;
local v3 = require(l_script_FirstAncestor_0.Src.Controllers.CalloutController);
local v4 = v1.PureComponent:extend("TeachingCallout");
v4.init = function(v5) --[[ Line: 14 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v5.targetRef = v1.createRef();
end;
v4.didMount = function(v6) --[[ Line: 18 ]] --[[ Name: didMount ]]
    v6._isMounted = true;
    spawn(function() --[[ Line: 25 ]]
        -- upvalues: v6 (copy)
        if not v6._isMounted or not v6.targetRef or not v6.targetRef.current then
            return;
        else
            v6._attachedDefinitionId = v6.props.DefinitionId;
            v6.props.CalloutController:attachCallout(v6._attachedDefinitionId, v6.props.LocationId, v6.targetRef.current);
            return;
        end;
    end);
end;
v4.willUnmount = function(v7) --[[ Line: 39 ]] --[[ Name: willUnmount ]]
    v7._isMounted = false;
    if v7._attachedDefinitionId then
        v7.props.CalloutController:detachCalloutsByDefinitionId(v7._attachedDefinitionId);
    end;
end;
v4.render = function(v8) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local v9 = v8.props.Offset or Vector2.new(0, 0);
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, v9.X, 0, v9.Y), 
        Size = UDim2.new(1, 0, 1, 0), 
        [v1.Ref] = v8.targetRef
    });
end;
return (l_withContext_0({
    CalloutController = v3
})(v4));