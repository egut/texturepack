

faithful.zip:
	wget -q 'https://minecraft.curseforge.com/projects/faithful-32x/files/latest' -O faithful.zip
	@echo "Faitful homepage: https://minecraft.curseforge.com/projects/faithful-32x"

lithos.zip:
	wget -q https://minecraft.curseforge.com/projects/lithos-core-32x-1-6-1-11-complete/files/latest -O lithos.zip
	@echo "Lithos Core homepage: https://minecraft.curseforge.com/projects/lithos-core-32x-1-6-1-11-complete"

lithos-luminous.zip:
	wget -q https://minecraft.curseforge.com/projects/lithos-luminous-32x-add-on/files/latest -O lithos-luminous.zip
	@echo "Lithos lithos-luminous: https://minecraft.curseforge.com/projects/lithos-luminous-32x-add-on"

brick.zip:
	wget -q http://download2008.mediafire.com/8lm4j96g3xkg/z1bfa0qn33b24sz/%5B32x32%5DFaithful+Dirty+Bricks+V1.0+For+MC+1.10.zip -O brick.zip
	@echo "Dirty Bricks homepage: http://www.minecraftforum.net/forums/mapping-and-modding/resource-packs/2727785-dirty-bricks-resource-pack-adds-8-random-dirty"

redstone.zip:
	wget -q https://minecraft.curseforge.com/projects/redstone-dust-power-level-display-3d-models-64px/files/2322557/download -O redstone.zip
	@echo "Redstone Power levels homepage: https://minecraft.curseforge.com/projects/redstone-dust-power-level-display-3d-models-64px"
	
download: faithful.zip lithos.zip brick.zip redstone.zip lithos-luminous.zip


faithful: faithful.zip
	unzip -q faithful.zip -d faithful
	
lithos: lithos.zip
	unzip -q lithos.zip -d lithos

lithos-luminous: lithos-luminous.zip
	unzip -q lithos-luminous.zip -d lithos-luminous

brick: brick.zip
	unzip -q brick.zip -d brick

redstone: redstone.zip
	unzip -q redstone.zip -d redstone

unpack: faithful lithos brick redstone lithos-luminous

clear_pack:
	rm -rf ZardozPack

pack: clear_pack unpack
	mkdir -p ZardozPack 
	cp -ar faithful/* ZardozPack
	cp -ar lithos/* ZardozPack
	cp -ar brick/* ZardozPack
	cp -ar redstone/* ZardozPack
	cp lithos-luminous/assets/minecraft/textures/blocks/purpur_* ZardozPack/assets/minecraft/textures/blocks/
	rm -f ZardozPack/readme* credits_meri-the-lapisdemon.txt
	cp zardoz.png ZardozPack/pack.png
	cp readme.txt pack.mcmeta ZardozPack
	cd ZardozPack && zip -r "../Zardoz 1.12.zip" *

install: pack
	cp "Zardoz 1.12.zip" ~/.minecraft/resourcepacks/

clear: 
	rm -f faithful.zip lithos.zip brick.zip redstone.zip lithos-luminous.zip
	rm -rf faithful lithos brick redstone lithos-luminous 
	rm -rf ZardozPack
	rm -f "Zardoz 1.12.zip"
