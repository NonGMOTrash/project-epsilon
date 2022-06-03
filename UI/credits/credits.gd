extends ColorRect

var sound_credits := [
	'"slashkut"\n by Abyssmal',
	'"Slash cut"\n by spycrah',
	'"Sword Swipe11"\n by LukeSharples',
	'"Drawing sword from scabbard" by giddster',
	'"Sword Attack"\n by Saviraz',
	'"sword against sword"\n by Fenodyrie',
	'"Medieval metal shield set down on stone floor"\n by ZapSplat',
	'"Heavy metal bar impact, with a clang, cluck, thump 3"\n by ZapSplat',
	'"Ambiance_Wind_Forst_Calm_Loop"\n by Nox Sound',
	'"cave_ambience_with_water_drips"\n by seanmorrissey96',
	'"Rustling Grass 2"\n by morganpurkins',
	'"Footstep_Wood_Heel_1"\n by GiocoSound',
	'"Footsteps Stone (1)"\n by Wdomino',
	'"footstep-carpet"\n by swuing',
	'"A_Step_On_Dirt"\n by MATRIXXX_',
	'"Footsteps on Sand"\n by BrendanSound12',
	'"Get Item 4 8 Bit"\n Mrthenoronha',
	'"armor10"\n pegingrillin',
	'"Ambiance_Wind_Forest_Calm_Loop"\n by Nox Sound',
	'"9mm gunside"\n by cedarstudios',
	'"Pistol Cock"\n by nebulasnails',
	'"AR15 pistol load and chamber"\n by michorvath',
	'"bullet ricochet"\n by aust_paul',
	'"Hit 4 8 Bit"\n by Mrthenoronha',
	'"bow01"\n by Erdie',
	'"Arrow Strike"\n by plantmonkey',
	'"arrow_damage" by braqoon',
	'"Arrow Impact 2" by LiamG_SFX',
	'"Regular Arrow Shot with rattle slow draw"\n by brendan89',
	'"Wooden Creek"\n by Mafon2',
	'"CLICK_143", by Jaszunio15',
	'"Wooden Hover"\n by BenjaminNelan',
	'"Access Denied"\n by suntemple',
	'"Spiketrap"\n by Deathscyp',
	'"Wood Break"\n by Deathscyp',
	'"Retro Video Game Death"\n by SRJA_Gaming',
	'"Healing 2 (Tranquillity)" by SilverIllusionist',
	'"healpop"\n by shyguy014',
	'"Error"\n by Isaac20000',
	'"shine"\n from 20xx.io',
	'"hvyelec"\n by inferno',
	'"Electricity spark (sound design)"\n by ZapSplat',
	'"Enchant"\n by qubodup',
	'"Menu FX 03"\n by by NightFlame',
	'"Wooden Object Take"\n by Kostas17',
	'"Medieval spear swing 2"\n by Still North Media',
	'"Gore, beheading, chopping off head"\n by 344 Audio',
	'"Spear throw and stick into ground with slight vibration of the wooden spear pole on impact. Version 1"\n by ZapSplat',
	'"Sharp wooden post, stake, dig into soil, ground 4"\n by ZapSplat',
	'"Axe Swing, hit body against wood, metal clang, impact squelch 3"\n by ZapSplat',
	'"Spear thrown and stick into ground with slight vibration of wooden spear pole on impact. Version 5"\n by ZapSplat',
	'"Sword, stab through chain mail into flesh, sharp metallic scrape followed by a quick, crunchy slash / impact, close perspective"\n by Audio Hero',
	'"2 x swords hit, impact 1"\n by ZapSplat',
	'"Whoosh Heavy Spear Hammer Large" by EminYILDIRIM',
	'"Knife, swish, swipe, through air, slashing movements 3"\n by ZaplSplat',
	'"Knife, dagger, blade draw, pull from sheeth7"\n by ZapSplat',
	'"Knife, dagger blade draw, pull from sheath"\n by ZapSplat',
	'"Bullet pass, whizz by 2"\n by ZapSplat',
	'"Bullet whizz into person, body with an impact and light splat. Version 1"\n by ZapSplat',
	'"Metal hit, impact, sharp flick, tinny 1"\n by ZapSplat',
	'"Horror, knife stab into flesh then pull out, very squelchy 3"\n by ZapSplat',
	'"Bolt Cutter"\n by jameswrowles',
	'"mini crossbow foley"\n by nettimato',
	'"bow02"\n by Erdie',
	'"Medieval crossbow bolt pass by 1" by Still North Media',
	'"Fast swing, whoosh into a metal hit, thud or clunk, could be\nsword hitting shield or armor. Version 1"\n by ZapSplat',
	'"PotionDrinkLong"\n by Jamius',
	'"Potion - drink - swallow"\n by vlnpetiteau',
	'"Bottle Shattering"\n by spookymodem',
	'"Soft Wind"\n by Animate_42',
	'"teleport"\n by Leszerk_Szary',
	'"Blowpipe"\n by loudernoises',
	'"Dart strikes dartboard 5"\n by ZapSplat',
	'"Blood Impact"\n by EminYILDIRIM',
	'"Keys17"\n by egolessdub',
	'"Eating an apple"\n by domvoice',
	'"Door_Unlocking"\n by IPaddeh',
	'"Block of unused staples drop on table"\n by ZapSplat',
	'"Breeze block drop on hard ground 4"\n by ZapSplat',
	'"Fabric first aid medical kit with cellophane wrapped bandage inside, open velcro 2"\n by ZapSplat',
	'"Fabric first aid medical kit with cellophane wrapped bandages inside, handling, movement"\n by ZapSplat',
	'"Explosion 2"\n by LiamG_SFX',
	'"Sniper Scope zoom in 1"\n by Supakid13',
	'"Scope Click - Sniper Rifle (4)"\n by FilmmakersManual',
	'"Scope Click - Sniper Rifle (5)"\n by FilmmakersManual',
	'"Sniper Rifle Firing Shot (4)"\n by FilmmakersManual',
]

onready var sfx1 := $sound_credits/VBoxContainer_2/HBoxContainer/name
onready var sfx2 := $sound_credits/VBoxContainer_2/HBoxContainer_2/name

var num: int = 1

func set_sound_credit():
	num += 1
	if num > sound_credits.size():
		num = 0
	if (num / 2.0) != floor(num / 2.0): # is odd
		sfx1.text = sound_credits[num]
	else: # is even
		sfx2.text = sound_credits[num]

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	get_tree().change_scene("res://UI/title_screen/title_screen.tscn")
