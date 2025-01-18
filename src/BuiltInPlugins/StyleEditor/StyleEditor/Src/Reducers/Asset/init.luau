local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local _ = require(l_Parent_0.Src.Types);
local l_Asset_0 = l_Parent_0.Src.Actions.Asset;
local v5 = require(l_Asset_0.SaveFontMetadata);
local v6 = {
    Fonts = {}
};
return v1.createReducer(v6, {
    [v5.name] = function(v7, v8) --[[ Line: 24 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v7, {
            Fonts = l_join_0(v7.Fonts, v8.metadata)
        });
    end
});