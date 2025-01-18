local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.Typecheck);
local v2 = require(script.Parent.MediaPlayerWrapper)((require(script.Parent.StatelessAudioPlayer)));
v1.wrap(v2, script);
return v2;