local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
return require(l_Parent_0.React).createContext({
    value = nil, 
    onValueChanged = function(_) --[[ Line: 8 ]] --[[ Name: onValueChanged ]]
        warn("No CheckedValueProvider found for RadioGroup");
    end
});