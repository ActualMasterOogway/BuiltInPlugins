local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_script_FirstAncestor_0.Utility.Flags);
local v5 = require(l_script_FirstAncestor_0.Enums.Theme);
local v6 = require(l_script_FirstAncestor_0.Enums.Device);
local v7 = require(l_script_FirstAncestor_0.StyleSheet);
local v8 = require(l_Parent_0.TokensContext);
local v9 = require(l_Parent_0.Tokens);
local v10 = require(l_Parent_0.TagsContext);
local v11 = require(l_Parent_0.RulesContext);
local v12 = require(l_Parent_0.useTagsState);
local v13 = require(l_Parent_0.VariantsContext);
local v14 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v15 = require(l_script_FirstAncestor_0.Utility.useGeneratedRules);
local l_getTokens_0 = v9.getTokens;
local v17 = {
    theme = v5.Dark, 
    device = v6.Desktop
};
return function(v18) --[[ Line: 40 ]] --[[ Name: StyleProvider ]]
    -- upvalues: v14 (copy), v17 (copy), v12 (copy), v13 (copy), v3 (copy), l_getTokens_0 (copy), v4 (copy), v15 (copy), v8 (copy), v11 (copy), v10 (copy), v7 (copy)
    local v19 = v14({
        theme = v18.theme, 
        device = v18.device
    }, v17);
    local v20, v21 = v12();
    local v22 = v13.useVariantsState();
    local v23 = v3.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: l_getTokens_0 (ref), v19 (copy), v18 (copy)
        return l_getTokens_0(v19.device, v19.theme, v18.DONOTUSE_colorUpdate);
    end, {
        v19.device, 
        v19.theme, 
        v18.DONOTUSE_colorUpdate
    });
    local v24 = if v4.FoundationStylingPolyfill then v15(v19.theme, v19.device, v18.DONOTUSE_colorUpdate == true) else nil;
    return v3.createElement(v8.Provider, {
        value = v23
    }, {
        VariantsContext = v3.createElement(v13.Provider, {
            value = v22
        }, if v4.FoundationStylingPolyfill then {
            RulesContext = v3.createElement(v11.Provider, {
                value = v24
            }, v18.children)
        } else {
            TagsContext = v3.createElement(v10.Provider, {
                value = v21
            }, v18.children), 
            StyleSheet = v3.createElement(v7, {
                theme = v19.theme, 
                device = v19.device, 
                tags = v20, 
                derives = v18.derives, 
                DONOTUSE_colorUpdate = v18.DONOTUSE_colorUpdate
            })
        })
    });
end;