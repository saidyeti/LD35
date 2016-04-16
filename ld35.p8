pico-8 cartridge // http://www.pico-8.com
version 5
__lua__
local frames={64,65,66,67}
local ballframes = {
 {67,false,false},
 {66,false,false},
 {65,false,false},
 {64,false,false},
 {67,true,true},
 {66,true,true},
 {65,true,true},
 {64,true,true}
}
local frame=nil
local delay = nil
local delaylength = 3
local mapoffset=nil
local mapoffsetlimit = 32
local tilesize = 8

function player (x,y)
 local self = {}
 
 self.x = x
 self.y = y
 
 self.frame = 0
 self.frames = {0}
 
 return self
end


function _init()
 frame = 1
 delay = delaylength
 mapoffset = 0
 music(0)
end

function _update()
 --animate player
 delay -= 1
 if delay == 0 then 
  frame += 1
  if (frame > #ballframes) frame = 1
  delay = delaylength
 end
 
 --move map
 mapoffset += 1
 if mapoffset >= mapoffsetlimit then
  mapoffset = 0
 end
end

function _draw()
 cls()
 map(0,0,0 - mapoffset,0,20,16)
 local f = ballframes[frame]
 spr(f[1],40,40,1,1,f[2],f[3])
end

__gfx__
00000000888000000880008888000000000000000000000000000000000000000000000088800000000000008880000008800088880000000880008888000000
00008800808808808008008000800000000000000002220000000000000222000000880080880880000088008088088080080080008000008008008000800000
08008080800008088000000008000000000000000002002000000000000200200800808080000808080080808000080880000000080000008000000008000000
08008088888880008800088888880088000000022002002000000002200200200800808888888000080080888888800088000888888800888800088888880088
00888078780000000800807878008008000020222200202200002022220020220088807878000000008880787800000008008878780080080800887878008008
00000088880000000088008888008888000200222220002200020022222000220000008888000000000000888800000000888088880088880088808888008888
000008888880000000000888888000000000222ff22202200000222ff22202200000088888800000000008888880000000000888888000000000088888800000
000000bebe200000000000bebe2000000000001f1f2222000000001f1f2222000000001e1e200000000000bebe200000000000bebe200000000000bebe200000
00000008ee22000000000008ee22000000000008ff00000000000008ff00000000000008ee22000000000008ee22000000000008ee22000000000008ee220000
000000003000e0000000e0003000000000000f00c000000000000000c000f00000000000c000e000000000003000e0000000e000300000000000e00030000000
00000eee33eee00000000eee33eee000000000ffccff0000000000ffccff0000000000eecceee00000000eee33eee00000000eee33eee00000000eee33eee000
0000e00333000000000000033300e0000000000cccc0f00000000f0cccc0000000000e0cccc000000000e00333000000000000033300e000000000033300e000
00000003330000000000000333000000000000007700000000000000770000000000000077000000000000033300000000000003330000000000000333000000
0000000333030000000000033303000000000000fff9000000000000ff00000000000000ee000000000000033303000000000303330000000000000333030000
0000000033033300000000003303330000000000f000000000000000ff00000000000000ee000000000000003303330000033303330000000000000033033300
00000000033300000000000003330000000000009000000000000000990000000000000099000000000000000333000000000333000000000000000003330000
00000000088888800000000008888880ff777fffffffffffcccccccccccccccc000000050000000000000005000000000000000500000000dd0000dd00000000
00000000880000080000000088000008ffff97ffffffffffcccccccccccccccc0000000500000000000000050000000000000005000000000d0000d000111000
00888808800000000088880880000000fffff977ffffffffcc77cccc777ccccc000000050000000000000005000000000000000500000000dd0000dd01111101
08000888888888800800088888888880777ffff9ffffffffc7cc7cc7ccc7cccc000000050000000000000005000000000000000500000000d000000d01111101
08000078780000880800007878000088ff97ffffffffffffcccccccccccccccc0000000500000000000000050000000000000005000000000dddddd011811110
08080088880000080800008888000008ff977fffffffffffcccccccccccccccc000007656700000000000765670000000000076567000000dd0ddd0d11111111
080808888880080808000888888000087ffffff7ffffffffcccccccccccccccc0000767675700000000075667560000000007576765000000dddddd00fffff01
088800bebe200888080000bebe200008977fff99ffffffffcccc7ccccccccccc000075775650000000007675665000000000767556600000d0d00d0d00000000
00000008ee22000008000008ee220008cccccccccccccccccc77c77ccccccccc0000677677600000000066667660000000006776776000000dd00dd000000000
000000003000e0000800e00030000808ccccccccccccccccc7ccccc7cccccccc00007557567000000000567656700000000076576570000000d00d0000111000
00000eee33eee00008000eee33eee088cccccccccccccccccccccccccccccccc000007766700000000000756670000000000077667000000ddd00ddd01111100
0000e00333000000080000033300e000ccccccccccc77ccccccccccccccccccc000000000000000000000000000000000000000000000000d000000d01111101
00000003330000000080000333000000cccccccccc7cc7cccccccc77cccccccc0000000000000000000000000000000000000000000000000dddddd011811111
00000003330300000080080333030000ccccccccccccccccccccc7cc7ccccccc000000000000000000000000000000000000000000000000dd0ddd0d11111110
00000000330333000088080033033300cccccccccccccccccccc7cccc7cccccc0000000000000000000000000000000000000000000000000dddddd00fffff01
00000000033300000008800003330000cccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000d0d00d0d00000001
00eeee0000eeee0000eeee0000eeee00ccccccccccccccccffffffffffffffffffffffffffffffff1111111111111111ccccccccc7cccccc7777777777777777
0ee8eee00ee88ee00eee8ee00eeeeee0ccccccccccccccccffffffffffffffffffffffffffffffff1111111111111111cc77cccc777ccccc1711177117111717
ee8eeeeeee8ee8eeeeeee8eeeeeee8eeccccccccccccccccfffff777777fff7fffffffffffffffff1111111111111111c77777cccccccccc1111111111111111
e8eeeeeeeeeeeeeeeeeeee8eeeeeee8eccccccccccccccccffff7777f7f77fffffffffffffffffff1111111111111111cccccccccccccccc1111111111111111
eeeeeeeeeeeeeeeeeeeeeeeeeeeeee8ecccccccccccccccc7777f7ff7f7ff7fffffff7777fffffff1111111111111111cccccccccccc7c771111111111111111
eeeeeeeeeeeeeeeeeeeeeeeeeeeee8eecccccccccccccccc7f7f7ffffffffffff77777f7f7ffffff1111111111111111ccccccccccc777771111111111111111
0eeeeee00eeeeee00eeeeee00eeeeee0ccccccccccccccccffffffffffffffff77f7f7ffff77777f1111111111111111cccc77cccccccccc1111111111111111
00eeee0000eeee0000eeee0000eeee00ccccccccccccccccffffffffffffffff7f7f7ffffff7ffff1111111111111111ccc7777ccccccccc1111111111111111
4040040440044004bbbbbbbb92929292ccccccccccccccccffffffffffffffffffffffffffffffff1111111111111111cccccccccc7777cc0000000000000000
444004444004400400bbbbbb00929292ccccccccccccccccffffffffffffffffffffffffffffffff1111111111111111ccccccccc777777c0000000000000000
44444444444444440000bbbb000092929999999999999999ffffffffffffffffffffffffffffffff1111111111111111cccccccccccccccc0000000000000000
44444444044444400000abbb0000a2929999999999999999fffffff7777777f7fffffffff77777771111111111111111c7ccc77ccccccccc0000000000000000
4444444404444440000a00bb000a0092ccccccccccccccccfffff7777f7f7f7ffffff7777f7f7f7f111111111111111177777777cccccccc0000000000000000
444444440444444000a000bb00a00092eeeeeeeeeeeeeeeef7f7f7f7f7f7f7ffff7777fffff7f7ff1111111111111111ccccccccccc77ccc0000000000000000
44400444044004400a00000b0a000002ccccccccccccccccffffffffffffffffffffffffffffffff1111111111111111cccccccccc7777cc0000000000000000
4440044404400440a000000ba00000027777777777777777ffffffffffffffffffffffffffffffff1111111111111111cccccccccccccccc0000000000000000
00000088880000000880008888000000000888800008888000000000888000000880008888000000000000008880000000000000888000000880008888000000
00000078780000008008007878000000000787800007878000008800808808808008008000800000000088008088088000008800808808808008008000800000
00000088880000008080008888000000000888800008888008008080800008088000000008000000080080808000080808008080800008088000000008000000
00000888888000808000088888800880008888880088888808008088888880008800088888880088080080888888800008008088888880008800088888880088
08800080880008888000008880008008000000000008888000888078780000000800807878008008008880787800000000888078780000000800807878008008
80000880888008088000008888000008000000000000000000000088880000000088008888008888000000888800000000000088880000000088008888008888
80008080808000080800008808800088000000000000000000000888888000000000088888800000000008888880000000000888888000000000088888800000
8008008080888880008888880088888000000000000000000000001f1f2200000000001f1f2200000000009999900000000000aaaaa00000000000aaaaa00000
08800080800000000000008080000000000000000000000000000008ff00000000000008ff00000000000009990000000000000aaaaa00000000000aaa000000
00000080800000000088008080008880000000000000000000000000c000f00000000000c000f000000009009000000000000000a000a00000000a00a0000000
000000808000000000800880800080880000000000000000000000ffccff0000000000ffccff0000000000999999000000000aaaaaaaa000000000aaaaaa0000
00000080800880000080880008000008000000000000000000000f0cccc0000000000f0cccc0000000000009999090000000a00aaa0000000000000aaaa0a000
0088008080800800008880000880000800000000000000000000000077000000000000007700000000000000990000000000000aaa00000000000000aa000000
08008080808808000000000000088888000000000000000000000000ff00000000000000ff00000000000000990000000000000aaa0a000000000000aa000000
08000080800008000000000000000000000000000000000000000000ff00000000000000ff000000000000009900000000000000aa0aaa0000000000aa000000
008888808888800000000000000000000000000000000000000000009900000000000000990000000000000099000000000000000aaa000000000000aa000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
444545445c454d454445444544454444444c4444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5d444c4444445c445d4d444c445d5c4444444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
444544454d454c45444544454445445d44445c44000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5c4d445c5d44444d445c4d445c4444444c444444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5454545454545454545454545454545454545454000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4849464748494647484946474849464748494647000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5859565758595657585956575859565758595657000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4849464748494647484946474849464748494647000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5859565758595657585956575859565758595657440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4b4b4b4b4b4b4b4b4a4b4a4b4a4b4a4b4a4b4a4b440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4a5b5a5b5a5b5a5b5a5b5a5b5a5b5a5b4a5b5a5b440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4a4b4a4b4a4b4a4b4a4b4a4a4b4a4a4b4a4b4a4b440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4a5b5a5b4a5b5a5b4a5b5a4a5b5a4a5b5a5b5a5b440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5353535353535353535353535353535353535353000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
010f00200c3050030500305003050c30500305213452134524345263450e305263450c3050030500305003050c3050030500305003050c305003052134521345243452634500305263450c305213452434526345
010f0020000000000000000000001a635000000000000000000000000000000000001a635000000000000000000000000000000000001a635000000000000000000000000000000000001a635000000000000000
010f002002170021700e1750010004170041701017500100051700517011175001000010000100001000010007170071701317500100051700517011175001000417004170101750010000170001700c17500100
010f002000700007000070000700007000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001d7720070021772247722477224772
010f002026772247722177226772007020070226772247722177226772007020e7022677224772217720070200702007022677226772247722477221772217721f7721f7721d7721d7721a7721a7721877218772
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
01 00010203
02 00010204
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344

