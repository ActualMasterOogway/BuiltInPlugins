local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Src.Resources.Localization.createLocalization);
local l_DocParser_0 = v2.Util.Typecheck.DocParser;
local l_ContextServices_0 = v2.ContextServices;
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_Pane_0 = v2.UI.Pane;
return {
    name = "Visualization Modes", 
    exclude = {
        "_Index"
    }, 
    storyRoots = {
        l_script_FirstAncestor_0.Src.Stories, 
        l_script_FirstAncestor_0.Src.Components
    }, 
    roact = v3, 
    mapStory = function(v10) --[[ Line: 25 ]] --[[ Name: mapStory ]]
        -- upvalues: v4 (copy), l_ContextServices_0 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy), l_script_FirstAncestor_0 (copy), v1 (copy), l_Pane_0 (copy)
        return function(v11) --[[ Line: 26 ]]
            -- upvalues: v4 (ref), l_ContextServices_0 (ref), l_StudioTheme_0 (ref), l_registerPluginStyles_0 (ref), l_script_FirstAncestor_0 (ref), v1 (ref), l_Pane_0 (ref), v10 (copy)
            local v12 = {
                v4(), 
                l_ContextServices_0.Mouse.new(v11.plugin:GetMouse()), 
                l_ContextServices_0.Plugin.new(v11.plugin), 
                l_StudioTheme_0.new()
            };
            local v13 = l_registerPluginStyles_0(v11.plugin, l_script_FirstAncestor_0);
            return l_ContextServices_0.provide(v12, {
                Wrapper = v1.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    Child = v1.createElement(v10, v11), 
                    StyleLink = v1.createElement("StyleLink", {
                        StyleSheet = v13
                    })
                })
            });
        end;
    end, 
    mapDefinition = function(v14) --[[ Line: 48 ]] --[[ Name: mapDefinition ]]
        -- upvalues: l_DocParser_0 (copy)
        local l_FirstChild_0 = v14.source.Parent:FindFirstChild(v14.name);
        if l_FirstChild_0 then
            local v16 = l_DocParser_0.new(v14.name, l_FirstChild_0);
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 52 ]]
                -- upvalues: v16 (copy)
                return v16:parse();
            end);
            if l_status_0 then
                v14.docs = l_result_0;
                v14.summary = l_result_0.Summary;
            end;
        end;
        return v14;
    end
};