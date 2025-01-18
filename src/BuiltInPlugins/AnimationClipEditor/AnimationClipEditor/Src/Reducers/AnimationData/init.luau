local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
return require(l_script_FirstAncestor_0.Packages.Rodux).createReducer(nil, {
    SetAnimationData = function(_, v2) --[[ Line: 5 ]] --[[ Name: SetAnimationData ]]
        return v2.animationData;
    end
});