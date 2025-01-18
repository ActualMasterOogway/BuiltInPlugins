local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Rodux).createReducer("", {
    SetMessage = function(_, v2) --[[ Line: 5 ]] --[[ Name: SetMessage ]]
        return v2.message;
    end
});