local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_Plugin_0 = v2.Plugin;
local v4 = require(script.Parent.Application);
local v5 = require(l_Parent_0.Parent.Cryo);
local v6 = require(l_Parent_0.Util.React);
local v7 = require(l_Parent_0.Style);
local l_Stylizer_0 = v7.Stylizer;
local l_Colors_0 = v7.Colors;
local l_ComponentSymbols_0 = v7.ComponentSymbols;
local l_StyleKey_0 = v7.StyleKey;
local v12 = require(l_Parent_0.Style.Themes.StudioTheme);
l_Colors_0 = v5.Dictionary.join(l_Colors_0, {
    Yellow = Color3.fromRGB(230, 230, 0), 
    Red = Color3.fromRGB(255, 0, 0), 
    Green = Color3.fromRGB(0, 255, 0)
});
local v13 = l_Plugin_0.new(plugin);
local v14 = v12.new();
v14:extend({
    TextColor3 = l_StyleKey_0.MainText, 
    [l_ComponentSymbols_0.Button] = {
        BackgroundColor = l_StyleKey_0.DialogMainButton, 
        TextColor3 = l_StyleKey_0.Button
    }, 
    [l_ComponentSymbols_0.Box] = {
        BackgroundColor = l_StyleKey_0.Mid
    }, 
    [l_ComponentSymbols_0.Dialog] = {
        BackgroundColor = l_StyleKey_0.MainBackground, 
        ["&Sub"] = {
            BackgroundColor = l_Colors_0.lighter(l_Colors_0.Blue, 0.5), 
            TextColor3 = l_Colors_0.Black
        }
    }, 
    Important = {
        BackgroundColor = l_Colors_0.lighter(l_Colors_0.Red, 0.5), 
        TextColor3 = l_Colors_0.Red
    }
});
return {
    stories = {
        {
            name = "Stylizer", 
            story = function() --[[ Line: 59 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v13 (copy), v14 (copy), v1 (copy), v4 (copy)
                return v2.provide({
                    v13, 
                    v14
                }, {
                    App = v1.createElement(v4)
                });
            end
        }, 
        {
            name = ":use", 
            story = function() --[[ Line: 68 ]] --[[ Name: story ]]
                -- upvalues: v6 (copy), v2 (copy), v13 (copy), v14 (copy), v1 (copy), l_Stylizer_0 (copy)
                assert(v6 ~= "", "Storybook should have non-legacy React");
                return v2.provide({
                    v13, 
                    v14
                }, {
                    v1.createElement(function() --[[ Line: 72 ]]
                        -- upvalues: l_Stylizer_0 (ref), v6 (ref)
                        local v15 = l_Stylizer_0:use("Dialog");
                        return v6.createElement("Frame", {
                            BackgroundColor3 = v15.BackgroundColor, 
                            Size = UDim2.fromOffset(150, 150)
                        });
                    end)
                });
            end
        }
    }
};