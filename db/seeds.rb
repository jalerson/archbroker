# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Creating server regions...'
na = ServerRegion.create(name: 'North American', acronym: 'NA')
eu = ServerRegion.create(name: 'European', acronym: 'EU')

puts 'Creating NA servers...'
aranzeb = Server.create(name: 'Aranzeb', server_region: na)
calleil = Server.create(name: 'Calleil', server_region: na)
enla = Server.create(name: 'Enla', server_region: na)
ezi = Server.create(name: 'Ezi', server_region: na)
inoch = Server.create(name: 'Inoch', server_region: na)
kyrios = Server.create(name: 'Kyrios', server_region: na)
lucius = Server.create(name: 'Lucius', server_region: na)
naima = Server.create(name: 'Naima', server_region: na)
ollo = Server.create(name: 'Ollo', server_region: na)
salphira = Server.create(name: 'Salphira', server_region: na)
tahyang = Server.create(name: 'Tahyang', server_region: na)

puts 'Creating EU servers...'
aier = Server.create(name: 'Aier', server_region: eu)
dahuta = Server.create(name: 'Dahuta', server_region: eu)
eanna = Server.create(name: 'Eanna', server_region: eu)
jadunar = Server.create(name: 'Janudar', server_region: eu)
kyprosa = Server.create(name: 'Kyprosa', server_region: eu)
melisara = Server.create(name: 'Melisara', server_region: eu)
nebe = Server.create(name: 'Nebe', server_region: eu)
nui = Server.create(name: 'Nui', server_region: eu)
orchidna = Server.create(name: 'Orchidna', server_region: eu)
shatigon = Server.create(name: 'Shatigon', server_region: eu)

puts 'Creating continents...'
nuia = Continent.create(name: 'Nuia')
haranya = Continent.create(name: 'Haranya')
auroria = Continent.create(name: 'Auroria')

puts 'Creating Nuia regions...'
dewstone = Region.create(name: 'Dewstone Plains', continent: nuia, map: '/maps/nuia/dewstone.jpg')
gweonid = Region.create(name: 'Gweonid Forest', continent: nuia, map: '/maps/nuia/gweonid.jpg')
lilyut = Region.create(name: 'Lilyut Hills', continent: nuia, map: '/maps/nuia/lilyut.jpg')
solzreed = Region.create(name: 'Solzreed Peninsula', continent: nuia, map: '/maps/nuia/solzreed.jpg')
white = Region.create(name: 'White Arden', continent: nuia, map: '/maps/nuia/whitearden.png')
marianople = Region.create(name: 'Marianople', continent: nuia, map: '/maps/nuia/marianople.png')
halcyona = Region.create(name: 'Halcyona', continent: nuia, map: '/maps/nuia/halcyona.png')
hellswamp = Region.create(name: 'Hellswamp', continent: nuia, map: '/maps/nuia/hellswamp.png')
sanddeep = Region.create(name: 'Sanddeep', continent: nuia, map: '/maps/nuia/sanddeep.png')
two = Region.create(name: 'Two Crowns', continent: nuia, map: '/maps/nuia/twocrowns.png')
cinderstone = Region.create(name: 'Cinderstone Moore', continent: nuia, map: '/maps/nuia/cinderstone.png')
karkasse = Region.create(name: 'Karkasse Ridgelands', continent: nuia, map: '/maps/nuia/karkasse.png')

puts 'Creating Haranya regions...'
arcum = Region.create(name: 'Arcum Iris', continent: haranya, map: '/maps/haranya/arcum.jpg')
falcorth = Region.create(name: 'Falcorth Plains', continent: haranya, map: '/maps/haranya/falcorth.jpg')
tigerspine = Region.create(name: 'Tigerspine Mountains', continent: haranya, map: '/maps/haranya/tigerspine.jpg')
mahadevi = Region.create(name: 'Mahadevi', continent: haranya, map: '/maps/haranya/mahadevi.jpg')
solis = Region.create(name: 'Solis Headlands', continent: haranya, map: '/maps/haranya/solis.jpg')
villanelle = Region.create(name: 'Villanelle', continent: haranya, map: '/maps/haranya/villanelle.jpg')
silent = Region.create(name: 'Silent Forest', continent: haranya, map: '/maps/haranya/silent.jpg')
ynystere = Region.create(name: 'Ynystere', continent: haranya, map: '/maps/haranya/ynystere.jpg')
rookborne = Region.create(name: 'Rookborne Basin', continent: haranya, map: '/maps/haranya/rookborne.jpg')
windscour = Region.create(name: 'Windscour Savannah', continent: haranya, map: '/maps/haranya/windscour.jpg')
perinoor = Region.create(name: 'Perinoor Ruins', continent: haranya, map: '/maps/haranya/perinoor.jpg')
hasla = Region.create(name: 'Hasla', continent: haranya, map: '/maps/haranya/hasla.jpg')

puts 'Creating Auroria regions...'
Region.create(name: 'Marcala', continent: auroria, map: '/maps/auroria/marcala.jpg')
Region.create(name: 'Calmlands', continent: auroria, map: '/maps/auroria/calmlands.jpg')
Region.create(name: 'Heedmar', continent: auroria, map: '/maps/auroria/heedmar.jpg')
Region.create(name: 'Nuimari', continent: auroria, map: '/maps/auroria/nuimari.jpg')
Region.create(name: 'Diamond Shores', continent: auroria, map: '/maps/auroria/diamond.jpg')
Region.create(name: 'Exeloch', continent: auroria, map: '/maps/auroria/exeloch.jpg')
Region.create(name: 'Sungold Fields', continent: auroria, map: '/maps/auroria/sungold.jpg')

puts 'Creating house categories...'
house = Category.create(name: 'House')
farm = Category.create(name: 'Farm')

puts 'Creating house types...'
villa = Type.create(name: 'Villa Houses (16x16)')
chalet = Type.create(name: 'Chalet Houses (24x24)')
manor28 = Type.create(name: 'Manor Houses (28x28)')
cottage = Type.create(name: 'Cottage House (16x16)')
manor24 = Type.create(name: 'Manor Houses (24x24)')
town = Type.create(name: 'Town Houses (24x24)')
farmhouse = Type.create(name: 'Farm Houses (24x24)')
marinehouse = Type.create(name: 'Marine Houses (24x24)')
crafting = Type.create(name: 'Crafting Houses (28x28)')
mansion = Type.create(name: 'Mansion Houses (44x44)')

puts 'Creating farm types...'
smallfarm = Type.create(name: 'Small Farm (8x8)')
largefarm = Type.create(name: 'Large Farm (16x16)')
underwater = Type.create(name: 'Underwater Farm (16x16)')

puts 'Creating properties...'
Property.create(name: 'Swept-Roof Villa', plan_cost: 15, dimensions: '16x16', decor_limit: 45, security_deposit: 30, taxes: 10, type: villa, category: house)
Property.create(name: 'Swept-Roof Chalet', plan_cost: 100, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: chalet, category: house)
Property.create(name: 'Swept-Roof Manor', plan_cost: 500, dimensions: '28x28', decor_limit: 150, security_deposit: 50, taxes: 25, type: manor28, category: house)
Property.create(name: 'Rustic Spring Cottage', plan_cost: 15, dimensions: '16x16', decor_limit: 45, security_deposit: 20, taxes: 10, type: cottage, category: house)
Property.create(name: 'Stone Spring Cottage', plan_cost: 15, dimensions: '16x16', decor_limit: 45, security_deposit: 20, taxes: 10, type: cottage, category: house)
Property.create(name: 'Tudor Spring Cottage', plan_cost: 15, dimensions: '16x16', decor_limit: 45, security_deposit: 20, taxes: 10, type: cottage, category: house)
Property.create(name: 'Rustic Slate Cottage', plan_cost: 15, dimensions: '16x16', decor_limit: 45, security_deposit: 20, taxes: 10, type: cottage, category: house)
Property.create(name: 'Stone Slate Cottage', plan_cost: 15, dimensions: '16x16', decor_limit: 45, security_deposit: 20, taxes: 10, type: cottage, category: house)
Property.create(name: 'Tudor Slate Cottage', plan_cost: 15, dimensions: '16x16', decor_limit: 45, security_deposit: 20, taxes: 10, type: cottage, category: house)
Property.create(name: 'Rustic Rose Cottage', plan_cost: 15, dimensions: '16x16', decor_limit: 45, security_deposit: 20, taxes: 10, type: cottage, category: house)
Property.create(name: 'Stone Rose Cottage', plan_cost: 15, dimensions: '16x16', decor_limit: 45, security_deposit: 20, taxes: 10, type: cottage, category: house)
Property.create(name: 'Tudor Rose Cottage', plan_cost: 15, dimensions: '16x16', decor_limit: 45, security_deposit: 20, taxes: 10, type: cottage, category: house)
Property.create(name: 'Rustic Spring Manor', plan_cost: 100, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: manor24, category: house)
Property.create(name: 'Stone Spring Manor', plan_cost: 100, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: manor24, category: house)
Property.create(name: 'Tudor Spring Manor', plan_cost: 100, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: manor24, category: house)
Property.create(name: 'Rustic Slate Manor', plan_cost: 100, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: manor24, category: house)
Property.create(name: 'Stone Slate Manor', plan_cost: 100, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: manor24, category: house)
Property.create(name: 'Tudor Slate Manor', plan_cost: 100, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: manor24, category: house)
Property.create(name: 'Rustic Rose Manor', plan_cost: 100, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: manor24, category: house)
Property.create(name: 'Stone Rose Manor', plan_cost: 100, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: manor24, category: house)
Property.create(name: 'Tudor Rose Manor', plan_cost: 100, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: manor24, category: house)
Property.create(name: 'Rustic Spring Townhouse', plan_cost: 150, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: town, category: house)
Property.create(name: 'Stone Spring Townhouse', plan_cost: 150, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: town, category: house)
Property.create(name: 'Tudor Spring Townhouse', plan_cost: 150, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: town, category: house)
Property.create(name: 'Rustic Slate Townhouse', plan_cost: 150, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: town, category: house)
Property.create(name: 'Stone Slate Townhouse', plan_cost: 150, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: town, category: house)
Property.create(name: 'Tudor Slate Townhouse', plan_cost: 150, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: town, category: house)
Property.create(name: 'Rustic Rose Townhouse', plan_cost: 150, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: town, category: house)
Property.create(name: 'Stone Rose Townhouse', plan_cost: 150, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: town, category: house)
Property.create(name: 'Tudor Rose Townhouse', plan_cost: 150, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: town, category: house)
Property.create(name: 'Thatched Farm House', plan_cost: 50, dimensions: '24x24', decor_limit: 45, security_deposit: 30, taxes: 15, type: farmhouse, category: house)
Property.create(name: 'Breezy Bungalow', plan_cost: 300, dimensions: '24x24', decor_limit: 100, security_deposit: 30, taxes: 15, type: marinehouse, category: house)
Property.create(name: 'Fellowship Plaza', plan_cost: 500, dimensions: '28x28', decor_limit: 150, security_deposit: 50, taxes: 25, type: crafting, category: house)
Property.create(name: 'Mansion', plan_cost: 1000, dimensions: '44x44', decor_limit: 200, security_deposit: 100, taxes: 50, type: mansion, category: house)

Property.create(name: 'Small Scarecrow Garden', plan_cost: nil, dimensions: '8x8', decor_limit: nil, security_deposit: 10, taxes: 5, type: smallfarm, category: farm)
Property.create(name: 'Scarecrow Garden', plan_cost: nil, dimensions: '16x16', decor_limit: nil, security_deposit: nil, taxes: nil, type: largefarm, category: farm)
Property.create(name: 'Aqua Farm', plan_cost: 20, dimensions: '16x16', decor_limit: nil, security_deposit: nil, taxes: nil, type: underwater, category: farm)