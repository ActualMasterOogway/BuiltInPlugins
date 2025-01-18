local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Framework);
local v3 = require(l_Parent_0.React);
local l_ContextServices_0 = v2.ContextServices;
local l_DocParser_0 = v2.Util.Typecheck.DocParser;
local v6 = require(l_script_FirstAncestor_0.Hooks.useStyleSheet);
return {
    name = "Viewport Tooling Framework", 
    exclude = {
        "_Index"
    }, 
    storyRoots = {
        l_script_FirstAncestor_0
    }, 
    mapStory = function(v7) --[[ Line: 14 ]] --[[ Name: StoryMiddleware ]]
        -- upvalues: v6 (copy), l_ContextServices_0 (copy), v2 (copy), v3 (copy)
        return function(v8) --[[ Line: 15 ]]
            -- upvalues: v6 (ref), l_ContextServices_0 (ref), v2 (ref), v3 (ref), v7 (copy)
            local v9 = v6();
            return l_ContextServices_0.provide({
                l_ContextServices_0.Focus.new(v8.focus), 
                l_ContextServices_0.Mouse.new(v8.plugin:GetMouse()), 
                v2.Style.ThemeSwitcher.new()
            }, {
                Story = v3.createElement(v3.Fragment, {}, {
                    Story = v3.createElement(v7, v8), 
                    StyleLink = v3.createElement("StyleLink", {
                        StyleSheet = v9
                    })
                })
            });
        end;
    end, 
    mapDefinition = function(v10) --[[ Line: 39 ]] --[[ Name: mapDefinition ]]
        -- upvalues: l_DocParser_0 (copy)
        local v11 = l_DocParser_0.new(v10.name, v10.source.Parent);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 41 ]]
            -- upvalues: v11 (copy)
            return v11:parse();
        end);
        if l_status_0 then
            v10.docs = l_result_0;
            v10.summary = l_result_0.Summary;
        end;
        return v10;
    end
};