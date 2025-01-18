local l_Parent_0 = script.Parent.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 10 ]]
    assert(v1 >= 0, "Duration should not be negative");
    return {
        currentRecordingDurationSec = v1
    };
end);