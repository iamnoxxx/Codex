getgenv().FindBoss = function()
    local url = 'https://xeterapi.vercel.app/api/Saishi' -- Giả định API tương tự
    local chooses
    local foundServers = game:GetService('HttpService'):JSONDecode(game:HttpGet(url))
    for i, v in foundServers do
        if v.jobId ~= game.JobId then
            chooses = v
        end
    end
    game:GetService("TeleportService"):TeleportToPlaceInstance(4442272183, chooses.jobId, game.Players.LocalPlayer)
end

function CheckBoss()
    return game.Workspace.Enemies:FindFirstChild("Galley Captain") -- Kiểm tra sự tồn tại của Galley Captain
end

spawn(function()
    while task.wait(5) do -- Chờ 5 giây giữa các lần kiểm tra để giảm lag
        pcall(function()
            if not CheckBoss() then
                return FindBoss()
            end
        end)
    end
end)