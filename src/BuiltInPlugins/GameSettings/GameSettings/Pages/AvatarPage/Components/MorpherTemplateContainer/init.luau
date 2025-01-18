local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_0.Components.MorpherTemplate);
local v4 = v2.Component:extend("ComponentMorpherTemplateContainer");
v4.init = function(v5) --[[ Line: 9 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v5.frameRef = v2.createRef();
end;
v4.render = function(v6) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v8 = {
        UIListLayoutVertical = v2.createElement("UIListLayout", {
            [v2.Change.AbsoluteContentSize] = function(v7) --[[ Line: 17 ]]
                -- upvalues: v6 (copy)
                v6.frameRef.current.Size = UDim2.new(1, 0, 0, v7.AbsoluteContentSize.y);
            end
        })
    };
    if v6.props.StateTemplates and v6.props.StateTemplates.templates then
        for v9, _ in pairs(v6.props.StateTemplates.templates) do
            v8[tostring(v9)] = v2.createElement(v3, {
                ThemeData = v6.props.ThemeData, 
                template = v9, 
                StateTemplates = v6.props.StateTemplates, 
                IsEnabled = v6.props.IsEnabled, 
                IsGameShutdownRequired = v6.props.IsGameShutdownRequired, 
                AssetOverrideErrors = v6.props.AssetOverrideErrors, 
                Mouse = v6.props.Mouse, 
                IsPlacePublished = v6.props.IsPlacePublished, 
                clobberTemplate = v6.props.clobberTemplate
            });
            break;
        end;
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        [v2.Ref] = v6.frameRef
    }, v8);
end;
return v4;