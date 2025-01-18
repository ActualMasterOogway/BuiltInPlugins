local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
return require(l_Parent_0.Packages.Rodux).createReducer({
    IsBusy = false
}, {
    SetIsBusy = function(v2, v3) --[[ Line: 8 ]] --[[ Name: SetIsBusy ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v2, {
            IsBusy = v3.isBusy
        });
    end
});