local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = v2.PureComponent:extend("StandaloneSelectionBox");
v3.init = function(v4) --[[ Line: 19 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v4._dummyPartRef = v2.createRef();
end;
v3.render = function(v5) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: l_CoreGui_0 (copy), v2 (copy)
    local v6 = v5.props.Size:Min((Vector3.new(1, 1, 1, 0)));
    local v7 = v5.props.Size / 2 - v6 / 2;
    local v8 = v5.props.Container or l_CoreGui_0;
    return v2.createElement(v2.Portal, {
        target = v8
    }, {
        DummyModel = v2.createElement("Model", {
            [v2.Ref] = v5._dummyPartRef
        }, {
            DummyPart1 = v2.createElement("Part", {
                Shape = Enum.PartType.Block, 
                Anchored = true, 
                CanCollide = false, 
                CFrame = v5.props.CFrame * CFrame.new(-v7), 
                Size = v6, 
                Transparency = 0
            }), 
            DummyPart2 = v2.createElement("Part", {
                Shape = Enum.PartType.Block, 
                Anchored = true, 
                CanCollide = false, 
                CFrame = v5.props.CFrame * CFrame.new(v7), 
                Size = v6, 
                Transparency = 0
            })
        }), 
        SelectionBox = v2.createElement("SelectionBox", {
            Adornee = v5._dummyPartRef, 
            Color3 = v5.props.Color, 
            LineThickness = v5.props.LineThickness, 
            SurfaceTransparency = 1, 
            Transparency = 0, 
            StudioSelectionBox = true
        })
    });
end;
return v3;