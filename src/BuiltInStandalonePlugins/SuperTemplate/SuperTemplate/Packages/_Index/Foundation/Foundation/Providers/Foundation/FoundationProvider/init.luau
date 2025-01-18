local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Preferences.PreferencesProvider);
local v4 = require(l_Parent_0.Style.StyleProvider);
local v5 = require(l_Parent_0.Cursor);
local v6 = require(l_Parent_0.Overlay);
return function(v7) --[[ Line: 19 ]] --[[ Name: FoundationProvider ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v6 (copy), v5 (copy)
    local v8 = if v7.preferences then v7.preferences else {};
    return v2.createElement(v3, v8, {
        StyleProvider = v2.createElement(v4, {
            theme = v7.theme, 
            device = v7.device, 
            derives = v7.derives, 
            DONOTUSE_colorUpdate = v7.DONOTUSE_colorUpdate
        }, {
            OverlayProvider = v2.createElement(v6, {
                gui = v7.overlayGui
            }, {
                CursorProvider = v2.createElement(v5, nil, v7.children)
            })
        })
    });
end;