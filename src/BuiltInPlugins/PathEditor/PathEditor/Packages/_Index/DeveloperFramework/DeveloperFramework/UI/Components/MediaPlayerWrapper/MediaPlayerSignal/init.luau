local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
return require(l_Parent_0.Util.enumerate)("MediaPlayerSignal", {
    PLAY = "PLAY", 
    PAUSE = "PAUSE", 
    SET_TIME = "SET_TIME"
});