local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return {
    PluginState = {
        Default = "Default", 
        Recording = "Recording", 
        Playing = "Playing", 
        Disabled = "Disabled", 
        ShouldStartPlayback = "ShouldStartPlayback", 
        ShouldStartRecording = "ShouldStartRecording"
    }
};