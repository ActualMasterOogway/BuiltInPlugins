local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_1.Packages.RoactRodux);
local l_RoactStudioWidgets_0 = l_Parent_1.Packages.RoactStudioWidgets;
local v5 = require(l_Parent_0.Actions.TemplatesAdd);
local v6 = require(l_Parent_0.Actions.TemplatesClobberTemplate);
local v7 = require(l_Parent_0.Components.AvatarUpdater);
local v8 = require(l_Parent_0.Components.MorpherTemplateContainer);
local v9 = require(l_RoactStudioWidgets_0.StyledScrollingFrame);
local v10 = v2.Component:extend("ComponentRootPanel");
v10.init = function(v11) --[[ Line: 16 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v11.canvasRef = v2.createRef();
    v11.contentHeightChanged = function(v12) --[[ Line: 18 ]]
        -- upvalues: v11 (copy)
        local l_current_0 = v11.canvasRef.current;
        if l_current_0 then
            l_current_0.CanvasSize = UDim2.new(1, 0, 0, v12);
        end;
    end;
end;
v10.didMount = function(v14) --[[ Line: 26 ]] --[[ Name: didMount ]]
    v14.props.addTemplates();
end;
v10.render = function(v15) --[[ Line: 30 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v9 (copy), v8 (copy), v7 (copy)
    return v2.createElement(v9, {
        [v2.Ref] = v15.canvasRef
    }, {
        v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            MorpherTemplateContainer = v2.createElement(v8, {
                ThemeData = v15.props.StateTheme, 
                StateTemplates = v15.props.StateTemplates, 
                IsEnabled = true, 
                Mouse = v15.props.Mouse, 
                clobberTemplate = v15.props.clobberTemplate, 
                ContentHeightChanged = v15.contentHeightChanged
            }), 
            RigUpdater = if game:GetFastFlag("DisableGameSettingsAvatarPreview") then nil else v2.createElement(v7, {
                StateTemplates = v15.props.StateTemplates
            })
        })
    });
end;
return (v3.UNSTABLE_connect2(function(v16, _) --[[ Line: 57 ]]
    return {
        StateTemplates = v16.MorpherEditorRoot.StateMorpher.StateTemplates, 
        StateTheme = v16.MorpherEditorRoot.StateMorpher.StateTheme
    };
end, function(v18) --[[ Line: 62 ]]
    -- upvalues: v5 (copy), v6 (copy)
    return {
        addTemplates = function() --[[ Line: 64 ]] --[[ Name: addTemplates ]]
            -- upvalues: v18 (copy), v5 (ref)
            return v18(v5());
        end, 
        clobberTemplate = function(v19, v20) --[[ Line: 68 ]] --[[ Name: clobberTemplate ]]
            -- upvalues: v18 (copy), v6 (ref)
            v18(v6(v19, v20));
        end
    };
end)(v10));