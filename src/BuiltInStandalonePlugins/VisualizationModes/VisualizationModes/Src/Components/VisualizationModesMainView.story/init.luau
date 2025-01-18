local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Model.VisualizationModeCombinerClient);
local v4 = require(l_script_FirstAncestor_0.Src.Model.Tracking.VisualizationModeServiceTracker);
local v5 = require(l_script_FirstAncestor_0.Src.Components.VisualizationModesMainView);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useSizeCalculator);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useVisualizationModeCombiner);
local l_Pane_0 = v1.UI.Pane;
return {
    name = "VisualizationModesMainView", 
    summary = "Renders the main visualization modes view with all sections and controls", 
    stories = {
        {
            name = "VisualizationModesMainView", 
            story = function(v9) --[[ Line: 19 ]] --[[ Name: Story ]]
                -- upvalues: v1 (copy), l_script_FirstAncestor_0 (copy), v7 (copy), v2 (copy), v4 (copy), v3 (copy), v6 (copy), l_Pane_0 (copy), v5 (copy)
                local v10 = v1.Styling.registerPluginStyles(v9.plugin, l_script_FirstAncestor_0);
                local v11 = v7();
                local v12 = v2.useState(function() --[[ Line: 24 ]]
                    -- upvalues: v4 (ref)
                    return v4.new();
                end);
                local v13 = v2.useState(function() --[[ Line: 27 ]]
                    -- upvalues: v3 (ref), v9 (copy), v12 (copy)
                    return v3.new(v9.plugin, v12);
                end);
                v2.useEffect(function() --[[ Line: 30 ]]
                    -- upvalues: v12 (copy), v13 (copy)
                    return function() --[[ Line: 31 ]]
                        -- upvalues: v12 (ref), v13 (ref)
                        v12:destroy();
                        v13:destroy();
                    end;
                end, {});
                local v14 = v6({
                    Width = 325, 
                    HeaderHeight = 32, 
                    MaxHeight = 400, 
                    InnerPadding = 5, 
                    Padding = Vector2.zero
                });
                return v2.createElement(l_Pane_0, {
                    [v2.Tag] = "X-Fill X-Column X-Top", 
                    Size = UDim2.fromOffset(v14.size.X, v14.size.Y)
                }, {
                    StyleLink = v2.createElement("StyleLink", {
                        StyleSheet = v10
                    }), 
                    VisualizationModesMainView = v2.createElement(v5, {
                        OnVisualizationModeToggle = v11.onVisualizationModeToggle, 
                        OnVisualizationModeCategoryToggle = v11.onVisualizationModeCategoryToggle, 
                        SizeCalculator = v14, 
                        RecentVisualizationModes = v11.state.recentModes, 
                        VisualizationModeCategories = v11.state.categories
                    })
                });
            end
        }
    }
};