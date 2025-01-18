local _ = script:FindFirstAncestor("AnimationClipEditor");
return require(script.Parent.Action)(script.Name, function(v1) --[[ Line: 11 ]]
    return {
        selectedTracks = v1 or {}
    };
end);