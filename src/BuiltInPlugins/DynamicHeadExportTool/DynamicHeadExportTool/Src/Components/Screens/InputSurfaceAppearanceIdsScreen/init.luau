local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local v4 = require(l_script_FirstAncestor_0.Src.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Components.FormScreen);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetEnabled);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetSurfaceAppearanceIds);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetScreen);
local v9 = require(l_script_FirstAncestor_0.Src.Thunks.ProcessHead);
local v10 = v1.PureComponent:extend("InputSurfaceAppearanceIdsScreen");
v10.init = function(v11) --[[ Line: 22 ]] --[[ Name: init ]]
    v11.onExpansionChange = function(v12) --[[ Line: 23 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            Expansion = v12
        });
    end;
    v11.onChange = function(v13) --[[ Line: 29 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            Items = v13
        });
    end;
    v11.state = {
        Expansion = {}, 
        Items = {}
    };
end;
v10.didMount = function(v14) --[[ Line: 41 ]] --[[ Name: didMount ]]
    local l_Localization_0 = v14.props.Localization;
    v14:setState({
        Items = {
            {
                Id = "SurfaceAppearanceIds", 
                Label = l_Localization_0:getText("Plugin", "SurfaceAppearanceAssetIds"), 
                Children = {
                    {
                        Id = "ColorMap", 
                        Label = l_Localization_0:getText("Plugin", "ColorMap"), 
                        Schema = {
                            Type = "Text"
                        }, 
                        Value = ""
                    }, 
                    {
                        Id = "MetalnessMap", 
                        Label = l_Localization_0:getText("Plugin", "MetalnessMap"), 
                        Schema = {
                            Type = "Text"
                        }, 
                        Value = ""
                    }, 
                    {
                        Id = "NormalMap", 
                        Label = l_Localization_0:getText("Plugin", "NormalMap"), 
                        Schema = {
                            Type = "Text"
                        }, 
                        Value = ""
                    }, 
                    {
                        Id = "RoughnessMap", 
                        Label = l_Localization_0:getText("Plugin", "RoughnessMap"), 
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
v10.render = function(v16) --[[ Line: 88 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v5 (copy), v4 (copy)
    return v1.createElement(v5, {
        Expansion = v16.state.Expansion, 
        Items = v16.state.Items, 
        onExpansionChange = v16.onExpansionChange, 
        onChange = v16.onChange, 
        onSubmit = function() --[[ Line: 94 ]] --[[ Name: onSubmit ]]
            -- upvalues: v16 (copy), v4 (ref)
            local v17 = {};
            for _, v19 in v16.state.Items[1].Children do
                v17[v19.Id] = v19.Value;
            end;
            v16.props.setSurfaceAppearanceIds(v17.ColorMap, v17.MetalnessMap, v17.NormalMap, v17.RoughnessMap);
            if v16.props.mode == v4.Modes.Head then
                v16.props.close();
                v16.props.processHead();
                return;
            elseif v16.props.mode == v4.Modes.Accessory then
                v16.props.setScreen(v4.Screens.InputAccessoryType);
                return;
            else
                assert(false);
                return;
            end;
        end
    });
end;
v10 = l_ContextServices_0.withContext({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Plugin = l_ContextServices_0.Plugin
})(v10);
return v2.connect(function(v20, _) --[[ Line: 125 ]] --[[ Name: mapStateToProps ]]
    return {
        mode = v20.PluginReducer.mode
    };
end, function(v22) --[[ Line: 131 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v6 (copy), v7 (copy), v9 (copy), v8 (copy)
    return {
        close = function() --[[ Line: 133 ]] --[[ Name: close ]]
            -- upvalues: v22 (copy), v6 (ref)
            v22(v6(false));
        end, 
        setSurfaceAppearanceIds = function(v23, v24, v25, v26) --[[ Line: 136 ]] --[[ Name: setSurfaceAppearanceIds ]]
            -- upvalues: v22 (copy), v7 (ref)
            v22(v7(v23, v24, v25, v26));
        end, 
        processHead = function() --[[ Line: 139 ]] --[[ Name: processHead ]]
            -- upvalues: v22 (copy), v9 (ref)
            v22(v9());
        end, 
        setScreen = function(v27) --[[ Line: 142 ]] --[[ Name: setScreen ]]
            -- upvalues: v22 (copy), v8 (ref)
            v22(v8(v27));
        end
    };
end)(v10);