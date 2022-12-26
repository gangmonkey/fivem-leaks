RegisterKeyMapping("+trailerAttach", "Attach/Detach Vehicle", "keyboard", "g")
RegisterKeyMapping("+trailerInteract", "Interact with trailer", "keyboard", "e")
RegisterKeyMapping("+trailerWarp", "Get in attached vehicle", "keyboard", "f")

function NotiAtt() -- Attached notification
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(Config.NotiLoadMessage)
    EndTextCommandThefeedPostTicker(true, true)
end

function NotiDet() -- Detached notification
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(Config.NotiUnLoadMessage)
    EndTextCommandThefeedPostTicker(true, true)
end

-- Use this function for job locking. If the job is correct, return true.
-- Please refer to your framework's job system for how to implement, I do not support
-- job checking integration. -Theebu
function allowed()
    return true
end