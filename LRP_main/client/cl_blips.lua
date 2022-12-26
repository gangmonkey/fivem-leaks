local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	-- Postes de polices
	{title="Anarchy Hideout", colour=4, id=40, x=910.53, y=3577.51, z=33.52},
    {title="Sandy House", colour=0, id=40, x=1807.88, y=3915.25, z=33.91},
    {title="Sandy House", colour=0, id=40, x=1824.73, y=3733.51, z=34.13},
    {title="Route 68 Garage", colour=0, id=544, x=1178.46, y=2639.43, z=37.75},
    {title="Route 68 Dealer", colour=2, id=277, x=1223.46, y=2733.7, z=37.98},
    {title="Rockford Hills Dealer", colour=2, id=277, x=-791.48, y=-208.61, z=37.15},
    {title="Mike's PB", colour=47, id=124, x=-1534.15, y=134.08, z=56.3},
    {title="Worley’s Estate", colour=0, id=40, x=1399.61, y=1149.97, z=114.33},
    {title="Banham Canyon Mansion", colour=0, id=40, x=-2674.45, y=1320.38, z=152.01},
    {title="Simeons Dealer", colour=2, id=277, x=-36.93, y=-1097.77, z=26.42},
    {title="Grove St Dealer", colour=2, id=277, x=-18.33, y=-1657.46, z=29.48},
    {title="Grove St Hideout", colour=0, id=357, x=-100.44, y=-1802.6, z=26.97},
    {title="Grove St House", colour=0, id=40, x=115.08, y=-1965.09, z=21.32},
    {title="Weed Factory", colour=2, id=469, x=173.37, y=2786.92, z=45.65},
    {title="NWC Pent House", colour=46, id=675, x=-304.23, y=-701.8, z=30.32},
    {title="DemArbysBoiz", colour=4, id=40, x=-3125.82, y=802.8, z=17.72},
    {title="Wig's Crib", colour=0, id=419, x=-2596.21, y=1665.45, z=140.5},
    {title="Wig's Customs", colour=0, id=488, x=823.7, y=-993.57, z=26.5},
    {title="Wig's Estates", colour=38, id=40, x=1380.67, y=-738.41, z=67.23},
    {title="Huncho's Crib", colour=46, id=428, x=-2591.9, y=1919.48, z=167.33},
    {title="Foot Locker", colour=1, id=73, x=76.47, y=-1409.96, z=29.42},
    {title="Jebber710 Cookies Store", colour=2, id=140, x=-943.03, y=-1182.19, z=4.93},
    {title="Don's Pad", colour=47, id=140, x=-79.16, y=835.17, z=235.73},
    {title="Rofckford Hills Mansion", colour=0, id=40, x=-849.25, y=-25.33, z=39.59},
    {title="Vineyard Mansion", colour=0, id=40, x=-1887.31, y=2054.09, z=140.98},
    {title="ICE BOX", colour=3, id=207, x=-607.74, y=-256.47, z=36.38},
    {title="Vinewood Mansion", colour=0, id=40, x=-750.3, y=805.6, z=215.17},
    {title="Vinewood Mansion", colour=0, id=40, x=-1814.67, y=446.1, z=128.51},
    {title="Vinewood Mansion", colour=0, id=40, x=-149.07, y=907.77, z=235.66},
    {title="Vinewood Mansion", colour=0, id=40, x=-109.87, y=986.52, z=236.43},
    {title="Rockford Hills", colour=0, id=40, x=-817.91, y=267.11, z=86.4},
    {title="Richman Mansion", colour=0, id=40, x=-1466.22, y=-35.17, z=54.83},
    {title="Vinewood Hills House", colour=0, id=40, x=-537.46, y=815.42, z=197.52},
    {title="Vinewood Hills House", colour=0, id=40, x=-523.9, y=513.85, z=112.44},
    {title="Vinewood Hills House", colour=0, id=40, x=-701.06, y=644.43, z=155.18},
    {title="Vinewood Hills House", colour=0, id=40, x=-1136.58, y=374.48, z=71.34},
    {title="Spartanz Motorcycle Clubhouse", colour=76, id=492, x=-240.86, y=2590.52, z=52.95}, 
    {title="Underground Bunker", colour=0, id=557, x=159.7, y=2286.86, z=94.00},
    {title="The Royal Dubai Mansion", colour=46, id=293, x=-3341.8, y=1757.31, z=38.19},
    {title="Ocean’s Cabin", colour=18, id=270, x=-505.81, y=4945.32, z=147.6},
    {title="Bandits Mansion", colour=0, id=84, x=-2503.43, y=755.62, z=303.4},
    {title="Peaky Blinders", colour=46, id=389, x=353.06, y=21.89, z=85.33},
	{title="Harrison's Casino", colour=53, id=679, x=957.79, y=46.45, z=123.11},
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)