local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.MaterialFramework);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.React);
local v5 = require(l_Packages_0.Dev.RoactCompat);
local l_Resources_0 = l_Parent_0.Src.Resources;
local v7 = require(l_Resources_0.MakeTheme);
local l_ContextServices_0 = v3.ContextServices;
local l_DocParser_0 = v3.Util.Typecheck.DocParser;
local l_Focus_0 = l_ContextServices_0.Focus;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_StudioServices_0 = v2.Context.StudioServices;
return {
    name = "Material Generator", 
    exclude = {
        "_Index"
    }, 
    storyRoots = {
        l_Parent_0.Src
    }, 
    roact = v5, 
    mapStory = function(v15) --[[ Line: 27 ]] --[[ Name: mapStory ]]
        -- upvalues: l_Localization_0 (copy), l_Resources_0 (copy), v2 (copy), l_Focus_0 (copy), l_Mouse_0 (copy), l_Plugin_0 (copy), l_StudioServices_0 (copy), v7 (copy), l_ContextServices_0 (copy), v4 (copy)
        local v16 = l_Localization_0.new({
            stringResourceTable = l_Resources_0.Localization.SourceStrings, 
            translationResourceTable = l_Resources_0.Localization.LocalizedStrings, 
            pluginName = "MaterialGenerator", 
            libraries = {
                [v2.Resources.LOCALIZATION_PROJECT_NAME] = {
                    stringResourceTable = v2.Resources.SourceStrings, 
                    translationResourceTable = v2.Resources.LocalizedStrings
                }
            }
        });
        return function(v17) --[[ Line: 41 ]]
            -- upvalues: v16 (copy), l_Focus_0 (ref), l_Mouse_0 (ref), l_Plugin_0 (ref), l_StudioServices_0 (ref), v7 (ref), l_ContextServices_0 (ref), v4 (ref), v15 (copy)
            local v18 = {
                v16, 
                l_Focus_0.new(v17.focus), 
                l_Mouse_0.new(v17.plugin:GetMouse()), 
                l_Plugin_0.new(v17.plugin), 
                l_StudioServices_0.new(), 
                v7()
            };
            return l_ContextServices_0.provide(v18, {
                Child = v4.createElement(v15, v17)
            });
        end;
    end, 
    mapDefinition = function(v19) --[[ Line: 56 ]] --[[ Name: mapDefinition ]]
        -- upvalues: l_DocParser_0 (copy)
        local l_FirstChild_0 = v19.source.Parent:FindFirstChild(v19.name);
        if l_FirstChild_0 then
            local v21 = l_DocParser_0.new(v19.name, l_FirstChild_0);
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 60 ]]
                -- upvalues: v21 (copy)
                return v21:parse();
            end);
            if l_status_0 then
                v19.docs = l_result_0;
                v19.summary = l_result_0.Summary;
            end;
        end;
        return v19;
    end
};