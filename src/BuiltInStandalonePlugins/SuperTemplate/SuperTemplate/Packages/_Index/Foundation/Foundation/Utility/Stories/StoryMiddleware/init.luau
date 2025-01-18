local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Providers.Foundation);
local v4 = require(l_script_FirstAncestor_0.Enums.Theme);
local v5 = require(l_script_FirstAncestor_0.Enums.Device);
local v6 = require(l_script_FirstAncestor_0.Providers.Foundation.ColorUpdateStory);
local v7 = {
    Light = v4.Light, 
    Dark = v4.Dark
};
local v8 = {
    Console = v5.Console, 
    Desktop = v5.Desktop
};
return function(v9) --[[ Line: 22 ]] --[[ Name: StoryMiddleware ]]
    -- upvalues: v7 (copy), v2 (copy), v3 (copy), v8 (copy), v6 (copy)
    return function(v10) --[[ Line: 24 ]]
        -- upvalues: v7 (ref), v2 (ref), v3 (ref), v8 (ref), v6 (ref), v9 (copy)
        local v11 = v7[v10.theme];
        return v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10), 
                PaddingBottom = UDim.new(0, 10), 
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10)
            }), 
            FoundationContext = v2.createElement(v3, {
                theme = v11, 
                device = v8[v10.platform], 
                preferences = v10.settings, 
                overlayGui = v10.focus, 
                DONOTUSE_colorUpdate = v6.FoundationColors
            }, {
                Child = v2.createElement(v9, v10)
            })
        });
    end;
end;