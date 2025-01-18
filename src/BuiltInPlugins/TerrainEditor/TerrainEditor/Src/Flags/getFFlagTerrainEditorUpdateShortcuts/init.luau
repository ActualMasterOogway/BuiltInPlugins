game:DefineFastFlag("TerrainEditorUpdateShortcuts2", false);
game:DefineFastFlag("DraggerImprovements", false);
return function() --[[ Line: 4 ]]
    return game:GetFastFlag("TerrainEditorUpdateShortcuts2") and game:GetFastFlag("DraggerImprovements");
end;