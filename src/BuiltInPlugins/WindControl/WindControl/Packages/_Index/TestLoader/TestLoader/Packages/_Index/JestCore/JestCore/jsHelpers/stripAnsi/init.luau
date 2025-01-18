return function(v0) --[[ Line: 16 ]] --[[ Name: stripAnsi ]]
    return (string.gsub(v0, "[\027\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", ""));
end;