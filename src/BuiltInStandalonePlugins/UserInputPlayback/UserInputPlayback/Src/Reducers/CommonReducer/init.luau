local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_join_0 = require(l_Parent_0.Packages.Cryo).Dictionary.join;
local _ = require(l_Parent_0.Src.Types);
local v4 = require(l_Parent_0.Src.Util.Enums);
local _ = require(l_Parent_0.Src.Actions.Common.SetPluginState);
local v6 = {
    pluginState = v4.PluginState.Default
};
return v1.createReducer(v6, {
    SetPluginState = function(v7, v8) --[[ Line: 20 ]] --[[ Name: SetPluginState ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v7, {
            pluginState = v8.state
        });
    end
});