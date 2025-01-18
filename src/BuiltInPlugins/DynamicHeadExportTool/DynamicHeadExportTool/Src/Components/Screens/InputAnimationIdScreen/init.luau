local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local v4 = require(l_script_FirstAncestor_0.Src.Components.FormScreen);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetEnabled);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationId);
local v7 = require(l_script_FirstAncestor_0.Src.Thunks.ProcessMood);
local v8 = v1.PureComponent:extend("InputAnimationIdScreen");
v8.init = function(v9) --[[ Line: 19 ]] --[[ Name: init ]]
    v9.onExpansionChange = function(v10) --[[ Line: 20 ]]
        -- upvalues: v9 (copy)
        v9:setState({
            Expansion = v10
        });
    end;
    v9.onChange = function(v11) --[[ Line: 26 ]]
        -- upvalues: v9 (copy)
        v9:setState({
            Items = v11
        });
    end;
    v9.state = {
        Expansion = {}, 
        Items = {}
    };
end;
v8.didMount = function(v12) --[[ Line: 38 ]] --[[ Name: didMount ]]
    local l_Localization_0 = v12.props.Localization;
    v12:setState({
        Items = {
            {
                Id = "AnimationId", 
                Label = l_Localization_0:getText("Plugin", "AnimationAssetId"), 
                Children = {
                    {
                        Id = "Animation", 
                        Label = l_Localization_0:getText("Plugin", "Animation"), 
                        Schema = {
                            Type = "Text"
                        }, 
                        Value = ""
                    }
                }
            }
        }
    });
end;
v8.render = function(v14) --[[ Line: 61 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy)
    return v1.createElement(v4, {
        Expansion = v14.state.Expansion, 
        Items = v14.state.Items, 
        onExpansionChange = v14.onExpansionChange, 
        onChange = v14.onChange, 
        onSubmit = function() --[[ Line: 67 ]] --[[ Name: onSubmit ]]
            -- upvalues: v14 (copy)
            v14.props.close();
            local v15 = {};
            for _, v17 in v14.state.Items[1].Children do
                v15[v17.Id] = v17.Value;
            end;
            v14.props.setAnimationId(v15.Animation);
            v14.props.processMood();
        end
    });
end;
v8 = l_ContextServices_0.withContext({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Plugin = l_ContextServices_0.Plugin
})(v8);
return v2.connect(function(v18, _) --[[ Line: 87 ]] --[[ Name: mapStateToProps ]]
    return {
        mode = v18.PluginReducer.mode
    };
end, function(v20) --[[ Line: 93 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v5 (copy), v6 (copy), v7 (copy)
    return {
        close = function() --[[ Line: 95 ]] --[[ Name: close ]]
            -- upvalues: v20 (copy), v5 (ref)
            v20(v5(false));
        end, 
        setAnimationId = function(v21) --[[ Line: 98 ]] --[[ Name: setAnimationId ]]
            -- upvalues: v20 (copy), v6 (ref)
            v20(v6(v21));
        end, 
        processMood = function() --[[ Line: 101 ]] --[[ Name: processMood ]]
            -- upvalues: v20 (copy), v7 (ref)
            v20(v7());
        end
    };
end)(v8);