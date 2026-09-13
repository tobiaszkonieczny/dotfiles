-- Monitor layout: laptop panel + external display
hl.monitor({ output = "eDP-1", mode = "1920x1080@60",  position = "0x288",  scale = 1 })
hl.monitor({ output = "DP-1",  mode = "2560x1440@144", position = "1920x0", scale = 1 })

-- External monitor is the main one: workspaces 1-5 are pinned there and
-- migrate back automatically whenever it's unplugged/replugged. The laptop
-- panel keeps a single workspace (6) of its own while docked.
local EXTERNAL = "DP-1"
local LAPTOP = "eDP-1"

for i = 2, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor   = EXTERNAL,
        default   = (i == 1),
    })
end

hl.workspace_rule({
    workspace = "1",
    monitor   = LAPTOP,
    default   = true,
})
