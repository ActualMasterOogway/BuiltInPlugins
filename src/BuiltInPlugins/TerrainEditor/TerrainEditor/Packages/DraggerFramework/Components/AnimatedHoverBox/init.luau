local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local function _(v4, v5, v6, v7) --[[ Line: 22 ]] --[[ Name: getHoverColorForTime ]]
    return v5:lerp(v4, 0.5 + 0.5 * math.sin(v7 / v6 * 3.141592653589793));
end;
local v9 = v3.PureComponent:extend("AnimatedHoverBox");
v9.init = function(v10, v11) --[[ Line: 29 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy)
    assert(v11.HoverTarget, "Missing required property 'HoverTarget'.");
    assert(v11.SelectColor, "Missing required property 'SelectColor'.");
    assert(v11.HoverColor, "Missing required property 'HoverColor'.");
    assert(v11.LineThickness, "Missing required property 'LineThickness'.");
    assert(v11.SelectionBoxComponent, "Missing required property 'SelectionBoxComponent'.");
    v10:setState({
        currentColor = v11.SelectColor
    });
    v10.shouldAnimate = function() --[[ Line: 40 ]]
        -- upvalues: v11 (copy)
        return v11.AnimatePeriod ~= nil;
    end;
    v10._isMounted = false;
    v10._startTime = 0;
    v10._bindName = "AnimatedHoverBoxUpdate" .. "_" .. l_HttpService_0:GenerateGUID(false);
end;
v9.didMount = function(v12) --[[ Line: 51 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy)
    v12._isMounted = true;
    if v12.shouldAnimate() then
        v12._startTime = tick();
        l_RunService_0:BindToRenderStep(v12._bindName, Enum.RenderPriority.First.Value, function() --[[ Line: 56 ]]
            -- upvalues: v12 (copy)
            if v12._isMounted then
                local v13 = tick() - v12._startTime;
                local l_props_0 = v12.props;
                local v15 = if l_props_0.AnimatePeriod then l_props_0.AnimatePeriod else 0;
                local l_SelectColor_0 = l_props_0.SelectColor;
                local v17 = l_props_0.HoverColor:lerp(l_SelectColor_0, 0.5 + 0.5 * math.sin(v13 / v15 * 3.141592653589793));
                v12:setState({
                    currentColor = v17
                });
            end;
        end);
    end;
end;
v9.willUnmount = function(v18) --[[ Line: 69 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_RunService_0 (copy)
    v18._isMounted = false;
    l_RunService_0:UnbindFromRenderStep(v18._bindName);
end;
v9.render = function(v19) --[[ Line: 75 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    local l_props_1 = v19.props;
    local l_HoverTarget_0 = l_props_1.HoverTarget;
    if not l_HoverTarget_0 then
        return nil;
    else
        local l_Thickness_0 = v19.props.Thickness;
        local v23 = if v19.shouldAnimate() then v19.state.currentColor else l_props_1.HoverColor;
        if l_HoverTarget_0:IsA("PVInstance") then
            return v3.createFragment({
                Outline = if l_props_1.ShowOutline then v3.createElement("Highlight", {
                    Adornee = l_HoverTarget_0, 
                    FillTransparency = 1, 
                    FillColor = v23, 
                    LineThickness = l_props_1.LineThickness, 
                    OutlineTransparency = 0, 
                    OutlineColor = v23, 
                    ReservedId = Enum.ReservedHighlightId.Hover
                }) else nil, 
                BoundingBox = if l_props_1.ShowHoverBox then v3.createElement(v19.props.SelectionBoxComponent, {
                    Adornee = l_HoverTarget_0, 
                    Color3 = v23, 
                    LineThickness = l_Thickness_0, 
                    StudioSelectionBox = true
                }) else nil
            });
        else
            return;
        end;
    end;
end;
return v9;